-- 列出各部门的MANAGER的最低薪资
select deptno,min(sal)
from emp
where job='MANAGER'
group by deptno; 