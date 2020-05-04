-- 取得平均薪水等级最高的部门名称
-- step1 取各部门的平均薪水等级
select e.deptno, e.avgsal,s.grade
from (select deptno, avg(sal) as avgsal from emp group by deptno) e
join salgrade s 
on e.avgsal between s.losal and s.hisal;
-- setp2 取平均薪水最高等级
select max(s.grade)
from (select avg(sal) as avgsal from emp group by deptno) e
join salgrade s 
on e.avgsal between s.losal and s.hisal;
-- step3 取得平均薪水等级最高的部门名称
select t.dname, t.avgsal,s.grade
from (select d.dname, avg(e.sal) as avgsal from emp e join dept d on e.deptno=d.deptno group by d.deptno) t
join salgrade s 
on t.avgsal between s.losal and s.hisal
where s.grade = (select max(s.grade)
from (select avg(sal) as avgsal from emp group by deptno) e
join salgrade s 
on e.avgsal between s.losal and s.hisal);