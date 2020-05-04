-- 取得平均薪水最高的部门的部门编号（至少给出两种解决方案）
-- 方法1 降序排列取第一个平均薪水后联合
-- step1 取得每个部门平均薪水
select deptno,avg(sal) as avgsal from emp group by deptno order by deptno;
-- step2 取得平均薪水最大值
select avg(sal) as avgsal from emp group by deptno order by avgsal desc limit 1;
-- step3 第一步，第二步联合
select deptno, avg(sal) as avgsal from emp group by deptno
having avgsal=(select avg(sal) as avgsal from emp group by deptno order by avgsal desc limit 1);

-- 方法2 max函数
-- step1 取平均值的最大值
select max(t.avgsal) from (select avg(sal) as avgsal from emp group by deptno) t;
-- step2 取得部门编号
select deptno, avg(sal) as avgsal from emp group by deptno
having avgsal=(select max(t.avgsal) from (select avg(sal) as avgsal from emp group by deptno) t);