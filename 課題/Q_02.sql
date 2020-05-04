-- 找出各部门平均薪水以上的人
select e.ename,e.sal, t.*
from emp e 
join (select deptno, avg(sal) as avgSal from emp group by deptno) t
on t.avgSal <= e.sal and t.deptno = e.deptno;