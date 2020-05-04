-- 求员工领导的薪资超过3000的员工名称与领导名称
select e1.ename as name, e1.sal, e2.ename as mgrname, e2.sal
from emp e1
join emp e2
on e1.mgr=e2.empno
where e2.sal>3000;