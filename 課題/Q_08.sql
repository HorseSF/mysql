-- 取得比普通员工（员工代码没有在mgr字段上出现的）的最高薪水还要高的领导人姓名

-- step1 找出普通员工
-- not in不会自动忽略空值， in会自动忽略空值
select * from emp where empno not in (select distinct mgr from emp where mgr is not null);

-- step2 找出普通员工最高薪水
select max(sal) from emp where empno not in (select distinct mgr from emp where mgr is not null);

-- step3 找出薪水高于普通员工最高薪水还高的领导人
select ename,sal from emp where sal >(select max(sal) from emp where empno not in (select distinct mgr from emp where mgr is not null));