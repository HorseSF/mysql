-- 列出与SCOTT从事相同工作的所有员工及部门名称
select e.ename, e.job, d.dname
from emp e
join dept d
on e.deptno=d.deptno
where e.job=(select job from emp where ename='SCOTT')
and e.ename<>'SCOTT';