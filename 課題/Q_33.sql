-- 求出部门名称中带s字符的部门员工工资合计，部门人数
select d.dname, ifnull(sum(e.sal),0) as sumsal, count(e.ename) as num
from emp e
right join dept d
on e.deptno=d.deptno
where d.dname like '%s%'
group by d.deptno;