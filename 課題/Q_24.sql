-- 列出薪资等于部门30中员工的薪资的其他员工的姓名和薪资
select ename, sal
from emp
where sal in (select distinct sal from emp where deptno=30)
and deptno<>30;