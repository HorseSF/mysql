-- 找出各部门最高薪水的人
select e.ename, t.*
from emp e 
join (select deptno,max(sal) as maxSal from emp group by deptno) t
on t.maxSal = e.sal and t.deptno = e.deptno;