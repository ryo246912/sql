-- ①クロス結合による自己結合3^2=9レコード
SELECT
  P1.name AS name_1,
  P2.name AS name_2
FROM
  "Products" AS P1
  CROSS JOIN "Products" AS P2;

-- 内部結合:INNER JOIN tbl2 ON [条件式]
-- ②同一要素の組み合わせは除く、3*2=6レコード
-- MEMO 内部結合はINNER JOIN構文で書くと、うっかりON [条件式]書き忘れによるクロス結合を防げる(MySQLはエラーでないらしい)からおすすめらしい
SELECT
  P1.name AS name_1,
  P2.name AS name_2
FROM
  "Products" AS P1
  INNER JOIN "Products" AS P2 ON P1.name <> P2.name;

-- ③同じ組み合わせ+同じ要素の組は除く
-- MEMO ・ON P1.name > P2.name：文字コード順にソートして、前に来るやつのみTrue
-- MEMO ・文字型でも辞書順比較として機能する
SELECT
  P1.name AS name_1,
  P2.name AS name_2
FROM
  "Products" AS P1
  INNER JOIN "Products" AS P2 ON P1.name > P2.name;

-- 演習3-1
-- ④同じ組み合わせは除く
SELECT
  P1.name,
  P2.name
FROM
  "Products" AS P1
  INNER JOIN "Products" AS P2
WHERE
  P1.name >= P2.name
ORDER BY
  P1.name DESC;

-- 3つの組み合わせ
SELECT
  P1.name AS name_1,
  P2.name AS name_2,
  P3.name AS name_3
FROM
  "Products" AS P1
  INNER JOIN "Products" AS P2 ON P1.name > P2.name
  INNER JOIN "Products" AS P3 ON P2.name > P3.name;

-- 重複行を削除する:自己相関サブクエリ
-- MEMO ・重複行の抽出：rowid < (SELECT MAX(rowid) FROM ~ WHERE [条件式] )
-- MEMO ・同じカラムを抽出したのち、row < max(rowid)だと一番最後以外の重複を抽出できる
-- MEMO ・重複行を全部抽出する場合は不等式の部分はいらない
SELECT
  P1.rowid,
  P1.name,
  P1.price
FROM
  "Products2" AS P1
WHERE
  P1.rowid < (
    SELECT
      MAX(P2.rowid)
    FROM
      "Products2" AS P2
    WHERE
      P1.name = P2.name
      AND P1.price = P2.price
  );

-- 一番最初以外の重複行を抽出
SELECT
  P1.rowid,
  P1.name,
  P1.price
FROM
  "Products2" AS P1
WHERE
  rowid > (
    SELECT
      MIN(P2.rowid)
    FROM
      "Products2" AS P2
    WHERE
      P1.name = P2.name
      AND P1.price = P2.price
  );

-- EXISTS + (サブクエリ)を用いた重複行の抽出
SELECT
  P1.rowid,
  P1.name,
  P1.price
FROM
  "Products2" AS P1
WHERE
  EXISTS (
    SELECT
      *
    FROM
      "Products2" AS P2
    WHERE
      P1.name = P2.name
      AND P1.price = P2.price
      AND P1.rowid > P2.rowid
  );

-- 同じfamily_idなのに異なるaddressを抽出
SELECT
  A1.name,
  A1.family_id,
  A1.address
FROM
"Addresses" AS A1
INNER JOIN "Addresses" AS A2
WHERE
A1.family_id = A2.family_id
AND
A1.address <> A2.address;

-- 価格が同じ商品を抽出、EXISTSの場合
SELECT
  P1.name,
  P1.price
FROM
  "Products3" AS P1
WHERE
  EXISTS (
    SELECT
      *
    FROM
      "Products3" AS P2
    WHERE
      P1.name <> P2.name
      AND P1.price = P2.price
  )
ORDER BY
  P1.price;

-- 価格が同じ商品を抽出、EXISTSの場合
-- MEMO DISTINCTがないと重複が3つあると結果が2つ出てくる
SELECT DISTINCT 
  P1.name,
  P1.price
FROM
  "Products3" AS P1
  INNER JOIN "Products3" AS P2 ON P1.name <> P2.name
  AND P1.price = P2.price
ORDER BY
  P1.price;

-- 演習3-1
SELECT
  P1.name,
  P2.name
FROM
  "Products" AS P1
  INNER JOIN "Products" AS P2
WHERE
  P1.name >= P2.name
ORDER BY
  P1.name DESC;

-- 演習3-2
-- FIXME
SELECT
P.name,
ROW_NUMBER() OVER (PARTITION BY P.name) AS row_num,
COUNT(*) OVER (PARTITION BY P.name) AS cnt
FROM
"Products2" AS P;