-- 列出最低薪资大于1500的各种工作及从事此工作的全部雇员人数
select min(sal), job, count(*)
from emp
group by job
having min(sal)>1500;