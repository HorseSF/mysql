-- 取得部门中（所有人）平均薪水的等级
select t.*, s.grade
from salgrade s
join (select deptno, avg(sal) as avgSal from emp group by deptno) t
on t.avgSal between s.losal and s.hisal;

-- 取得部门中（所有人）的平均薪水等级
select e.deptno, avg(s.grade) as avgGrade
from emp e
join salgrade  s
on e.sal between s.losal and s.hisal
group by e.deptno;