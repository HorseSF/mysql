-- 取得每个薪水等级有多少员工

-- step1 取得员工薪水等级
select e.ename, e.sal, s.grade from emp e join salgrade s on e.sal between s.losal and s.hisal;

-- step1 取得每个薪水等级有多少员工
select s.grade, count(*) as num from emp e join salgrade s on e.sal between s.losal and s.hisal group by s.grade;
