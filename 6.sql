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
