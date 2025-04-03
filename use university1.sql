use university1;
show tables;

desc courses;
select*from courses;
desc instructors;
select*from instructors;

select*from students
where name like 'A%';
select * from students
where name like '%s';
select * from students
where name like '%s_';

# if there is any name james%bond then
# where name like '%\%%';

# if any cell is empty then use where (column name) mid is null

select  name  , salary * 12 asal
 from instructors
 where  salary * 12 < 2000000;
 
 # select is statement and it has clasuses like:-
 # 1. select 2. from 3. where 4. group by 5. having 6.order by order of sequence is (2 , 3, 4,5,1,6)
 
 
 select * from  instructors order by salary desc;
  select * from  instructors order by  deptid , salary desc;

/* functions
  1. builtin function --> single row fuctions , multirow functions
     string , data time , general functions , conversion functions
     2. user defined functions*/
     use university1;
select* from instructors;
     select concat(name ," earns " , salary ) as "emp sal " from instructors;
     select substr(name , 5) from instructors;
       select substr(name ,5, 3) from instructors; # 5 is starting point of  index  //*
       select 'hello world';
       select substr('hello world',1,5);
       
       select concat(name,  " work in dept no " ,deptid) as 'empdept' from instructors;
       /*concat is used to join multiple columns into one*/
       select "   jaskirat@146";
       select ltrim("  jaskirat@146");  /* trim is used to remove spaces on left and right sides both*/
       
        select "   palakjot@164";
       select ltrim("  palakjot@164");
       
        select "   aaravsharma@142";
       select ltrim("  aaravsharma@142");
       
       select salary from instructors;
       select length(salary) from instructors;
        select length(name) from instructors; /* length also gives numeric value*/
        select  name ,length(salary) from instructors;
        select lpad(salary,15,'*') from instructors; /*lpading is used to add characters */
     select rpad(salary,15,'*') from instructors;
      select lpad(rpad(salary,15,'*'),20,'*') from instructors;
     
      select replace("Dr. James","Dr.","Mr.") as 'rename';/* replace is used to replace section of string*/
      select * from instructors;
       select lower(name) from instructors;
        select upper(name) from instructors;
      select name from students;
     
        select * from students;
      select lower(name) from students;
        select upper(name) from students;

        select substr(name,1,1) from students;
        select substr(name,1,1)  , lower (substr(name,2)) from students;
         select  concat(substr(name,1,1)  , lower (substr(name,2))) from students; /* initcap function */
         
         select*from students;
         select  name , dob from students;
         select  name , day(dob)  from  students;
         select  name , month(dob) from students;
         select  name ,  year(dob) from students;
         
                  select  name , day(dob) , month(dob), year(dob)  from  students;
         select  name , year(dob)
         from students
         where year(dob)=2005;
         
          select  name ,  dayname(dob) from students;
            select  name ,  dayname(dob)  , monthname(dob)  from students;
           
            select hour(curtime()) , minute(curtime()) , second(curtime());
           
            select curdate();
           
            select name ,year(curdate())- year(dob) as age  from students; /*age is a derived attribute */
           
            select * from instructors;
             select name , deptid , salary ,
             case deptid when 3 then salary*1.30
             when 6 then salary*1.40
          when 9 then salary*1.50  /* else is optional */
          else salary
          end as incsal
          from instructors;
         
         
          select * from instructors;
             select name , deptid , salary ,
             case deptid when 3 then salary*1.30
             when 6 then salary*1.40
          when 9 then salary*1.502
          end as incsal
          from instructors;
           
            /* types of group function or multirow or aggregate functions. it doesnot work on null value but count* works on null value
            1. min 2. max 3.count 4. avg 5.sum */
            use university1;
            show tables;
            select * from instructors;
            select max(salary) as maxsal ,
            min(salary) as minsal,
             round (avg(salary),2) as avgsal ,/* is single-o function used to do roundoff the numbers */
             sum(salary) as sumsal ,
             count(instructorid) as noofemp
            from instructors;
           
             select count(instructorid )
            from instructors;
           
            select  deptid, sum(salary) as sumsal
            from instructors group by deptid;
           
            select * from enrollments;
           
            select  grade ,count(*)
            from enrollments
            group by grade;
           
            select  courseid ,count(*)
            from enrollments
            group by courseid;
           
            select  studentid ,count(*)
            from enrollments
            group by studentid;
           
           /* use scott;
            show tables;
            select * from emp order by deptno , sal desc ;
            select job , sum(sal) , count(*)
            from emp
            group by job ;
           
              select deptid ,job , sum(sal) , count(*)
            from emp
            group by  deptno , job*/
           
            select deptid , sum(salary)
            from instructors
            group by deptid
having sum(salary) > 170000;
           
           
            /*select concat(first_name , "" , last_name) as fullname , salary from employees;
           
            select first-name , salary , commission_pct from employees
            where commisssion_pct is not null;
           
            select first_name  
            from employees
            where first_name like 'S%' and length(first_name)=5;
           
             select first_name  
            from employees
            where substr( first_name,1,1) ='S' and length(first_name)=5;
           
            select distinct job_id from employees;
            */
            use university1;
           
            select last_name , department_name , city from
(select last_name , department_name,location_id
from  employees e join departments as d
on (e.department_id = d.department_id)) as  newtab
join locations as l
on(l.location_id=newtab.location_id)
