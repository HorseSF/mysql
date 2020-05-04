-- 列出薪资高于公司平均薪资的所有员工，所在部门，上级领导，雇员的工资等级
select e1.ename,d.dname,e2.ename,s.grade
from emp e1
join dept d
on e1.deptno=d.deptno
left join emp e2
on e1.mgr=e2.empno
join salgrade s
on e1.sal between s.losal and s.hisal
where e1.sal>(select avg(sal) from emp);