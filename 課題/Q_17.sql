-- 列出至少有五个员工的所有部门详细信息
select d.*
from emp e
join dept d
where d.deptno=e.deptno
group by d.deptno, d.dname, d.loc
having count(e.ename) >= 5;