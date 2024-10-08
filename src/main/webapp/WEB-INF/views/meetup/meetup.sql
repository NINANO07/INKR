CREATE TABLE meetup (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	host VARCHAR(10) NOT NULL,
	contentid VARCHAR(10) NOT NULL UNIQUE KEY,
	title VARCHAR(100) NOT NULL, 
	addr VARCHAR(100) NOT NULL,
	firstimage VARCHAR(200) NOT NULL, 
	eventstartdate VARCHAR(10) NOT NULL,
	eventenddate VARCHAR(10) NOT NULL,
	mapx VARCHAR(20) NOT NULL, 
	mapy VARCHAR(20) NOT NULL,
	meetingDate VARCHAR(10) NOT NULL,
	meetingTime VARCHAR(10) NOT NULL,
	memNumber INT NOT NULL, 
	description TEXT NOT NULL,
	createDate DATETIME NOT NULL DEFAULT NOW(),
	expired BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (host) REFERENCES member2(mid)
)

DROP TABLE meetup

CREATE TABLE meetupMember(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	meetupIdx INT NOT NULL, 
	mid VARCHAR(10) NOT NULL,
	joinDate DATETIME NOT NULL DEFAULT NOW(),
	point INT NOT NULL DEFAULT 0,  /*300 : 1 500:2 700 :3  생성은 레벨2부터 가능 참여시 50point 생성시에는 100포인트*/
	canceled BOOLEAN NOT NULL DEFAULT 0, 
	FOREIGN KEY (meetupIdx) REFERENCES meetup(idx) ON DELETE CASCADE
)
DROP TABLE meetupMember

CREATE TABLE meetupWaiting (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	meetupIdx INT NOT NULL, 
	mid VARCHAR(10) NOT NULL,
	putDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (meetupIdx) REFERENCES meetup(idx) ON DELETE CASCADE
)

CREATE TABLE meetupStatus(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	meetupIdx INT NOT NULL, 
	content VARCHAR(1000) NOT NULL,
	setDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (meetupIdx) REFERENCES meetup(idx) ON DELETE CASCADE
)

DROP TABLE meetupStatus





