-- 列出薪资高于部门30中员工的薪资的其他员工的姓名和薪资
select e.ename, e.sal, d.dname
from emp e
join dept d
on e.deptno= d.deptno
where e.sal > (select max(sal) from emp where deptno=30);