-- 列出各工资的最低工资及从事此工作的雇员姓名

-- step1 列出各工资的最低工资
select e1.job, min(e1.sal) as minsal
from emp e1
group by e1.job;

-- step2 emp表连接
select e.ename, t.*
from emp e
join (
select e1.job, min(e1.sal) as minsal
from emp e1
group by e1.job)t
on e.job=t.job
and e.sal=t.minsal;
