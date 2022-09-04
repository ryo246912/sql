-- 標準SQLではHAVINGのみでも使えるらしい(SQLiteだとGROUP BY必要？)
-- HAVINGのみの場合はテーブル全体が1行に集約されるらしい
SELECT
  '歯抜けあり' AS GAP
FROM
  "SeqTbl"
GROUP BY
  GAP
HAVING
  COUNT(*) <> MAX(seq);

-- 歯抜けの最小値を求める
-- ・NULLが入っている場合は正しくならない
-- ・1が抜けている場合は適切に出て来ない
SELECT
  MIN(seq + 1) AS GAP
FROM
  "SeqTbl"
WHERE
  (seq + 1) NOT IN (
    SELECT
      seq
    FROM
      "SeqTbl"
  );

-- 上の拡張1
-- 連続か否かを確認
SELECT
  CASE
    WHEN COUNT(*) = 0 THEN 'テーブルが空です'
    WHEN COUNT(*) <> MAX(seq) - MIN(seq) + 1 THEN '歯抜けなし'
    ELSE '連続'
  END AS gap
FROM
  "SeqTbl1";

-- 上の拡張2
-- 歯抜けの最小値を調べる
SELECT
  CASE
    WHEN COUNT(*) = 0
    OR MIN(seq) > 1 THEN 1 --下限が1でない場合→1を返す
    ELSE (
      SELECT
        MIN(seq + 1)
      FROM
        "SeqTbl2" AS S1
      WHERE
        NOT EXISTS (
          SELECT
            *
          FROM
            "SeqTbl2" AS S2
          WHERE
            S2.seq = S1.seq + 1
        )
    )
  END
FROM
  "SeqTbl2";

-- 最頻値を求める1
SELECT
  income,
  COUNT(*) AS cnt
FROM
  "Graduates"
GROUP BY
  income
HAVING
  COUNT(*) >= (
    SELECT
      COUNT(*)
    FROM
      "Graduates"
    GROUP BY
      income
  );
-- 最頻値を求める2
-- ALL述語は極値関数MAX・MINで代用可能
-- TODO・num >= ALL(サブクエリ)はnum >= (サブクエリ)でも可なの？
SELECT
  income,
  COUNT(*) AS cnt
FROM
  "Graduates"
GROUP BY
  income
HAVING
  COUNT(*) >= (
    SELECT
      MAX(cnt)
    FROM
      (
        SELECT
          COUNT(*) AS cnt
        FROM
          "Graduates"
        GROUP BY
          income
      ) AS TMP
  );

-- MEMO・COUNT(*)はNULLを数える一方、COUNT(col)はNULLを除外する
SELECT
  COUNT(*) AS cnt,
  COUNT(col_1) AS cnt_col1
FROM
  "Nulltbl";

-- 所属するすべての学生が提出済みの学部を求める1
-- COUNT(*)とCOUNT(col)を使用
SELECT
  dpt,
  COUNT(*) AS cnt,
  COUNT(sbmt_date) AS sbmt_cnt
FROM
  "Students"
GROUP BY
  dpt
HAVING
  cnt = sbmt_cnt;

-- 所属するすべての学生が提出済みの学部を求める2
-- CASE式を使う場合
-- MEMO・CASE式は各要素が特定の条件を満たすかを決める(フラグを立てる)関数=特性関数・(集合を定義するという意味で)定義関数と呼ぶ
SELECT
  dpt
FROM
  "Students"
GROUP BY
  dpt
HAVING
  COUNT(*) = SUM(
    CASE
      WHEN sbmt_date IS NOT NULL THEN 1
      ELSE 0
    END
  );


-- 第1問:クラスの75%以上の生徒が80点以上のクラスを選択
SELECT
  class
FROM
  "TestResults"
GROUP BY
  class
HAVING
  SUM(
    CASE
      WHEN score >= 80 THEN 1
      ELSE 0
    END
  ) >= COUNT(*) * 0.75;

-- 第2問：50点以上取った生徒のうち、男子の数が女子の数より多いクラスを選択
SELECT
  class
FROM
  "TestResults"
GROUP BY
  class
HAVING
  score >= 50
  AND SUM(
    CASE
      WHEN sex = '男' THEN 1
      ELSE 0
    END
  ) > SUM(
    CASE
      WHEN sex = '女' THEN 1
      ELSE 0
    END
  )

-- 第3問:女子の平均点が男子の平均点より高いクラスを選択
-- MEMO・AVG関数に空集合を渡したらNULLが返ってくる
SELECT
  class
FROM
  "TestResults"
GROUP BY
  class
HAVING
  AVG(
    CASE
      WHEN sex = '女' THEN score
      ELSE NULL
    END
  ) > AVG(
    CASE
      WHEN sex = '男' THEN score
      ELSE NULL
    END
  );

-- メンバー全員待機中のチームを選択1-HAVINGを使う場合
-- COUNT数が重要でない→EXISTS
SELECT
  team_id
FROM
  "Teams"
GROUP BY
  team_id
HAVING
  COUNT(*) = SUM(
    CASE
      WHEN STATUS = '待機' THEN 1
      ELSE 0
    END
  );

-- メンバー全員待機中のチームを選択1-2-HAVINGを使う場合(MAX&MIN)
SELECT
  team_id
FROM
  "Teams"
