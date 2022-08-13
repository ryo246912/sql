-- コメントの書き方

-- 1行コメント
/* 複数行コメント
コメント
*/
SELECT
  *
FROM
  "Class_A1" AS A -- 終端にコメントでいれられちゃう
-- 途中で行としてコメントでいれられちゃう
WHERE
  EXISTS (
    SELECT
      *
    FROM
      "Class_B1" AS B
    WHERE
      A.id = B.id
  );
