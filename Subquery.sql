use hr;
 # select *from employees;
 
# select distinct job_id from employees;

 #select * from employees order by salary ;
 
 # select * from employees order by department_id ,  job_id desc;
 
  /* select  employee_id , concat (first_name , Last_name ) as fullname ,
 salary,  round ( salary/30 ) as  dailysal from employees
  order by salary*12 ; */
 
 /* select employee_id , first_name , salary,
  round (salary/30) as dailysal from employees; */
 
/*  select employee_id,job_id from employees  where
   job_id like '%clerk' or   job_id like '%analysts'
  order by job_id desc; */
  use hr;
  show tables;
  /* subquery syntax :-
  select select_list from table
  where expr operator
  (select select_list
  from table);*/
  /* guidelines for subqueries
  1. enclose subqueries in parenthesis
  2. place subqueries on the right side of the comparison condition
  3. the orderby clause in the subquery is not needed unless you are performing top -n analysis
  4. use single row operators with single row subqueries and use multiple row operators with multiple row subqueries.*/
 
  desc employees;
  select  last_name ,salary from employees where salary>
  (select salary from employees where last_name ="Abel");#nested query
 
  select  last_name ,hire_date,dayname(hire_date) from employees where dayname(hire_date)=
  (select dayname(hire_date) from employees where last_name ="Abel");#nested query
 
  select last_name , job_id ,salary from employees
  where job_id =( select job_id from employees where employee_id =141)
  and
  salary> (select salary from employees where employee_id =143);#single-row subquery
 
  select last_name,salary from employees where salary>
  (select avg(salary) from employees
  where department_id=60);
 
  select manager_id from employees where last_name ="Hunold";
  select last_name ,salary from employees where salary in
  (select salary from employees where last_name="King"); #multi row subquery
 
  select last_name , salary , job_id from employees
  where salary > any
  (select salary from employees where job_id = 'it_prog')
  and job_id!='it_prog';
 
  select last_name , salary , job_id from employees
  where salary > all
  (select salary from employees where job_id = 'it_prog')
  and job_id!='it_prog';
 
  select max(salary) from employees where job_id = 'it_prog';
 
  desc employees;
 
  select dayname(hire_date), count(*)
  from employees
  group by dayname(hire_date)
  having count(*) =
  (select max(countemp) from
  (select count(*) as countemp
  from employees
  group by dayname(hire_date)) as tab);
 
  select last_name , dayname(hire_date)
  from employees where dayname(hire_date) in
   (select dayname(hire_date) maxday
  from employees
  group by dayname(hire_date)
  having count(*)
  =(select max(countemp) from
  (select count(*) as countemp
  from employees
  group by dayname(hire_date)) as tab));
 
  use hr;
  show tables;
  select last_name,salary from employees where salary
 in  (select min(salary) from employees
  group by department_id);
 
  select last_name,salary from employees where salary > any
  (select  avg(salary) from employees
  group by department_id);
 
 select last_name,manager_id,department_id
 from employees
 where(manager_id,department_id)
 in (select manager_id,department_id  #pairwise comparison
  from employees
  where employee_id in (174,180));
 
  select last_name,manager_id,department_id
 from employees where manager_id in
 (select manager_id from employees
 where employee_id in (174,180))
 and department_id
 in (select department_id
  from employees  #non pairwise comparison
  where employee_id in (174,180));
 
 
  select employees.last_name,salary , employees.department_id, avgdept.avgsal
  from employees join
 ( select department_id , avg(salary) as avgsal
  from employees group by department_id) as avgdept
  on (employees.department_id = avgdept.department_id)
  where  employees.salary>avgdept.avgsal; #inline view when we write subquery in from clause and give it a name
  #or we can do it by co-related subquery
  #co-related subquery
  select last_name,salary
from employees as outertab
where outertab.salary >
 ( select avg(salary) as avg
  from employees
  where department_id=outertab.department_id);
