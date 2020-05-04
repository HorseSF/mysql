-- 列出所有员工及领导的名字
select 
	e1.ename '员工名', e2.ename '领导名'
from 
	emp e1
left join 
	emp e2
on 
	e1.mgr=e2.empno;