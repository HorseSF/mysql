-- 列出所有员工的年薪，并从低到高排序
select ename, (sal+ifnull(comm,0))*12 as yearsal
from emp
order by yearsal asc;