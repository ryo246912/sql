-- ・サブクエリを引数の場合INよりもEXISTSを使う
-- MEMO・INよりEXISTSの方が比較的速い
-- MEMO:①結合キー(この場合はid)にインデックスが張られていれば、Class_B1テーブルの実表を見に行かずインデックスを参照するだけで済む
-- MEMO:②EXISTSは1行でも条件に合致する行を見つけたら検索を打ち切り、INのように全表検索する必要がない
-- MEMO:INの引数にサブクエリを与えた場合、
-- MEMO:DBはまずサブクエリを実行し、
-- MEMO:一次的なワークテーブル（インラインビュー）に格納し、
-- MEMO:その後ビューを全件走査→コストがかかる、ワークテーブルにはインデックスが存在しない
-- MEMO:EXISTSではワークテーブルが作成されない
-- MEMO:ただ、INもパフォーマンスを上げる改善が図られるようになっているらしい

-- INの場合、遅い
SELECT
*
FROM
"Class_A1"
WHERE
id IN (
  SELECT
  id
  FROM
  "Class_B1"
);

-- EXISTSの場合
SELECT
  *
FROM
  "Class_A1" AS A
WHERE
  EXISTS (
    SELECT
      *
    FROM
      "Class_B1" AS B
    WHERE
      A.id = B.id
  );

-- INよりも結合を使う
-- MEMO・INのパフォーマンス改善として、結合に書き換える方法もある
-- MEMO:どちらかのインデックスを利用でき、サブクエリがなくなったので中間テーブルも作られない
SELECT
  *
FROM
  "Class_A1" AS A
  INNER JOIN "Class_B1" AS B ON A.id = B.id;


-- ・ソートを回避する
-- MEMO・集合演算子のALLオプションを使う
-- MEMO:UNION・INTERSECT・EXCEPTの集合演算子は重複削除のためソートが行われる
-- MEMO:重複を許容する場合はALL使うといい※ただDBMSによって実装状況にばらつきがある

-- UNIONの場合→重複排除のためにソートが行われる
SELECT
  *
FROM
  "Class_A1"
UNION
SELECT
  *
FROM
  "Class_B1";

-- UNION ALLの場合→重複あり
SELECT
  *
FROM
  "Class_A1"
UNION
ALL
SELECT
  *
FROM
  "Class_B1";

-- MEMO・DISTINCTの代わりにEXISTSを使う

-- DISTINCTを使う場合→重複を除く
SELECT DISTINCT
I.item_no
FROM
"Items" AS I
INNER JOIN "SalesHistory" AS S ON I.item_no = S.item_no;

-- DISTINCTの代わりにEXISTSを使う
SELECT
  *
FROM
  "Items" AS I
WHERE
  EXISTS (
    SELECT
      *
    FROM
      "SalesHistory" AS S
    WHERE
      I.item_no = S.item_no
  );

-- MEMO・極値関数(MAX/MIN)でインデックスを使う
-- MEMO:MAX・MINもソートが発生するが、インデックスを使うことで実表への検索は回避できる
SELECT
  MAX(item)
FROM
  "Items";

-- MEMO・WHEREで書ける条件はHAVINGで書かない
-- MEMO①GROUP BYによる集約はソートやハッシュの演算を行うので、行数を絞り込んだ方がソート負荷が軽減される
-- MEMO②WHERE句でインデックスを使用できる、HAVINGは集約後のビューに設定を行うがインデックスは引き継がないケースが多いらしい
-- MEMO・GROUP BY・ORDER BYはインデックスを使う
-- MEMO:GROUP BY・ORDER BYは並び替えのソートを行うため、インデックスを使うと高速化できる

-- HAVINGを使う場合
SELECT
  sale_date,
  SUM(quantity)
FROM
  "SalesHistory"
GROUP BY
  sale_date
HAVING
  sale_date = '2018-10-01';

-- WHEREを使う場合
SELECT
  sale_date,
  SUM(quantity)
FROM
  "SalesHistory"
WHERE
  sale_date = '2018-10-01'
GROUP BY
  sale_date;

