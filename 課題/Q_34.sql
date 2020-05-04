-- 给任职超过30年的员工加薪百分之十
drop table if exists emp_bk;
create table emp_bk as select * from emp;

update emp_bk set sal=1.1*sal where (to_days(now()) - to_days(hiredate))/365 > 50;