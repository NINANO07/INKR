CREATE TABLE challengeList(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	title VARCHAR(50) NOT NULL, 
	mid VARCHAR(10) NOT NULL, 
	postCnt INT NOT NULL DEFAULT 0,
	addDate DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO challengeList VALUES (DEFAULT, 'Taste Swicy', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Fire Noodle', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'visit the Palace', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Dress up in a hanbok', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Malatanghulu', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'K-Kick Taekwondo', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Discover hiking trails', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Find good vibes', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Touch the skies', 'admin', DEFAULT, DEFAULT );
INSERT INTO challengeList VALUES (DEFAULT, 'Aesthetic Cafes INKR', 'admin', DEFAULT, DEFAULT );

DROP TABLE challengeList

CREATE TABLE challenge (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	listIdx INT NOT NULL, 
	mid VARCHAR(10) NOT NULL, 
	photo VARCHAR(1000) NOT NULL, 
	tag VARCHAR(100),
	createDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (listIdx) REFERENCES challengeList(idx) ON DELETE CASCADE,
	FOREIGN KEY (mid) REFERENCES member2 (mid)
);

DROP TABLE challenge

CREATE TABLE challengePoint(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	mid VARCHAR(10) NOT NULL, 
	point INT NOT NULL DEFAULT 0,
	setDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (mid) REFERENCES member2 (mid) ON DELETE CASCADE
)
DROP TABLE challengePoint

CREATE TABLE challengeLike (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	chIdx INT NOT NULL, 
	mid VARCHAR(10) NOT NULL, 
	toMid VARCHAR(10) NOT NULL, 
	hitDate DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (chIdx) REFERENCES challenge (idx) ON DELETE CASCADE,
	FOREIGN KEY (mid) REFERENCES member2 (mid),
	FOREIGN KEY (toMid) REFERENCES member2 (mid)
);

DROP TABLE challengeLike