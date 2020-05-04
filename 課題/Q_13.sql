-- 3个表 s（学生表），c（课程表），sc（学生选课表）
-- s（sno，sname）代表（学号，姓名）
-- c（cno，cname，cteacher）代表（课号，课名，教师）
-- sc（sno，cno，scgrade）代表（学号，课号，成绩）
/* DDL
CREATE TABLE SC
(
  SNO      VARCHAR(200),
  CNO      VARCHAR(200),
  SCGRADE  VARCHAR(200)
);

CREATE TABLE S
(
  SNO    VARCHAR(200 ),
  SNAME  VARCHAR(200)
);

CREATE TABLE C
(
  CNO       VARCHAR(200),
  CNAME     VARCHAR(200),
  CTEACHER  VARCHAR(200)
);

INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '1', '语文', '张'); 
INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '2', '政治', '王'); 
INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '3', '英语', '李'); 
INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '4', '数学', '赵'); 
INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '5', '物理', '黎明'); 
commit;
 
INSERT INTO S ( SNO, SNAME ) VALUES ( '1', '学生1'); 
INSERT INTO S ( SNO, SNAME ) VALUES ( '2', '学生2'); 
INSERT INTO S ( SNO, SNAME ) VALUES ( '3', '学生3'); 
INSERT INTO S ( SNO, SNAME ) VALUES ( '4', '学生4'); 
commit;
 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '1', '40'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '2', '30'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '3', '20'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '4', '80'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '5', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '1', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '2', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '3', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '4', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '5', '40'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '3', '1', '60'); 
INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '3', '3', '80'); 
commit;
*/

/* 问题1.找出没选过“黎明”老师的所有学生
step1 找出黎明老师课程编号
select cno from c where cteacher='黎明';

step2 找出选过黎明老师课程的学生
select sno from sc where cno=(select cno from c where cteacher='黎明');

step3 找出没选过黎明老师课程的学生
select sname from s where sno not in (select sno from sc where cno=(select cno from c where cteacher='黎明')); 
*/
select sname from s where sno not in (select sno from sc where cno=(select cno from c where cteacher='黎明')); 

/* 问题2.列出2门以上（含2门）不及格学生姓名及平均成绩
step1 找出2门以上不及格的学生姓名
select sc.sno, s.sname
from sc 
join s
on sc.sno=s.sno
where sc.scgrade<60 
group by sc.sno, s.sname 
having cout(*) >= 2;

step2 列出每个学生的平均成绩
select cno avg(scgrade) as avgscgrade from sc group by sno;

step3 step1和step2联合
*/
select
	t1.sname, t2.avgscore
from
	(select
		sc.sno, s.sname
	from
		sc 
	join
		s
	on
		sc.sno=s.sno
	where
		sc.scgrade<60 
	group by
		sc.sno, s.sname 
	having 
		count(*) >= 2) t1
join
	(select sc.sno, avg(sc.scgrade) as avgscore from sc group by sc.sno) t2
on 
	t1.sno = t2.sno;
 
/* 问题3.即学过1号课程又学过2号课程所有学生姓名
step1 找出学过1号课程的学生
select sno from sc where cno=1;

step2 找出学过2号课程的学生
select sno from sc where cno=2;

step3 step1和step2联合
select sno from sc where cno=1 and sno in(select sno from sc where cno=2);

step4 取得学生姓名
select sc.sno,s.sname from sc
join s
on s.sno=sc.sno
where sc.cno=1 and sc.sno in(select sc.sno from sc where sc.cno=2);
*/
select sc.sno,s.sname from sc
join s
on s.sno=sc.sno
where sc.cno=1 and sc.sno in(select sc.sno from sc where sc.cno=2);

