
###################################################
#교수님, 조교님 테이블

CREATE TABLE administrator (
	ID varchar(30),
	pw varchar(30)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;

###################################################
#교수님이 출결 검색하고, 바꿔주는 sql
# !!!!!!!!!administrator db로 로그인 되어야만 할 수 있음!!!!!!!!!!
# attendance #1 : 출석, #2: 지각 ,#3 : 결석

#화면에 table목록 (학생목록) 보여주기
#이떄 attendance는 숫자로 표시하지 않고 출석,지각,결석으로 보여주기

#아무것도 선택하지 않았을 떄
SELECT class, name, attendance from attendance;
#만약 반을 선택하면
select class, name, attendance from attendance where class = 1; # or class = 2(정인이 sql문에 1,2반으로 구분되어있음)
#만약 이름 까지 선택하면
select class, name, attendance from attendance where class = 2 and name = '김소현';

#만약 table에서 출석을 변경하고 싶다면 ( 아까 검색했던 학생 그대로 가져오기 ex. 2 class / name : kimsohyun)
update attendance set attendance=1 where class = 2 and name = 'kimsohyun';
#set attendance = 1 이면 출석으로, set attendance = 2 이면 지각, set attendance = 3이면 결석으로 변경
