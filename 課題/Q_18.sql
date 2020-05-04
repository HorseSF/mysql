-- 列出薪资比SIMITH多的员工信息
select *
from emp
where sal > (select sal from emp where ename='SIMITH');