-- 列出所有部门的详细信息和人数
select d.*, count(e.ename) as num
from emp e
right join dept d
on e.deptno=d.deptno
group by d.deptno
order by d.deptno;