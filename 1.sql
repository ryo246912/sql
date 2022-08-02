-- 異なる条件の集計を1SQLで行う
-- MEMO CASE式の最後のELSE ~ ENDを忘れずに
-- MEMO 集計する際は、集合関数 GROUP BY col
SELECT  CASE WHEN pref_name = '徳島' THEN '四国'
             WHEN pref_name = '香川' THEN '四国'
             WHEN pref_name = '愛媛' THEN '四国'
             WHEN pref_name = '高知' THEN '四国'
             WHEN pref_name = '福岡' THEN '九州'
             WHEN pref_name = '佐賀' THEN '九州'
             WHEN pref_name = '長崎' THEN '九州'
             ELSE 'その他' END AS district
       ,SUM(population)
FROM "PopTbl"
GROUP BY  district;

-- 上記のクエリを冗長に書くと下になる
SELECT  CASE WHEN pref_name = '徳島' THEN '四国'
             WHEN pref_name = '香川' THEN '四国'
             WHEN pref_name = '愛媛' THEN '四国'
             WHEN pref_name = '高知' THEN '四国'
             WHEN pref_name = '福岡' THEN '九州'
             WHEN pref_name = '佐賀' THEN '九州'
             WHEN pref_name = '長崎' THEN '九州'
             ELSE 'その他' END
       ,SUM(population)
FROM "PopTbl"
GROUP BY  CASE WHEN pref_name = '徳島' THEN '四国'
             WHEN pref_name = '香川' THEN '四国'
             WHEN pref_name = '愛媛' THEN '四国'
             WHEN pref_name = '高知' THEN '四国'
             WHEN pref_name = '福岡' THEN '九州'
             WHEN pref_name = '佐賀' THEN '九州'
             WHEN pref_name = '長崎' THEN '九州'
             ELSE 'その他' END;

SELECT  CASE WHEN population < 100 THEN '01'
             WHEN population >= 100 AND population < 200 THEN '02'
             WHEN population >= 200 AND population < 300 THEN '03'
             WHEN population >= 300 THEN '04'  
             ELSE NULL END AS pop_class
       ,COUNT(*)                                             AS cnt
FROM "PopTbl"
GROUP BY pop_class;

SELECT  pref_name
       ,SUM( CASE WHEN sex = '1' THEN population ELSE 0 END) AS cnt_m
       ,SUM( CASE WHEN sex = '2' THEN population ELSE 0 END) AS cnt_f
FROM "PopTbl2"
GROUP BY  pref_name;

-- UPDATE + CASEでの条件分岐
UPDATE "Salaries"
SET salary = CASE WHEN salary >= 300000 THEN salary * 0.9 
                  WHEN salary >= 250000 AND salary < 280000 THEN salary * 1.2 
                  ELSE salary END;

-- MEMO カラム(col3)の最後はカンマ入れない SELECT col1,col2,col3 FROM ~
-- MEMO サブクエリ内のテーブル呼出は、クエリ内で呼出していたらそのまま使える(FROM "CourseMaster" AS CM)
SELECT CM.course_name,
       CASE WHEN (SELECT COUNT(*) FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND OC.month LIKE '%06' ) > 0 THEN '○' ELSE '×' END as "6月",
       CASE WHEN (SELECT COUNT(*) FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND OC.month LIKE '%07' ) > 0 THEN '○' ELSE '×' END as "7月",
       CASE WHEN (SELECT COUNT(*) FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND OC.month LIKE '%08' ) > 0 THEN '○' ELSE '×' END as "8月"
FROM "CourseMaster" AS CM

-- EXISTSでのサブクエリ、EXISTS (サブクエリ)
-- MEMO サブクエリ内のテーブル指定は、同じカラム名でないときはテーブル名から明示しなくてもOK
SELECT CM.course_name,
       CASE WHEN EXISTS (SELECT course_id FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND month LIKE '%06' ) THEN '○' ELSE '×' END as "6月",
       CASE WHEN EXISTS (SELECT course_id FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND month LIKE '%07' ) THEN '○' ELSE '×' END as "7月",
       CASE WHEN EXISTS (SELECT course_id FROM "OpenCourse" AS OC WHERE CM.course_id = OC.course_id AND month LIKE '%08' ) THEN '○' ELSE '×' END as "8月"
FROM "CourseMaster" AS CM

-- INでのサブクエリ
-- MEMO 同じカラム名がないときは複数テーブルをいじる際でもカラム名だけでOK
SELECT course_name,
       CASE WHEN course_id IN (SELECT course_id FROM "OpenCourse" WHERE month LIKE '%06') THEN '○' ELSE '×' END as "6月",
       CASE WHEN course_id IN (SELECT course_id FROM "OpenCourse" WHERE month LIKE '%07') THEN '○' ELSE '×' END as "7月",
       CASE WHEN course_id IN (SELECT course_id FROM "OpenCourse" WHERE month LIKE '%08') THEN '○' ELSE '×' END as "8月"
FROM "CourseMaster"