GROUP BY
  team_id
HAVING
  MAX(status) = '待機'
  AND
  MIN(status) = '待機';

-- メンバー全員待機中のチームを選択2-EXISTSを使う場合
SELECT
  team_id
FROM
  "Teams" AS T1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      "Teams" AS T2
    WHERE
      T1.team_id = T2.team_id
      AND STATUS <> '待機'
  )
GROUP BY
  team_id;

-- 資材のダブりがある拠点を選択する1-HAVINGの場合
-- MEMO・COUNT(DISTINCT col)で重複なしでカウントできる
SELECT
  center
FROM
  "Materials"
GROUP BY
  center
HAVING
  COUNT(material) <> COUNT(DISTINCT material);

-- MEMO・HAVING ～の部分をcolに追加することができる
SELECT
  center,
  (
    CASE
      WHEN COUNT(material) <> COUNT(DISTINCT material) THEN 'ダブり有り'
      ELSE 'ダブり無し'
    END
  ) AS STATUS
FROM
  "Materials"
GROUP BY
  center;

-- 資材のダブりがある拠点を選択する2-EXISTSの場合
SELECT
  center,
  material
FROM
  "Materials" AS M1
WHERE
  EXISTS(
    SELECT
      *
    FROM
      "Materials" AS M2
    WHERE
      M1.center = M2.center
      AND M1.receive_date <> M2.receive_date
      AND M1.material = M2.material
  );

-- Items1テーブルのすべての商品を揃える店舗を選択→これだと仙台店が入ってしまい不完全
-- MEMO・INNER JOINで出てこない行はSELECTされない
SELECT
  SI.shop
FROM
  "ShopItems" AS SI
  INNER JOIN "Items1" AS I ON SI.item = I.item
GROUP BY
  SI.shop
HAVING
  COUNT(SI.item) = (
    SELECT
      COUNT(item)
    FROM
      "Items1"
  );

-- Items1テーブルのすべての商品を揃える店舗を選択→以下が完全
-- MEMO・LEFT OUTER JOINをすることでNULLが現れ、COUNT(col)を比較する
SELECT
  SI.shop
FROM
  "ShopItems" AS SI
  LEFT OUTER JOIN "Items1" AS I ON SI.item = I.item
GROUP BY
  SI.shop
HAVING
  COUNT(SI.item) = (
    SELECT
      COUNT(item)
    FROM
      "Items1"
  )
  AND (
    COUNT(I.item) = (
      SELECT
        COUNT(item)
      FROM
        "Items1"
    )
  );

-- MEMO・COUNT(I.item)は3とは限らない・結合の影響で行数が変わっている
-- MEMO:SIとIの集合はそれぞれ、ON SI.item = I.itemの条件をもとに、元の集合とは異なる集合になっている
SELECT
  SI.shop,
  COUNT(SI.item),
  COUNT(I.item)
FROM
  "ShopItems" AS SI
  INNER JOIN "Items1" AS I ON SI.item = I.item
GROUP BY
  SI.shop;

-- LEFT OUTER JOINの結果
SELECT
  SI.shop,
  SI.item,
  I.item
FROM
  "ShopItems" AS SI
  LEFT OUTER JOIN "Items1" AS I ON SI.item = I.item;

-- 演習6-1
SELECT
  (
    CASE
      WHEN COUNT(gap) = 1 THEN '歯抜けあり'
      ELSE '歯抜けなし'
    END
  ) AS g
FROM
  (
    SELECT
      '歯抜けあり' AS gap
    FROM
      "SeqTbl"
    GROUP BY
      gap
    HAVING
      COUNT(*) <> MAX(seq)
  );

-- よりシンプルな書き方
SELECT
  CASE
    WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり'
    ELSE '歯抜けなし'
  END AS gap
FROM
  "SeqTbl";

-- 演習6-2:全員9月中に提出中の学部
SELECT
  dpt
FROM
  "Students"
GROUP BY
  dpt
HAVING
  sbmt_date >= '2018-09-01'
  AND sbmt_date < '2018-10-01'
  AND COUNT(*) = COUNT(sbmt_date);

-- 他の書き方
SELECT
  dpt
FROM
  "Students"
GROUP BY
  dpt
HAVING
  COUNT(*) = SUM(
    CASE
      WHEN sbmt_date BETWEEN '2018-09-01'
      AND '2018-09-30' THEN 1
      ELSE 0
    END
  );

-- 演習6-2:全員9月中に提出中の学部2-EXISTSを用いる
SELECT
  dpt
FROM
  "Students" AS S1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      "Students" AS S2
    WHERE
      S2.dpt = S1.dpt
      AND (
        S2.sbmt_date < '2018-09-01'
        OR S2.sbmt_date IS NULL
      )
      OR S2.dpt = S1.dpt
      AND (
        S2.sbmt_date >= '2018-10-01'
        OR S2.sbmt_date IS NULL
      )
  );

-- 演習6-3
SELECT
  SI.shop,
  COUNT(I.item) AS my_item_cnt,
  (
    SELECT
      COUNT(*)
    FROM
      "Items1"
  ) - COUNT(I.item) AS diff_cnt
FROM
  "ShopItems" AS SI
  LEFT OUTER JOIN "Items1" AS I ON SI.item = I.item
GROUP BY
  SI.shop;
