-- 列出每个部门的员工数量，平均工资，平均服务期限
select 
	d.dname, 
	count(e.ename) as num, 
    ifnull(avg(e.sal),0) as avgsal, 
    ifnull(avg((to_days(now())-to_days(e.hiredate))/365),0) as avgdate
from 
	dept d
left join 
	emp e
on 
	d.deptno=e.deptno
group by 
	d.deptno;