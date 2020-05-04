-- 取得平均薪水最高的部门名称
select avg(sal) as avgsal from emp group by deptno;

select
	e.deptno, d.dname, avg(sal) as avgsal
from
	emp e
inner join
	dept d 
on 
	e.deptno = d.deptno
group by 
	deptno
order by
	avgsal desc 
limit
	1;