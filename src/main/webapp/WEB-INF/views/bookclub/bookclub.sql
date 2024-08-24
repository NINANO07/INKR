CREATE TABLE bookclub (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	host VARCHAR(10) NOT NULL,
	title VARCHAR(100) NOT NULL, 
	isbn VARCHAR(20) NOT NULL UNIQUE KEY,
	cover VARCHAR(1000) NOT NULL,
	author VARCHAR(100) NOT NULL, 
	engTitle VARCHAR(100), 
	engAuthor VARCHAR(100), 
	createDate DATETIME NOT NULL DEFAULT NOW(),
	participant INT NOT NULL DEFAULT 0,
	FOREIGN KEY (host) REFERENCES member2 (mid) ON DELETE CASCADE
);

DROP TABLE bookclub;

select * from bookclub where idx NOT in (select clubIdx from bookclubMember where mid = 'gibson') and title like concat('%','inter','%') or engTitle like concat('%','inter','%')

CREATE TABLE bookclubMember (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	clubIdx INT NOT NULL, 
	mid VARCHAR(10) NOT NULL, 
	clubPoint INT NOT NULL DEFAULT 0, /*300 : 1 500:2 700 :3 */
	joinDate DATETIME NOT NULL DEFAULT NOW(),
	baned BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (clubIdx) REFERENCES bookclub(idx) ON DELETE CASCADE,
	FOREIGN KEY (mid) REFERENCES member2 (mid) ON DELETE CASCADE
);

DROP TABLE bookclubMember;

INSERT INTO bookclubMember VALUES (DEFAULT, 10, 'gustav', DEFAULT, DEFAULT,DEFAULT, DEFAULT );
INSERT INTO bookclubMember VALUES (DEFAULT, 10, 'summer', DEFAULT, DEFAULT,DEFAULT, DEFAULT );

CREATE TABLE bookclubQ (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	clubIdx INT NOT NULL,
	clubMidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	content TEXT NOT NULL, 
	page INT, 
	line INT,  
	imgFile VARCHAR(1000), 
	language CHAR(3) NOT NULL, 
	viewCnt INT NOT NULL DEFAULT 0,
	qdate DATETIME NOT NULL DEFAULT NOW(),
	top CHAR(5) NOT NULL, 
	FOREIGN KEY (clubIdx) REFERENCES bookclub(idx) ON DELETE CASCADE,
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);

INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'gustav', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'de', DEFAULT, DEFAULT );
INSERT INTO bookclubQ VALUES (DEFAULT, 10, 'summer', 'What is the difference between Morgen,morgen and am Morgen,morgens ?Feel free to just provide example sentences.', NULL, 'en', DEFAULT, DEFAULT );


DROP TABLE bookclubQ;

CREATE TABLE bookclubA (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	clubIdx INT NOT NULL, 
	qidx INT NOT NULL,
	clubMidx INT NOT NULL,
	clubToidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	toMid VARCHAR(10) NOT NULL,
	content TEXT NOT NULL,
	imgFile VARCHAR(1000), 
	isFeatured BOOLEAN NOT NULL DEFAULT FALSE,
	adate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (clubIdx) REFERENCES bookclub(idx) ON DELETE CASCADE,
	FOREIGN KEY (qidx) REFERENCES bookclubQ(idx) ON DELETE CASCADE,
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE,
	FOREIGN KEY (clubToidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);

DROP TABLE bookclubA;

CREATE TABLE bookclubLike (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	aidx INT NOT NULL,
	clubMidx INT NOT NULL,
	clubToidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	toMid VARCHAR(10) NOT NULL,
	hitDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (aidx) REFERENCES bookclubA(idx),
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE,
	FOREIGN KEY (clubToidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);

DROP TABLE bookclubLike;

select * from bookclub where idx NOT in (select clubIdx from bookclubMember m where m.mid = 'gustav');
select * from bookclub where idx NOT in (select clubIdx from bookclubMember m where m.mid = 'summer');

CREATE TABLE bookclubMarked (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	clubIdx INT NOT NULL, 
	clubMidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	markedDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (clubIdx) REFERENCES bookclub (idx) ON DELETE CASCADE,
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);
select clubIdx from bookclubMarked where mid = 'gustav'
select * from bookclub where idx in (select clubIdx from bookclubMarked where mid = 'gustav') and mid = 'gustav';

DROP TABLE bookclubMarked

CREATE TABLE bookclubVoca (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	clubIdx INT NOT NULL, 
	clubMidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	word VARCHAR(100) NOT NULL, 
	transWord VARCHAR(100) NOT NULL,
	language CHAR(3) NOT NULL,
	wordGrade CHAR(5),
	pos CHAR(5),
	definition VARCHAR(500),
	transDfn VARCHAR(500),
	vocaDate DATETIME DEFAULT NOW(),
	FOREIGN KEY (clubIdx) REFERENCES bookclub (idx) ON DELETE CASCADE,
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);

DROP TABLE bookclubVoca;

CREATE TABLE vocaBookMark (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	vocaIdx INT NOT NULL,
	clubMidx INT NOT NULL,
	mid VARCHAR(10) NOT NULL,
	markDate DATETIME DEFAULT NOW(),
	FOREIGN KEY (vocaIdx) REFERENCES bookclubVoca (idx) ON DELETE CASCADE,
	FOREIGN KEY (clubMidx) REFERENCES bookclubMember (idx) ON DELETE CASCADE
);

DROP TABLE vocaBookMark;

CREATE TABLE bookclubReport (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	sort VARCHAR(10) NOT NULL, 
	sortIdx INT NOT NULL, 
	offender VARCHAR(10) NOT NULL,
	reporter VARCHAR(10) NOT NULL,
	reason VARCHAR(30) NOT NULL, 
	detail TEXT,
	reportDate DATETIME NOT NULL DEFAULT NOW(),
	deleted BOOLEAN NOT NULL DEFAULT FALSE
)

DROP TABLE bookclubReport
















