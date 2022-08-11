-- 出席していない人を抽出
SELECT DISTINCT 
  M1.meeting,
  M2.person
FROM
  "Meetings" AS M1
  CROSS JOIN "Meetings" AS M2
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      "Meetings" AS M3
    WHERE
      M1.meeting = M3.meeting
      AND M2.person = M3.person
  );

-- すべての組み合わせ
-- MEMO FROM tblのテーブルをサブクエリにすることもできる
-- TODO DISTINCTで重複削除するのとどちらが軽いのだろう？
SELECT
  M1.meeting,
  M2.person
FROM
  (
    SELECT
      meeting
    FROM
      "Meetings"
    GROUP BY
      meeting
  ) AS M1
  INNER JOIN (
    SELECT
      person
    FROM
      "Meetings"
    GROUP BY
      person
  ) AS M2;

-- すべての組み合わせ、クロス結合 + DISTINCT
-- DISTINCTがないと、8列×8列で64レコードでてくる
SELECT DISTINCT 
  M1.meeting,
  M2.person
FROM
  "Meetings" AS M1
  CROSS JOIN "Meetings" AS M2

-- すべての教科が50点以上の生徒
SELECT
  T1.student_id,
  T1.subject,
  T1.score
FROM
  "TestScores" AS T1
WHERE
  NOT EXISTS(
    SELECT
      *
    FROM
      "TestScores" AS T2
    WHERE
      T2.score < 50
      AND T1.student_id = T2.student_id
  );

-- 算数の点数が80点以上
SELECT
  *
FROM
  "TestScores" AS T1
WHERE
  EXISTS(
    SELECT
      *
    FROM
      "TestScores" AS T2
    WHERE
      T2.subject = '算数'
      AND T2.score >= 80
      AND T2.student_id = T1.student_id
  );

-- 算数の点数が80点以上、国語の点数が50点以上
-- 両科目そろっているデータのみ見る
-- MEMO :・条件分岐による絞り込み→ただしこれだと算数80以上の時点で抽出される
-- MEMO :1 = CASE WHEN subject = '算数' AND score < 80 THEN 1
-- MEMO :        WHEN subject = '国語' AND score < 50 THEN 1
-- MEMO :        ELSE 0
-- MEMO :    END
-- MEMO :・二つの条件を揃っている
-- MEMO :col IN ('A','B') ~ GROUP BY col HAVING COUNT(*) = 2
SELECT
  *
FROM
  "TestScores" AS T1
WHERE
  subject IN ('算数','国語')
  AND
  NOT EXISTS(
    SELECT
      *
    FROM
      "TestScores" AS T2
    WHERE
      T2.student_id = T1.student_id
      AND 1 = CASE
        WHEN subject = '算数'
        AND score < 80 THEN 1
        WHEN subject = '国語'
        AND score < 50 THEN 1
        ELSE 0
      END
  )
GROUP BY student_id
HAVING
COUNT(*) = 2;

-- 1番行程まで完了しているプロジェクト
SELECT
  *
FROM
  "Projects" AS P1
WHERE
  EXISTS(
    SELECT
      MAX(step_nbr) AS m
    FROM
      "Projects" AS P2
    WHERE
      P2.status = '完了'
      AND P2.project_id = P1.project_id
    GROUP BY
      project_id
    HAVING
      m >= 1
  );

-- 1番行程まで完了しているプロジェクト(2番工程は待機のみを抽出)
-- 集合指向的な回答(ようは肯定から考える？<->二重否定)
SELECT
  *
FROM
  "Projects"
GROUP BY
  project_id
HAVING
  COUNT(*) = SUM(
    CASE
      WHEN step_nbr <= 1
      AND STATUS = '完了' THEN 1
      WHEN step_nbr > 1
      AND STATUS = '待機' THEN 1
      ELSE 0
    END
  );

-- 1番行程まで完了しているプロジェクト(2番工程は待機のみを抽出)
-- 述語論理的な回答(ようは二重否定？)
-- ↓ここ二重否定
-- NOT EXISTS(
--   ~
--   P2.status <> CASE
--   WHEN step_nbr <= 1 THEN '完了'
--   ELSE '待機'
--   END
-- )
-- 利点:パフォーマンスがよい(1行でも満たさない行が出た時点で探索打ち切り)、
-- 利点:結果に含められる情報が多い(HAVINGでまとめられないため)
-- 欠点:NOT EXISTS二重否定になるのでHAVINGより直感的にわかりにくい
SELECT
*
FROM
"Projects" AS P1
WHERE
NOT EXISTS(
  SELECT
  P2.status
  FROM
  "Projects" AS P2
  WHERE
  P1.project_id = P2.project_id
  AND
  P2.status <> CASE
  WHEN step_nbr <= 1 THEN '完了'
  ELSE '待機'
  END
);

-- ALL()及びANY()
-- SQLiteではWHERE内では使えない？
-- NOTE:・SQLiteではANY・SOME・ALL演算子は使えない
-- NOTE:ANY→IN()、ALL→NOT IN()で対応する
SELECT
  *
FROM
  "ArrayTbl"
WHERE
  1 = ALL (
    col1,
    col2,
    col3,
    col4,
    col5,
    col6,
    col7,
    col8,
    col9,
    col10
  );
SELECT
  *
FROM
  "ArrayTbl"
WHERE
  9 = ANY(
    col1,
    col2,
    col3,
    col4,
    col5,
    col6,
    col7,
    col8,
    col9,
    col10
  );

-- ANYの代わりにINでもいい
SELECT
  *
FROM
  "ArrayTbl"
WHERE
  9 IN (
    col1,
    col2,
    col3,
    col4,
    col5,
    col6,
    col7,
    col8,
    col9,
    col10
  );

-- すべてがNULLの行を抽出←ALL(col1,col2・・・) = NULLはダメ
-- NOTE:・COALESCE(col1,col2,・・・)は(最低2つ以上？)の引数のうちNULLではない最初の引数を返す
-- NOTE:そのため2つ以上の引数がどっちもNULLなら帰り値もNULLになることはある
SELECT
  *
FROM
  "ArrayTbl"
WHERE
  COALESCE (
    col1,
    col2,
    col3,
    col4,
    col5,
    col6,
    col7,
    col8,
    col9,
    col10
  ) IS NULL;

-- 演習5-1
-- これはvalがオール1以外でも抽出されるため、設問に対して100%な回答ではない
-- NOT EXISTSと自己結合
SELECT
  *
FROM
  "ArrayTbl2" AS A1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      "ArrayTbl2" AS A2
    WHERE
      A1.key = A2.key
      AND val <> NULL
  );

-- valがオール1のものを抽出
-- NOTE:NULLがある行の場合は、別途条件式を書くことを意識する
SELECT
  *
FROM
  "ArrayTbl2" AS A1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      "ArrayTbl2" AS A2
    WHERE
      A1.key = A2.key
      AND (val <> 1 OR val IS NULL)
  );

-- 演習5-2

SELECT
  *
FROM
  "Numbers" AS M1
WHERE
  num > 1
  AND NOT EXISTS (
    SELECT
      *
    FROM
      "Numbers" AS M2
    WHERE
      M1.num > M2.num
      AND M2.num > 1
      AND 0 = M1.num % M2.num
  )
