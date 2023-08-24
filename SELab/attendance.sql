##정인이가 만든 table
CREATE TABLE stprofile(
	git VARCHAR(50) NOT NULL,
	name VARCHAR(30) NOT NULL,
	s_id INT(11) NOT NULL PRIMARY KEY,
	email VARCHAR(50) NOT NULL,
	pw VARCHAR(20) NOT NULL,
	class INT(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

/*
insert into stprofile values('https://github.com/Kimsohyun93/WebApp','kimsohyun',2017011767,'shk980903@naver.com','baba1004',2);
insert into stprofile values('https://github.com/kawonkang/webapp2019','kangkawon',2016001194,'kawonkang22@gmail.com','dada1004',2);
insert into stprofile values('https://github.com/soyunim/Web.git','imsoyun',2018044993,'togksk123@naver.com','sasa1004',2);
insert into stprofile values('https://github.com/jungin22/webapplication','leejungin',2018044911,'leejungin199@naver.com','nana1004',2);
insert into stprofile values('https://github.com/ahnyeji/WebApp','anyeji',2017012151,'yejian1218@naver.com','caca1004',1);
*/

CREATE TABLE login(
	s_id INT(11) NOT NULL PRIMARY KEY,
	pw VARCHAR(20) NOT NULL,
	FOREIGN KEY(s_id) REFERENCES stprofile(s_id)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;
# foreign key로 등록하면 stprofile에 있는 s_id가 아닌 다른 값이 들어왔을 때 insert 거부함.
# pw도 foreign key로 등록하고 싶었는데 primary key로 등록해야 된다고 해서 하지 않음.


update login set pw='변경하고 싶은 패스워드' where s_id = '2017011767(변경하려는 학생 학번)'

/*
insert into login values(2017011767,'baba1004');
insert into login values(2016001194,'dada1004');
insert into login values(2018044993,'sasa1004');
insert into login values(2018044911,'nana1004');
insert into login values(2017012151,'caca1004');
*/

## attendance에 필요한 구문
CREATE TABLE attendance(
	s_id INT(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY(s_id) REFERENCES stprofile(s_id),
	name VARCHAR(30) NOT NULL,
	class INT(11) NOT NULL,
	date VARCHAR(30),
	attendance INT(10)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE attendance_practice(
	s_id INT(11) NOT NULL PRIMARY KEY,
	foreign key(s_id) REFERENCES stprofile(s_id),
	name VARCHAR(30) NOT NULL,
	class INT(11) NOT NULL,
	date VARCHAR(30),
	attendance INT(10)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;



# attendance #1 : 출석, #2: 지각 ,#3 : 결석
#만약 입력한 출결 코드가 일치한다면
DECLARE @tmp_id INT
SET @tmp_id = 2018044911
INSERT INTO attendance (s_id, name, class, date, attendance) 
values(
(SELECT s_id FROM stprofile WHERE s_id = tmp_id),
(SELECT name FROM stprofile WHERE s_id = tmp_id),
(SELECT class FROM stprofile WHERE s_id = tmp_id),
(SELECT curdate()), 1);

#만약 출결 코드를 입력하지 않는다면 (출결코드 입력 시간이 끝난다면)

SET @tmp_id = 2018044911
INSERT INTO attendance (s_id, name, class, date, attendance) 
values(
(SELECT s_id FROM stprofile WHERE s_id = tmp_id),
(SELECT name FROM stprofile WHERE s_id = tmp_id),
(SELECT class FROM stprofile WHERE s_id = tmp_id),
(SELECT curdate()), 3);

