-- 列出所有员工姓名，部门名称和工资
select e.ename, d.dname, e.sal
from emp e
join dept d
on e.deptno=d.deptno;