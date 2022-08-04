-- NG例 NULLは選択できない、NULLは等式・不等式成立しない
SELECT
  *
FROM
  "Student"
WHERE
  age = 20
  OR age <> 20;

-- OK例 
SELECT
  *
FROM
  "Student"
WHERE
  age = 20
  OR age <> 20
  OR age IS NULL;

-- NG例 WHEN NILLは = NULLになるので成立しない
SELECT
  CASE
    age
    WHEN 22 THEN '○'
    WHEN NULL THEN '×'
  END AS '○×'
FROM
  "Student";

-- OK例
SELECT
  CASE
    WHEN age = 22 THEN '○'
    WHEN age IS NULL THEN '×'
  END AS '○×'
FROM
  "Student";

-- NG例、Bクラスの東京在住の年齢と一致しないAクラスの生徒
-- MEMO col IN (22,NULL) はcol = 22 OR col = NULLとなる
-- MEMO NG例:col NOT IN (22,NULL) はcol <> 22 AND col <> NULLとなるのでNG
SELECT
  *
FROM
  "Class_A"
WHERE
  age NOT IN (
    SELECT
      age
    FROM
      "Class_B"
    WHERE
      city = '東京'
  );

-- OK例
-- MEMO NOT EXISTS(SELECT * FROM ~ WHERE 22 = NULL)
-- MEMO EXISTSは帰り値はtrueとfalseのみになる
SELECT
  *
FROM
  "Class_A" AS A
WHERE
  NOT EXISTS(
    SELECT
      *
    FROM
      "Class_B" AS B
    WHERE
      A.age = B.age
      AND B.city = '東京'
  );

-- OK例2、COALESCE関数でNILLを値に変換
-- MEMO COALESCE(col,変換値):NULLを変換値に変換できる
SELECT
  *
FROM
  "Class_A"
WHERE
  age NOT IN (
    SELECT
      COALESCE(age,0)
    FROM
      "Class_B"
    WHERE
      city = '東京'
  );


-- Cクラスの東京在住より若いAクラスの生徒
-- MEMO ALLはSQLiteでは使えない
-- SELECT
--   *
-- FROM
--   "Class_A"
-- WHERE
--   age < ALL (
--     SELECT
--       age
--     FROM
--       "Class_C"
--     WHERE
--       city = '東京'
--   );

-- OK例、極値関数MAX・MINはNULLを除く
SELECT
  *
FROM
  "Class_A"
WHERE
  age < (
    SELECT
      MIN(age)
    FROM
      "Class_B"
    WHERE
      city = '東京'
  );