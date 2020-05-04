-- 列出在部门SALSE（销售部）工作的员工姓名，假定不知道销售部门的编号
select ename
from emp
where deptno=(select deptno from dept where dname='SALES');