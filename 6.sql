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