-- インデックスの注意点
-- MEMO・インデックス列に加工(計算・関数)を行わない

-- NG例1-インデックス使われない
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 * 1.1 > 100;

-- OK例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 > 100 / 1.1;

-- NG例2-インデックス使われない
SELECT
  *
FROM
  SomeTable
WHERE
  SUBSTR(col_1, 1, 1) = 'a';

-- MEMO・インデックス列にNULLを存在させない、インデックスでのIS NULLは扱いが難しい

-- NG例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 IS NULL;

-- OK例-ただしコードの意味の混乱もあるので積極採用はしない
-- NULLはcol>0はunknownになるので選択されない
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 > 0;

-- MEMO・インデックスで否定形を使わない(<>・!=・NOT IN)

-- NG例-インデックス使用されない
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 <> 100;

-- MEMO・col_1/col_2に別々のインデックスがある場合、ORを使うとANDに比べて非効率

-- NG例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 > 100
  OR col_2 = 'abc';

-- MEMO・複合インデックスでは列の順番を崩さない

-- OK例1
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = 10
  AND col_2 = 100
  AND col_3 = 500;

-- OK例2
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = 10
  AND col_2 = 100;

-- NG例1
-- この場合もダメ、その場合は別々のインデックスに分けるべきとのこと
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = 10
  AND col_3 = 500;

-- MEMO・後方一致・中間一致のLIKEは用いない
-- MEMO:前方一致検索のときのみインデックスを用いる

-- NG例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 LIKE '%a';

-- OK例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 LIKE 'a%';

-- MEMO・暗黙の型変換を用いない・型変換は条件値の方で行う
-- MEMO:暗黙の型変換はオーバーヘッドを起こし、インデックスが使用されない

-- 文字列型のcol_1に対して、
-- NG例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = 10;

-- OK例
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = '10';

-- OK例2
SELECT
  *
FROM
  SomeTable
WHERE
  col_1 = CASE(10,AS CHAR(2));

-- 中間テーブルを減らす
-- MEMO・中間テーブルは以下の問題点があるので、不要な使い方はしない
-- MEMO:データを展開するためにメモリを消費する
-- MEMO:元テーブルに存在したインデックスを使うのが難しくなる

-- 集合関数等ではHAVINGを活用する
-- NG例-中間テーブルTMPを作成しなくても集計できる
SELECT
  *
FROM
  (
    SELECT
      sale_date,
      MAX(quantity) AS max_qty
    FROM
      "SalesHistory"
    GROUP BY
      sale_date
  ) AS TMP
WHERE
  max_qty >= 10;

-- OK例
SELECT
  sale_date,
  MAX(quantity) AS max_qty
FROM
  "SalesHistory"
GROUP BY
  sale_date
HAVING
  max_qty >= 10;

-- MEMO・IN述語で複数のキーを使用する際は一か所にまとめる
-- MEMO:行比較が取り入れられたことで=・<・>などの比較述語やINの引数にスカラ値だけでなく、リストをとることが可能になった
-- MEMO:文字結合と比較して、()ペアの場合、結合時の型変換を気にしない、列加工がないのでインデックスを使用できる点でいい

-- NG例-この場合はサブクエリが2回実行
SELECT
  id,
  state,
  city
FROM
  "Addresses1" AS A1
WHERE
  state IN (
    SELECT
      state
    FROM
      "Addresses2" AS A2
    WHERE
      A1.id = A2.id
  )
  AND city IN (
    SELECT
      city
    FROM
      "Addresses2" AS A2
    WHERE
      A1.id = A2.id
  );

-- OK例1-文字結合？の場合
SELECT
  id,
  state,
  city
FROM
  "Addresses1" AS A1
WHERE
  state || state || city IN (
    SELECT
      state || state || city
    FROM
      "Addresses2" AS A2
    WHERE
      A1.id = A2.id
  );


-- OK例2
SELECT
  id,
  state,
  city
FROM
  "Addresses1" AS A1
WHERE
  (state , state , city) IN (
    SELECT
      state , state , city
    FROM
      "Addresses2" AS A2
    WHERE
      A1.id = A2.id
  );
