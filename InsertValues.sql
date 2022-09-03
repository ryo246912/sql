-- Active: 1659429536080@@127.0.0.1@3306
INSERT INTO OpenCourse (month, course_id) VALUES ('201806', 1),('201806', 3);
INSERT INTO OpenCourse (month, course_id) VALUES ('201806', 4), ('201807', 8), ('201808', 2), ('201808', 4);

INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('香川',2,100);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('愛媛',1,100);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('愛媛',2,50);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('高知',1,100);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('高知',2,100);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('福岡',1,100);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('福岡',2,200);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('佐賀',1,20);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('佐賀',2,80);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('長崎',1,125);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('長崎',2,125);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('東京',1,250);
INSERT INTO "PopTbl2" (pref_name, SEX,population) VALUES ('東京',2,150);

INSERT INTO "Salaries" (name, salary) VALUES ('相田',300000);
INSERT INTO "Salaries" (name, salary) VALUES ('神崎',270000);
INSERT INTO "Salaries" (name, salary) VALUES ('木村',220000);
INSERT INTO "Salaries" (name, salary) VALUES ('斎藤',290000);

INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (100,1,'野球','Y');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (100,2,'吹奏楽','N');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (200,2,'吹奏楽','N');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (200,3,'バトミントン','Y');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (200,4,'サッカー','N');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (300,4,'サッカー','N');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (400,5,'水泳','N');
INSERT INTO "StudentClub" (std_id,club_id,club_name,main_club_flg) VALUES (500,6,'囲碁','N');

INSERT INTO "Greatests" (key,x,y,z) VALUES ('A',1,2,3);
INSERT INTO "Greatests" (key,x,y,z) VALUES ('B',5,5,2);
INSERT INTO "Greatests" (key,x,y,z) VALUES ('C',4,7,1);
INSERT INTO "Greatests" (key,x,y,z) VALUES ('D',3,3,8);

INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-01',1024);
INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-02',2366);
INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-05',2366);
INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-07',985);
INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-08',780);
INSERT INTO "LoadSample"(sample_date,load_val) VALUES ('2018-02-12',1000);

INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-01',1024);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-02',2366);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-05',2366);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-07',985);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-08',780);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('A','2018-02-12',1000);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-01',54);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-02',39008);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-03',2900);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-04',556);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-05',12600);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('B','2018-02-06',7309);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('C','2018-02-01',1000);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('C','2018-02-07',2000);
INSERT INTO "ServerLoadSample" (server,sample_date,load_val) VALUES ('C','2018-02-16',500);

INSERT INTO "Products2" (name,price) VALUES ('りんご',100);
INSERT INTO "Products2" (name,price) VALUES ('みかん',50);
INSERT INTO "Products2" (name,price) VALUES ('バナナ',80);

INSERT INTO "Addresses" (name,family_id,address) VALUES ('前田義明',100,'東京都新宿区虎ノ門3-2-29');
INSERT INTO "Addresses" (name,family_id,address) VALUES ('前田由美',100,'東京都新宿区虎ノ門3-2-92');
INSERT INTO "Addresses" (name,family_id,address) VALUES ('加藤茶',200,'東京都新宿区西新宿2-8-1');
INSERT INTO "Addresses" (name,family_id,address) VALUES ('加藤勝',200,'東京都新宿区西新宿2-8-1');
INSERT INTO "Addresses" (name,family_id,address) VALUES ('ホームズ',300,'ベーガー街 221B');
INSERT INTO "Addresses" (name,family_id,address) VALUES ('ワトソン',300,'ベーガー街 221B');

INSERT INTO "Products3" (name,price) VALUES ('りんご',50);
INSERT INTO "Products3" (name,price) VALUES ('みかん',100);
INSERT INTO "Products3" (name,price) VALUES ('ぶどう',50);
INSERT INTO "Products3" (name,price) VALUES ('スイカ',80);
INSERT INTO "Products3" (name,price) VALUES ('レモン',30);
INSERT INTO "Products3" (name,price) VALUES ('いちご',100);
INSERT INTO "Products3" (name,price) VALUES ('バナナ',100);

