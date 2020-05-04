-- 列出部门和这些部门的员工信息，同时列出那些没有员工的部门
select d.dname, e.*
from emp e
right join dept d
on e.deptno=d.deptno
order by d.dname;