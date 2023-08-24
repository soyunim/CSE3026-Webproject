##################################################
# 책갈피 만들지는 모르겠지만

CREATE TABLE bookmark(
	class int(10),
	num_of_slide int(10),
	num_of_page int(10)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;

# 만약 책갈피 모양을 클릭한다면? (1반, 2반 책갈피 모양을 다르게 한다는 가정 하에)
insert into bookmark values(1, 4, 35);

# 만약 책갈피를 달력에 표시한다면? (반별로 다르게)
select num_of_slide, num_of_page from bookmark where class = 1;