INSERT INTO "Student" (name,age) VALUES ('ブラウン',22);
INSERT INTO "Student" (name,age) VALUES ('ラリー',19);
INSERT INTO "Student" (name,age) VALUES ('ジョン',NULL);
INSERT INTO "Student" (name,age) VALUES ('ボギー',21);

INSERT INTO "Class_A" (name,age,city) VALUES ('ブラウン',22,'東京');
INSERT INTO "Class_A" (name,age,city) VALUES ('ラリー',19,'埼玉');
INSERT INTO "Class_A" (name,age,city) VALUES ('ボギー',21,'千葉');

INSERT INTO "Class_B" (name,age,city) VALUES ('斎藤',22,'東京');
INSERT INTO "Class_B" (name,age,city) VALUES ('田尻',23,'東京');
INSERT INTO "Class_B" (name,age,city) VALUES ('山田',NULL,'東京');
INSERT INTO "Class_B" (name,age,city) VALUES ('和泉',18,'千葉');
INSERT INTO "Class_B" (name,age,city) VALUES ('武田',20,'千葉');
INSERT INTO "Class_B" (name,age,city) VALUES ('石川',19,'神奈川');

INSERT INTO "Class_C" (name,age,city) VALUES ('斎藤',22,'東京');
INSERT INTO "Class_C" (name,age,city) VALUES ('田尻',23,'東京');
INSERT INTO "Class_C" (name,age,city) VALUES ('山田',20,'東京');
INSERT INTO "Class_C" (name,age,city) VALUES ('和泉',18,'千葉');
INSERT INTO "Class_C" (name,age,city) VALUES ('武田',20,'千葉');
INSERT INTO "Class_C" (name,age,city) VALUES ('石川',19,'神奈川');

INSERT INTO "Meetings" (meeting,person) VALUES ('第1回','伊藤');
INSERT INTO "Meetings" (meeting,person) VALUES ('第1回','水島');
INSERT INTO "Meetings" (meeting,person) VALUES ('第1回','坂東');
INSERT INTO "Meetings" (meeting,person) VALUES ('第2回','伊藤');
INSERT INTO "Meetings" (meeting,person) VALUES ('第2回','宮田');
INSERT INTO "Meetings" (meeting,person) VALUES ('第3回','坂東');
INSERT INTO "Meetings" (meeting,person) VALUES ('第3回','水島');
INSERT INTO "Meetings" (meeting,person) VALUES ('第3回','宮田');

INSERT INTO "TestScores" (student_id,subject,score) VALUES (100,'算数',100);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (100,'国語',80);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (100,'理科',80);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (200,'算数',80);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (200,'国語',95);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (300,'国語',90);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (300,'算数',40);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (300,'社会',55);
INSERT INTO "TestScores" (student_id,subject,score) VALUES (400,'算数',80);

INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('AA100',0,'完了');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('AA100',1,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('AA100',2,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('B200',0,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('B200',1,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('CS300',0,'完了');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('CS300',1,'完了');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('CS300',2,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('CS300',3,'待機');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('DY400',0,'完了');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('DY400',1,'完了');
INSERT INTO "Projects" (project_id,step_nbr,status) VALUES ('DY400',2,'完了');

INSERT INTO "ArrayTbl" (key,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10) VALUES ('A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "ArrayTbl" (key,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10) VALUES ('B',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "ArrayTbl" (key,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10) VALUES ('C',1,1,1,1,1,1,1,1,1,1);
INSERT INTO "ArrayTbl" (key,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10) VALUES ('D',NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "ArrayTbl" (key,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10) VALUES ('E',NULL,3,1,9,NULL,NULL,9,NULL,NULL,NULL);

INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',1,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',2,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',3,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',4,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',5,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',6,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',7,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',8,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',9,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('A',10,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',1,3);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',2,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',3,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',4,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',5,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',6,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',7,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',8,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',9,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('B',10,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',1,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',2,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',3,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',4,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',5,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',6,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',7,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',8,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',9,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('C',10,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',1,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',2,9);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',3,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',4,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',5,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',6,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',7,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',8,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',9,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('D',10,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',1,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',2,3);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',3,1);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',4,9);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',5,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',6,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',7,9);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',8,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',9,NULL);
INSERT INTO "ArrayTbl2" (key,i,val) VALUES ('E',10,NULL);

INSERT INTO "Numbers" (num) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100);

INSERT INTO "SeqTbl" (seq,name) VALUES (1,'ディック');
INSERT INTO "SeqTbl" (seq,name) VALUES (2,'アン');
INSERT INTO "SeqTbl" (seq,name) VALUES (3,'ライル');
INSERT INTO "SeqTbl" (seq,name) VALUES (5,'カー');
INSERT INTO "SeqTbl" (seq,name) VALUES (6,'マリー');
INSERT INTO "SeqTbl" (seq,name) VALUES (8,'ベン');

INSERT INTO "Class_A1" (id,name) VALUES (1,'田中');
INSERT INTO "Class_A1" (id,name) VALUES (2,'鈴木');
INSERT INTO "Class_A1" (id,name) VALUES (3,'伊集院');
INSERT INTO "Class_B1" (id,name) VALUES (1,'田中');
INSERT INTO "Class_B1" (id,name) VALUES (2,'鈴木');
INSERT INTO "Class_B1" (id,name) VALUES (4,'西園寺');

INSERT INTO "Items" (item_no,item) VALUES (10,'SDカード');
INSERT INTO "Items" (item_no,item) VALUES (20,'CD-R');
INSERT INTO "Items" (item_no,item) VALUES (30,'USBメモリ');
INSERT INTO "Items" (item_no,item) VALUES (40,'DVD');

INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-01',10,4);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-01',20,10);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-01',30,3);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-03',10,32);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-03',30,12);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-04',20,22);
INSERT INTO "SalesHistory" (sale_date,item_no,quantity) VALUES ('2018-10-04',30,7);

INSERT INTO "SeqTbl1" (seq,name) VALUES (1,'ディック');
INSERT INTO "SeqTbl1" (seq,name) VALUES (2,'アン');
INSERT INTO "SeqTbl1" (seq,name) VALUES (3,'ライル');
INSERT INTO "SeqTbl1" (seq,name) VALUES (4,'カー');
INSERT INTO "SeqTbl1" (seq,name) VALUES (5,'カー');

INSERT INTO "SeqTbl2" (seq,name) VALUES (1,'ディック');
INSERT INTO "SeqTbl2" (seq,name) VALUES (2,'アン');
INSERT INTO "SeqTbl2" (seq,name) VALUES (4,'ライル');
INSERT INTO "SeqTbl2" (seq,name) VALUES (5,'カー');
INSERT INTO "SeqTbl2" (seq,name) VALUES (8,'カー');

INSERT INTO "SeqTbl3" (seq,name) VALUES (3,'ディック');
INSERT INTO "SeqTbl3" (seq,name) VALUES (4,'アン');
INSERT INTO "SeqTbl3" (seq,name) VALUES (5,'ライル');
INSERT INTO "SeqTbl3" (seq,name) VALUES (6,'カー');
INSERT INTO "SeqTbl3" (seq,name) VALUES (7,'カー');

INSERT INTO "SeqTbl4" (seq,name) VALUES (3,'ディック');
INSERT INTO "SeqTbl4" (seq,name) VALUES (4,'アン');
INSERT INTO "SeqTbl4" (seq,name) VALUES (7,'ライル');
INSERT INTO "SeqTbl4" (seq,name) VALUES (8,'カー');
INSERT INTO "SeqTbl4" (seq,name) VALUES (10,'カー');

INSERT INTO "Graduates" (name,income) VALUES ('サンプトン',400000);
INSERT INTO "Graduates" (name,income) VALUES ('マイク',30000);
INSERT INTO "Graduates" (name,income) VALUES ('ホワイト',20000);
INSERT INTO "Graduates" (name,income) VALUES ('アーノルド',20000);
INSERT INTO "Graduates" (name,income) VALUES ('スミス',20000);
INSERT INTO "Graduates" (name,income) VALUES ('ロレンス',15000);
INSERT INTO "Graduates" (name,income) VALUES ('ハドソン',15000);
INSERT INTO "Graduates" (name,income) VALUES ('ケント',10000);
INSERT INTO "Graduates" (name,income) VALUES ('ベッカー',10000);
INSERT INTO "Graduates" (name,income) VALUES ('スコット',10000);

INSERT INTO "Nulltbl" (col_1) VALUES (NULL);

INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (100,'理学部','2018-10-10');
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (101,'理学部','2018-09-22');
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (102,'文学部',NULL);
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (103,'文学部','2018-09-10');
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (200,'文学部','2018-09-22');
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (201,'工学部',NULL);
INSERT INTO "Students" (student_id,dpt,sbmt_date) VALUES (202,'経済学部','2018-09-25');

INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (1,'A','男',100);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (2,'A','女',100);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (3,'A','女',49);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (4,'A','男',30);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (5,'B','女',100);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (6,'B','男',92);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (7,'B','男',80);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (8,'B','男',80);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (9,'B','女',10);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (10,'C','男',92);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (11,'C','男',80);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (12,'C','女',21);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (13,'D','女',100);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (14,'D','女',0);
INSERT INTO "TestResults" (student_id,class,sex,score) VALUES (15,'D','女',0);

INSERT INTO "Teams" (member,team_id,status) VALUES ('ジョー',1,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ケン',1,'出勤中');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ミック',1,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('カレン',2,'出勤中');
INSERT INTO "Teams" (member,team_id,status) VALUES ('キース',2,'休暇');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ジャン',3,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ハート',3,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ディック',3,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ベス',4,'待機');
INSERT INTO "Teams" (member,team_id,status) VALUES ('アレン',5,'出勤中');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ロバート',5,'休暇');
INSERT INTO "Teams" (member,team_id,status) VALUES ('ケーガン',5,'待機');

INSERT INTO "Materials" (center,receive_date,material) VALUES ('東京','2018-4-01','錫');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('東京','2018-4-12','亜鉛');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('東京','2018-5-17','アルミニウム');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('東京','2018-5-20','亜鉛');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('大阪','2018-4-20','銅');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('大阪','2018-4-22','ニッケル');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('大阪','2018-4-29','鉛');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('名古屋','2018-3-15','チタン');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('名古屋','2018-4-01','炭素鋼');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('名古屋','2018-4-24','炭素鋼');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('名古屋','2018-5-02','マグネシウム');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('名古屋','2018-5-10','チタン');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('福岡','2018-5-10','亜鉛');
INSERT INTO "Materials" (center,receive_date,material) VALUES ('福岡','2018-5-28','錫');

INSERT INTO "Items1" (item) VALUES ('ビール'),('紙オムツ'),('自転車');

INSERT INTO "ShopItems" (shop,item) VALUES ('仙台','ビール');
INSERT INTO "ShopItems" (shop,item) VALUES ('仙台','紙オムツ');
INSERT INTO "ShopItems" (shop,item) VALUES ('仙台','自転車');
INSERT INTO "ShopItems" (shop,item) VALUES ('仙台','カーテン');
INSERT INTO "ShopItems" (shop,item) VALUES ('東京','ビール');
INSERT INTO "ShopItems" (shop,item) VALUES ('東京','紙オムツ');
INSERT INTO "ShopItems" (shop,item) VALUES ('東京','自転車');
INSERT INTO "ShopItems" (shop,item) VALUES ('大阪','テレビ');
INSERT INTO "ShopItems" (shop,item) VALUES ('大阪','紙オムツ');
INSERT INTO "ShopItems" (shop,item) VALUES ('大阪','自転車');
