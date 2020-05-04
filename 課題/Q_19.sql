-- 列出所有CLERK（办事员）的姓名及其部门名称，部门人数
select e.ename,t.dname, t.num
from emp e
join( 
	select d.deptno, d.dname, count(e.ename) as num
	from dept d
	join emp e
	on d.deptno=e.deptno
	group by d.deptno) t
on
	e.deptno = t.deptno
where job='CLERK';