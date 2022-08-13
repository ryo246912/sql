-- Active: 1659429536080@@127.0.0.1@3306
CREATE TABLE StudentClub(
    std_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    club_name TEXT NOT NULL,
    main_club_flg TEXT NOT NULL
);

CREATE TABLE Greatests(
    key TEXT NOT NULL,
    x INTEGER NOT NULL,
    y INTEGER NOT NULL,
    z INTEGER NOT NULL
);

CREATE TABLE LoadSample(
    sample_date DATE NOT NULL,
    load_val INTEGER NOT NULL
);

CREATE TABLE ServerLoadSample(
    server TEXT NOT NULL,
    sample_date DATE NOT NULL,
    load_val INTEGER NOT NULL
);

CREATE TABLE Products2(
    name TEXT NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE Addresses(
    name TEXT NOT NULL,
    family_id INTEGER NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Products3(
    name TEXT NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE Student(
    name TEXT NOT NULL,
    age INTEGER
);

CREATE TABLE Class_A(
    name TEXT NOT NULL,
    age INTEGER,
    city TEXT NOT NULL
);

CREATE TABLE Class_B(
    name TEXT NOT NULL,
    age INTEGER,
    city TEXT NOT NULL
);

CREATE TABLE Class_C(
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE Meetings(
    meeting TEXT NOT NULL,
    person TEXT NOT NULL
);

CREATE TABLE TestScores(
    student_id INTEGER NOT NULL,
    subject TEXT NOT NULL,
    score INTEGER NOT NULL
);

CREATE TABLE Projects(
    project_id TEXT NOT NULL,
    step_nbr INTEGER NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE ArrayTbl(
    key TEXT NOT NULL,
    col1 INTEGER,
    col2 INTEGER,
    col3 INTEGER,
    col4 INTEGER,
    col5 INTEGER,
    col6 INTEGER,
    col7 INTEGER,
    col8 INTEGER,
    col9 INTEGER,
    col10 INTEGER
);

CREATE TABLE ArrayTbl2(
    key TEXT NOT NULL,
    i INTEGER NOT NULL,
    val INTEGER
);

CREATE TABLE Numbers(
    num INTEGER NOT NULL
);

CREATE TABLE SeqTbl(
    seq INTEGER NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE Class_B1(
    id INTEGER NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE Items(
    item_no INTEGER NOT NULL,
    item TEXT NOT NULL
);

CREATE TABLE SalesHistory(
    sale_date DATE NOT NULL,
    item_no INTEGER NOT NULL,
    quantity INTEGER NOT NULL
);
