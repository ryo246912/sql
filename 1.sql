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
