-- 不准用组函数（Max），取得最高薪水
select sal from emp order by sal desc limit 1;

select sal from emp where sal not in(select distinct a.sal from emp a join emp b on a.sal<b.sal);