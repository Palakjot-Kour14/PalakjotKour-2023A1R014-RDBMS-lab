use scott;
show tables;
select *from emp;
select *from dept;
select *from  emp join dept;

select *from  emp join dept
on(emp.deptno=dept.deptno);

select  ename , dname from  emp join dept
on(emp.deptno=dept.deptno);  #  1. equijoin experiment or inner join or simple join 7

/* in oracle we can write as
select  ename , dname from  emp , dept
where (emp.deptno=dept.deptno); */

select  ename , dname , emp.deptno from  emp join dept
on(emp.deptno=dept.deptno);

select  ename , dname , e.deptno
from  emp as e join dept as d
on(e.deptno=d.deptno);

select * from salgrade;
select * from emp;
select * from emp join salgrade ;#cartesian product

select * from emp join salgrade
on sal between losal and hisal;

select ename , sal  , grade from emp join salgrade # this is non - equijoin
on sal between losal and hisal
order by grade;

select * from emp;
select e.ename , m.ename
from emp as e join emp as m
on e.mgr =m.empno; # this a a self join

select  ename , dname , deptno
from  emp  natural join dept; #natural join

 # if there are more than one common columns
 select  ename , dname , deptno
from  emp  join dept  using(deptno) ;

 select  ename , dname , deptno
from  emp  right join dept  using(deptno) ; # right outer join is used for match or unmatchf right side

insert into  emp values (146,'Jaskirat','manager',7564,'1982-12-14',2000,NULL,NULL);
 select  ename , dname , deptno
from  emp  left join dept  using(deptno) ; #left join


/* use hr;
select * from departments;
select concat(first_name," " ,last_name) as fullname , department_name
from employees e join departments d; */


