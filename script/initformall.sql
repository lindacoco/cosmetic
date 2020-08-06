-- mall
DROP SCHEMA IF EXISTS `cosmetic`;

-- mall
CREATE SCHEMA `cosmetic`;

use cosmetic;
-- 사원
CREATE TABLE `employee` (
	`empno`      INT          NOT NULL COMMENT '사번', -- 사번
	`empname`    VARCHAR(20)  NULL     COMMENT '사원명', -- 사원명
	`empbirth`   DATE         NULL     COMMENT '생년월일', -- 생년월일
	`emptel`     char(20)     NULL     COMMENT '전화번호', -- 전화번호
	`empaddr`    VARCHAR(255) NULL     COMMENT '주소', -- 주소
	`empauth`    char(2)      NULL     COMMENT '권한', -- 권한
	`empid`      varchar(12)  NULL     COMMENT '아이디', -- 아이디
	`emppass`    varchar(41)  NULL     COMMENT '비밀번호', -- 비밀번호
	`empretired` TINYINT(1)   NULL     COMMENT '퇴사자여부' -- 퇴사자여부
)
COMMENT '사원';

-- 사원
ALTER TABLE `employee`
	ADD CONSTRAINT `PK_employee` -- 사원 기본키
		PRIMARY KEY (
			`empno` -- 사번
		);

ALTER TABLE `employee`
	MODIFY COLUMN `empno` INT NOT NULL AUTO_INCREMENT COMMENT '사번';

-- 상품
CREATE TABLE `product` (
	`pno`      INT          NOT NULL COMMENT '상품번호', -- 상품번호
	`pname`    VARCHAR(70)  NULL     COMMENT '상품이름', -- 상품이름
	`pcontent` LONGTEXT     NULL     COMMENT '상품설명', -- 상품설명
	`penroll`  DATE         NULL     COMMENT '상품등록기간', -- 상품등록기간
	`pprice`   INT          NULL     COMMENT '상품가격', -- 상품가격
	`ppic`     VARCHAR(255) NULL     COMMENT '상품사진', -- 상품사진
	`pdiv`     CHAR(1)      NULL     COMMENT '상품구분', -- 상품구분
	`pevent`   TINYINT(1)   NULL     COMMENT '이벤트상품', -- 이벤트상품
	`pstock`   INT          NULL     COMMENT '재고', -- 재고
	`psale`    INT          NULL     COMMENT '판매량' -- 판매량
)
COMMENT '상품';

-- 상품
ALTER TABLE `product`
	ADD CONSTRAINT `PK_product` -- 상품 기본키
		PRIMARY KEY (
			`pno` -- 상품번호
		);

ALTER TABLE `product`
	MODIFY COLUMN `pno` INT NOT NULL AUTO_INCREMENT COMMENT '상품번호';

-- 상품평
CREATE TABLE `review` (
	`no`      INT     NOT NULL COMMENT '번호', -- 번호
	`pno`     INT     NULL     COMMENT '상품번호', -- 상품번호
	`userno`  INT     NULL     COMMENT '유저번호', -- 유저번호
	`regdate` DATE    NULL     COMMENT '등록일', -- 등록일
	`point`   CHAR(1) NULL     COMMENT '별점' -- 별점
)
COMMENT '상품평';

-- 상품평
ALTER TABLE `review`
	ADD CONSTRAINT `PK_review` -- 상품평 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `review`
	MODIFY COLUMN `no` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 회원
CREATE TABLE `user` (
	`userno`     INT          NOT NULL COMMENT '유저번호', -- 유저번호
	`username`   VARCHAR(20)  NULL     COMMENT '유저명', -- 유저명
	`userbirth`  DATE         NULL     COMMENT '생년월일', -- 생년월일
	`usertel`    char(20)     NULL     COMMENT '전화번호', -- 전화번호
	`useraddr`   VARCHAR(255) NULL     COMMENT '주소', -- 주소
	`userid`     varchar(12)  NULL     COMMENT '유저아이디', -- 유저아이디
	`userpass`   varchar(41)  NULL     COMMENT '유저비밀번호', -- 유저비밀번호
	`usersecess` TINYINT(1)   NULL     COMMENT '탈퇴여부' -- 탈퇴여부
)
COMMENT '회원';

-- 회원
ALTER TABLE `user`
	ADD CONSTRAINT `PK_user` -- 회원 기본키
		PRIMARY KEY (
			`userno` -- 유저번호
		);

ALTER TABLE `user`
	MODIFY COLUMN `userno` INT NOT NULL AUTO_INCREMENT COMMENT '유저번호';

-- 이벤트
CREATE TABLE `event` (
	`eno`        INT          NOT NULL COMMENT '번호', -- 번호
	`etitle`     VARCHAR(255) NULL     COMMENT '제목', -- 제목
	`econtent`   LONGBLOB     NULL     COMMENT '내용', -- 내용
	`epic`       VARCHAR(255) NULL     COMMENT '사진', -- 사진
	`estartdate` DATE         NULL     COMMENT '시작날짜', -- 시작날짜
	`eenddate`   DATE         NULL     COMMENT '종료날짜' -- 종료날짜
)
COMMENT '이벤트';

-- 이벤트
ALTER TABLE `event`
	ADD CONSTRAINT `PK_event` -- 이벤트 기본키
		PRIMARY KEY (
			`eno` -- 번호
		);

ALTER TABLE `event`
	MODIFY COLUMN `eno` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 공지사항
CREATE TABLE `notice` (
	`nno`      INT          NOT NULL COMMENT '번호', -- 번호
	`ntitle`   VARCHAR(255) NULL     COMMENT '제목', -- 제목
	`nwriter`  CHAR(1)      NULL     COMMENT '작성자', -- 작성자
	`ncontent` LONGBLOB     NULL     COMMENT '내용', -- 내용
	`nregdate` DATE         NULL     COMMENT '작성일자' -- 작성일자
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE `notice`
	ADD CONSTRAINT `PK_notice` -- 공지사항 기본키
		PRIMARY KEY (
			`nno` -- 번호
		);

ALTER TABLE `notice`
	MODIFY COLUMN `nno` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 상품평
ALTER TABLE `review`
	ADD CONSTRAINT `FK_user_TO_review` -- 회원 -> 상품평
		FOREIGN KEY (
			`userno` -- 유저번호
		)
		REFERENCES `user` ( -- 회원
			`userno` -- 유저번호
		);

-- 상품평
ALTER TABLE `review`
	ADD CONSTRAINT `FK_product_TO_review` -- 상품 -> 상품평
		FOREIGN KEY (
			`pno` -- 상품번호
		)
		REFERENCES `product` ( -- 상품
			`pno` -- 상품번호
		);