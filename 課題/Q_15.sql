-- 列出受雇员工早于直接上级的员工编号，姓名，部门
select 
	e1.empno '员工编号', 
	e1.ename '员工姓名', 
    d.dname '员工部门'
from 
	emp e1
join 
	emp e2
on 
	e1.mgr = e2.empno
join
	dept d
on 
	e1.deptno = d.deptno
where 
	e1.hiredate<e2.hiredate;