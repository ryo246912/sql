-- MEMO ウィンドウ関数 集合関数 OVER (ORDER BY col ~)
-- MEMO MIN(col1) OVER (ORDER BY col2 ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING):1列目のウィンドウ
-- MEMO n PRECEDING:フレームをn前へ移動
-- MEMO ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING:1列前のウィンドウ
SELECT
  sample_date AS cur_date,
  load_val AS cur_load,
  MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_date,
  MIN(load_val) OVER (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_load
FROM "LoadSample";

-- MEMO WINDOW定義を明示的に書く:集合関数 OVER W ~ FROM tbl WINDOW W (ORDER BY col ~)
SELECT 
  sample_date AS cur_date,
  load_val AS cur_load, 
  MIN(sample_date) OVER W AS latest_date,
  MIN(load_val) OVER W AS latest_load
FROM "LoadSample"
WINDOW W AS (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING);

-- MEMO n FOLLOWING:フレームをn後ろに移動
SELECT 
  sample_date AS cur_date,
  load_val AS cur_load, 
  MIN(sample_date) OVER W AS next_date,
  MIN(load_val) OVER W AS next_load
FROM "LoadSample"
WINDOW W AS (ORDER BY sample_date ASC ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING);

SELECT
  sample_date AS cur_date,
  MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_1,
  MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 2 PRECEDING AND 2 PRECEDING) AS latest_2,
  MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 3 PRECEDING AND 3 PRECEDING) AS latest_3
FROM "LoadSample";

-- 演習2-1
-- PARTITON BYがない→全体がパーティションになる
SELECT
server,
sample_date,
SUM(load_val) OVER () AS sum_load
FROM "ServerLoadSample";

-- 演習2-2
-- MEMO 集合関数 OVER (PARTITION BY col):colによる集合のカット(いわゆるGROUP BYに似たようなもの)
SELECT
server,
sample_date,
SUM(load_val) OVER (PARTITION BY server) AS sum_load
FROM "ServerLoadSample";
