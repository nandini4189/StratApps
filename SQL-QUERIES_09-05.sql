
*********** SQL QUERIES ***********

1. select * from dept

2. select *from emp

3. select ename,job from emp

4. select ename,sal from emp

5.select empno,sal+ nvl(comm,0) from emp

6.select ename,round((sysdate-hiredate)/365) from emp

7. select *from emp where deptno=10

8. select *from emp where job='CLERK' and sal>3000

9. select  ename,empno,nvl(comm,0) from emp

10.select empno,ename from emp where comm is null

11.select ename from emp where job in('CLERK','SALESAMEN','ANALYST')  and sal>3000

12. select *from emp where round((sysdate-hiredate)/365)>5 

13.select *from emp where hiredate not between '30-june-90' and '31-dec-90'

14. select sysdate from dual

15. select *from all_users

16. select *from tab

17.show user

18.select ename from emp where deptno in(10,20,40) and job in('CLERK','SALESMAN','ANALYST') 

19. select ename from emp where ename like 'S%'

20. select ename from emp where ename like '%S'

21. select ename from emp where ename like'_A%'

22. select *from emp where ename like'_____'

23. select ename,job from emp where job not in('MANAGER')

24. select ename,job 
from emp 
where job not in('SALESMAN','ANALYST','CLERK')

25.system pause on

26.select count(*) from emp

27. select sal+nvl(comm,0) as totsal,comm from emp

28.Display the maximum salary from emp table
  select max(sal) from emp
  
29.Display the minimum salary from emp table
    
    select min(sal) from emp

30.Display the average salary from emp table

  select round(avg(sal)) from emp

31.Display the maximum salary being paid to CLERK

  select max(sal)from emp where job='CLERK'

32.Display the maximum salary being paid in dept no 20

  select max(sal)from emp where deptno=20
  
33.Display the minimum salary being paid to any SALESMAN

  select min(sal) from emp where job='SALESMAN'
  
34.Display the average salary drawn by managers

  select round(avg(sal)) from emp where job='MANAGER'

35.Display the total salary drawn by analyst working in dept no 40

  select sal+nvl(comm,0) as totsal 
  from emp 
  where job='ANALYST' and deptno=40
  
 36.Display the names of employees in order of salary i.e. the name of the employee earning 
  
  select ename from emp  order by sal
  
  37.Display the names of employees in descending order of salary lowest salary shoud appear first
  
  select ename,sal from emp  order by sal 
 
  38.Display the details from emp table in order of emp name
  
  select *from emp order by ename
  
  39.Display empnno,ename,deptno and sal. Sort the output first based on name and within name by deptno and witdhin deptno by sal;
  
  select empno,ename,deptno,sal 
  from emp 
  order by ename,deptno,sal
  
  40) Display the name of employees along with their annual salary(sal*12).the name of the employee earning highest annual salary should appear first?
  
  select ename,(sal+nvl(comm,0))*12 from emp order by sal desc
  
  41) Display name,salary,Hra,pf,da,TotalSalary for each employee.The out put should be in the order of total salary ,hra 15% of salary ,DA 10% of salary .pf 5% salary Total Salary
will be (salary+hra+da)­pf?
  
  select ename,sal "salary",
              (sal+nvl(comm,0))*0.15 "Hra" ,
              (sal+nvl(comm,0))*0.10 "Da",
              (sal+nvl(comm,0))*0.5 "Pf" ,
              round(sal+(sal+nvl(comm,0))*0.15+(sal+nvl(comm,0)*0.10)-(sal+nvl(comm,0)*0.5)) "Totalsalary" from emp order by "Totalsalary"
  
    
  
  42) Display Department numbers and total number of employees working in each Department?
  
  select deptno,count(*) from emp group by deptno order by deptno
  
 43) Display the various jobs and total number of employees working in each job group?
 
 select job,count(*) from emp group by job
  
44)Display department numbers and Total Salary for each Department?

select deptno,sum(sal) as totsal from emp group by deptno

45)Display department numbers and Maximum Salary from each Department?

select deptno,max(sal) from emp group by deptno

46)Display various jobs and Total Salary for each job?

select job,sum(sal) as totsal from emp group by job

47)Display each job along with min of salary being paid in each job group?

select job,min(sal) from emp group by job

48) Display the department Number with more than three employees in each department?

select deptno,count(*) from emp group by deptno having count(*)>3


49) Display various jobs along with total salary for each of the job where total salary is
greater than 40000?

select job,sum(sal) as totsal from emp group by job having sum(sal)>40000

50) Display the various jobs along with total number of employees in each job.The
output should contain only those jobs with more than three employees?

select job,count(*) from emp group by job having count(*)>3

51) Display the name of employees who earn Highest Salary?

select ename 
from emp 
where sal=(select max(sal) from emp)

52) Display the employee Number and name for employee working as clerk and earning highest salary among the clerks?

select empno,ename,sal,job 
from emp 
where job='CLERK' and sal=(select max(sal) from emp where job='CLERK') 

53) Display the names of salesman who earns a salary more than the Highest Salary of the clerk?

select ename from emp where job='SALESMAN' and sal > (select max(sal) from emp where job='CLERK')

54) Display the names of clerks who earn a salary more than the lowest Salary of any salesman?

select ename from emp where job='CLERK' and sal > (select min(sal) from emp where job='SALESMAN')

55) Display the names of employees who earn a salary more than that of jones or that of salary greater than that of scott?

select ename 
from emp where sal>(select sal from emp where ename='JONES') and sal> (select sal from emp where ename='SCOTT')

56) Display the names of employees who earn Highest salary in their respective departments?

  select e.ename,e.deptno,e.sal 
  from emp e 
  where sal=(select max(sal) from emp  where deptno=e.deptno) order by deptno

57) Display the names of employees who earn Highest salaries in their respective job Groups?

  select e.ename,e.deptno,e.sal,e.job 
  from emp e 
  where sal=(select max(sal) from emp group by job having job=e.job) order by deptno

58) Display employee names who are working in Accounting department?

  select *from emp e inner join dept d 
  on e.deptno=d.deptno 
  where d.dname='ACCOUNTING'

59) Display the employee names who are Working in Chicago?

  select ename 
  from emp e,dept d 
  where e.deptno=d.deptno 
  and d.loc='CHICAGO'

60) Display the
job groups having Total Salary greater than the maximum salary for Managers?

  select job,sum(sal) as totsal 
  from emp 
  group by job having sum(sal) > (select max(sal) from emp where job='MANAGER') 

61) Display the names of employees from department number 10 with salary greater than that of ANY employee working in other departments?

  select ename,deptno,sal 
  from emp 
  where deptno=10 and sal> ANY(select sal from emp where deptno in(20,30))

62) Display the names of employees from department number 10 with salary greater than that of ALL employee working in other departments?

  select ename,deptno,sal 
  from emp where deptno=10 and sal> ALL(select sal from emp where deptno in(20,30))

63) Display the names of mployees in Upper Case?

select upper(ename) from emp

  64) Display the names of employees in Lower Case?
 
  select lower(ename) from emp

 65) Display the names of employees in Proper case?
 
   select initcap(ename) from emp

:66) Find the length of your name using Appropriate Function?

select length('umadevi') from dual
  
  67) Display the length of all the employee names?

select length(ename) from emp

68) Display the name of employee Concatinate with Employee Number?

select ename||' '||empno from emp

69) Use appropriate function and extract 3 characters starting from 2 characters from the following string 'Oracle' i.e., the out put should be ac?

select substr('oracle',3,2) from dual

70) Find the first occurance of character a from the following string Computer Maintenance Corporation?

select instr('Computer Maintenance Corporation','a',1) from dual

71) Replace every occurance of alphabet A with B in the string .Alliens (Use Translate function)?

select translate('Alliens','A','B') from dual

72) Display the information from the employee table . where ever job Manager is found it should be displayed as Boss?

select replace(job,'MANAGER','BOSS') from emp

73) Display empno,ename,deptno from tvsemp table. Instead of display department numbers
display the related department name(Use decode function)?

select empno,ename,decode(deptno,10,'ACCOUNTING',
                                 20,'SALES',
                                 30,'RESEARCH',
                                 40,'OPERATIONS') Department_name from emp

74) Display your Age in Days?

select round(sysdate-to_date('28-feb-1991')) from dual

75) Display your Age in Months?

select round((sysdate-to_date('10-sep-1991'))/12) from dual

76) Display current date as 15th August Friday Nineteen Nienty Seven?

select to_char(sysdate,'ddth monthdayyear')"current date" from dual

78) Scott has joined the company on 13th August ninteen ninety?

select ename||' '||'has joined the company on'||' '||to_char(hiredate,'ddth monthdayyear') from emp

79) Find the nearest Saturday after Current date?

select next_day(sysdate,'saturday') from dual

80) Display the current time?

select to_char(sysdate,'hh:mi:ss:AM') from dual

81) Display the date three months before the Current date?

select add_months(sysdate,-3) from dual

82) Display the common jobs from department number 10 and 20?

select job,ename,deptno 
from emp 
where deptno=10 and job in(select job from emp where deptno=20)

83) Display the jobs found in department 10 and 20 Eliminate duplicate jobs?

select job,ename,deptno 
from emp 
where deptno=10 and job not in(select job from emp where deptno=20)

84) Display the jobs which are unique to department 10?

select distinct job 
from emp
where deptno=10

85) Display the details of those employees who do not have any person working under him?

select empno,ename,job 
from emp 
where empno not in(select mgr from emp where mgr is not null) 

86) Display the details of those employees who are in sales department and grade is 3?

select * from emp e inner join dept d 
        on e.deptno=d.deptno join salgrade s 
        on e.sal between s.losal and s.hisal and d.dname='SALES' and s.grade =3 

select *from emp e,dept d,salgrade s 
        where e.deptno=d.deptno and e.sal between s.losal and s.hisal and d.dname='SALES' and s.grade=3

87) Display thoes who are not managers?

select empno,job 
from emp 
where job<>'MANAGER'

88) Display those employees whose name contains not less than 4 characters?

select ename 
from emp 
where length(ename)>4

89) Display those department whose name start with"S" while location name ends with "K"?

select dname,loc 
from dept 
where dname like 'S%' or loc like '%K'

90) Display those employees whose manager name is Jones?

select ename,empno,job,deptno 
from emp 
where mgr= (select empno from emp where ename='JONES')

91) Display those employees whose salary is more than 3000 after giving 20% increment?

 select ename,deptno,job,sal 
 from emp 
 where sal*1.20>3000

92) Display all employees with their department names?

select e.ename,e.empno,d.dname,d.loc,e.job,e.sal 
from emp e inner join dept d 
on e.deptno=d.deptno

93) Display ename who are working in sales department?

select e.ename,d.dname from emp e inner join dept d on e.deptno=d.deptno where d.dname='SALES'

                            (OR)
                    
select ename 
from emp 
where deptno=(select deptno from dept where dname='SALES')

94) Display employee name,dept name,salary,and commission for those sal in between 2000
to 5000 while location is Chicago?

select e.ename,d.dname,e.sal,e.comm,d.loc 
from emp e inner join dept d 
on e.sal
between 2000 and 5000 
and d.loc='CHICAGO'  

95) Display those employees whose salary is greater than his managers salary?

select e.ename,m.ename,e.sal as emp_sal,m.sal as manager_sal 
from emp e,emp m 
where e.mgr=m.empno 
and e.sal>m.sal

96) Display those employees who are working in the same dept where his manager is work?

select e.ename,m.ename,m.deptno 
from emp e inner join emp m 
on  e.empno=m.mgr 
and e.deptno=m.deptno

97) Display those employees who are not working under any Manager?

select *from emp 
where mgr is null

98) Display the grade and employees name for the deptno 10 or 30 but grade is not 4 while joined the company before 31­DEC­82?

select e.ename,s.grade,e.deptno,e.hiredate
from emp e inner join salgrade s on deptno in(10,30) 
and s.grade <> 4 
and e.hiredate <'31-dec-82'

select *from emp

101. select e.ename,e.job,d.dname,d.loc from emp e,dept d where e.deptno=d.deptno and e.job='MANAGER'

102. select empno,ename from emp where empno =(select mgr from emp where ename='JONES')

                      or
                      
      select e.ename "employee name",m.ename "manager name" from emp e,emp m where e.mgr=m.empno and e.ename='JONES'    
      
    select empno,ename from emp where empno IN(select empno from emp where ename='JONES')  
           
102. select m.mgr,em.ename super_manager,m.ename sub_manager_name,m.empno,e.ename,e.empno employee_number,e.job,e.sal
    from emp e,emp m,emp em
    where e.mgr=m.empno 
    and m.mgr=em.empno and m.ename='JONES'
    
103. select e.ename,e.sal,e.job,s.hisal,s.grade from emp e,salgrade s where  e.sal between s.losal and s.hisal and e.ename='FORD' 

......................dynamic sal........................

select * from emp e where &n=(select count(distinct sal) from emp e1 where e1.sal>=e.sal);

select distinct m.ename from emp e, emp m where e.mgr=m.empno 

104. select e.ename employee_name,e.job,d.dname department_name,d.loc,d.deptno,s.grade,m.ename manager_name 
      from emp e,emp m,dept d,salgrade s
      where e.deptno=d.deptno and e.mgr=m.empno and e.sal between s.losal and s.hisal order by d.deptno
      
commit

select m.mgr, m.ename super_manager,m.ename sub_manager_name,m.empno,e.ename,e.empno employee_number,e.job,e.sal
    from emp e,emp m 
    where e.mgr=m.empno and m.ename='JONES'

select m.mgr,e.empno,e.ename,e.job,m.ename manager_name from emp e,emp m where e.mgr=m.empno 

105.  select *from emp e,dept d,salgrade s 
      where e.deptno=d.deptno and e.sal between s.losal and s.hisal and e.job<> 'CLERK' order by e.sal

106.  select e.ename,e.sal,e.job,m.ename manager_name 
      from emp e,emp m 
      where e.mgr=m.empno and e.job<>'MANAGER'
      
107.    select * from (select sal,ename from emp order by sal desc)
        where rownum <=5

108.   select ename,sal from (select ename,sal from emp order by sal desc) where rownum =1

109.  select *from (select (max(sal)+min(sal))/2 from emp)......................

110.   select deptno,count(*) from emp group by deptno having count(empno)>3

111.  select dname,count(empno)from emp,dept where emp.deptno=dept.deptno group by dname 

 112..........................     select distinct m.ename manager_name from emp m,emp e where e.mgr=m.empno 


126.  select ename,sal from emp where length(sal)=3

127.  select ename,hiredate from emp where to_char(hiredate,'MON')='DEC'
128.  select ename from emp where ename like '%A%'

      select ename from emp where length(sal)=4 and length(hiredate)=2 

      select e.ename,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal and e.ename='JONES'

select *from emp where rownum <=(select count(*)-9 from emp) order by sal desc



117.    select *from emp
        minus
       select *from emp where rownum <=(select count(*)-5 from emp) 


select sal,ename,comm,(sal+nvl(comm,0))*12 "tot sal" from emp
select  *from(select sum(sal) from emp)

select ename,sum(sal)  as annualsalary from emp group by ename;

116.  select ename,(select sum(sal) from emp) from emp

commit

select *from(select sal,ename,hiredate,job from emp order by sal desc)where rownum<=5


SELECT empno, ename, deptno 
FROM emp e
WHERE sal > (SELECT AVG(sal) 
FROM emp e1 
WHERE e.deptno = e1.deptno 
GROUP BY deptno)
ORDER BY deptno;

select e.ename,m.ename manager_name,e.sal,e.job
from emp e,emp m 
where e.mgr=m.empno and m.sal >(select avg(e1.sal) from emp e1 where e1.deptno=e.deptno)


116.  select ename,(select sum(sal) from emp) from emp

select dname,(select sum(sal) from emp) from dept

115. select e.ename,e.sal,e.job,m.sal manager_sal,m.ename manager_name from emp e,emp m where e.mgr=m.empno and e.sal > m.sal 


select *from emp
select *from dept
select *from salgrade

118.   select e.ename,e.sal,m.ename manager_name,m.sal,count(*) 
        from emp e,emp m
      where e.mgr=m.empno and e.sal>m.sal group by e.ename,e.sal,m.ename,m.sal
      
 select *from emp where mgr IN(select empno from emp where mgr is null)

126.  select ename,sal from emp where length(sal)=3

127.  select ename,sal,hiredate,job,mgr from emp where to_char(hiredate,'MON')='DEC'

132.  select e.ename,e.sal,e.job,d.dname from emp e,dept d where e.deptno=d.deptno and d.dname='SALES' or d.dname='RESEARCH'

133.  select e.ename,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal and e.ename='JONES'

134.  select hiredate ,ename from emp where to_char(hiredate,'DD') < '15'

135.  select hiredate,ename from emp where to_char(hiredate,'dd')>'15' 


select *from emp where to_char(hiredate,'dd')='8'


select *from emp where job='MANAGER'

select count(*) from emp where job='MANAGER' 

select e.ename,d.dname,d.deptno from emp e,dept d where e.deptno=d.deptno and e.deptno is null


select e.ename,e.job,sum(sal)*12 "annual sal",d.dname,d.deptno,s.grade 
from emp e,dept d,salgrade s
where e.deptno=d.deptno and s.grade between s.losal and s.hisal and e.job='CLERK' and e.sal>1200 group by e.ename,e.job,d.dname





select a,b from(select 1 as a,rownum r1 from (select level as 1 from dual connect by level<10) where mod(1,2)=0) tab1,
(select 1 as b ,rownum r2 from(select level as 1 from dual connect by level<=10) where mod(1,2)!=0) tab2
where tab1.r1=tab2.r2

select  a, b from 
      (select l as a,rownum r1  from (select level as l from dual connect by level<=10) where mod(l,2)=0)t1 ,
      (select l as b ,rownum r2   from (select level as l from dual connect by level<=10) where mod(l,2)!=0)  tab2
where t1.r1=tab2.r2


select to_char(next_day(last_day(add_months(to_date(:yr||'01','yyyymm'),level-1)-7',fri'),'yyyy-mm-dd dy') last friday from dual 
connect by level<=12;


select
    trunc(months_between(sysdate,hiredate)/12) years,
      mod(trunc(months_between(sysdate,hiredate)),12) mths,
      trunc(sysdate - add_months(hiredate,(months_between(sysdate,hiredate)))) days from emp
     trunc(24*mod(date_to - date_from,1)) hrs,
     trunc(60*mod(24*mod(date_to - date_from,1),1)) mins,
    mod((date_to - date_from)*24*60*60,60) secs
   from emp_dates;
   

  
        
        select trunc(sysdate - add_months(hiredate,(months_between(sysdate,hiredate)))) days from emp

select round((sysdate-hiredate)/365) year,
    round(trunc(months_between(sysdate,hiredate))) total_mths,
      round(sysdate - hiredate) total_days,
      round((sysdate - hiredate)*24) total_hours,
    round((sysdate - hiredate)*24*60) total_mins,
    round((sysdate - hiredate)*24*60*60) total_secs
  from emp;


select round((sysdate-to_date('10-sep-91'))) from dual

select to_char(sysdate,'DAY') from dual

select round((sysdate-to_date('10-sep-91'))/365) years,
        round(trunc(months_between(sysdate,to_date('10-sep-91')))) months,
        round(sysdate-to_date('10-sep-91')) days,
        round((sysdate-to_date('10-sep-91'))*24) hours,
        round((sysdate-to_date('10-sep-91'))*24*60) minutes,
        round((sysdate-to_date('10-sep-91'))*24*60*60)secs from dual
        
        
      WITH RECURSIVE 
odd_no (sr_no, n) AS
(
SELECT 1, 1 
union all
SELECT sr_no+1, n+2 from odd_no where odd_no < 5 
)
SELECT * FROM odd_no;    
        
        
 create table odd_no(sr_no number,n number)       
        
insert into odd_no values(&sr_no,&n)        
        
select *from odd_no        
       
commit

select *from (select sal from emp where sal>1200 ) a where a.sal<1200 

select dname,count(*) from dept group by dname



213. select dname,(select sum(sal) from emp) from dept

214. select dname,count(empno)
      from emp,dept 
      where emp.deptno=dept.deptno group by dname 

212. select e.ename "Employee Name",m.ename "Manager Name" 
      from emp e,emp m 
      where e.mgr=m.empno

211. select d.dname "department Name",e.ename "Employee Name" from emp e 
      full outer join dept d 
      on e.deptno=d.deptno

210. select e.empno,e.ename "Employee Name",d.loc "Location",d.dname "Department Name" 
      from emp e,dept d
      where e.deptno=d.deptno

209.  select e.ename "Employee Name",d.dname "Department Name" 
      from emp e inner join dept d
      on e.deptno=d.deptno

208.  select ename,comm*2 "Increment comm" ,comm 
      from emp 
      where comm is not null

 207. select empno,ename,nvl2(comm,0,200) "commission" 
      from emp

206.  delete from emp where round(to_char(sysdate-hiredate)/365)>2 from emp

205.  create table newemp as 
      select e.empno "Employee Number",e.ename "Employee Name",d.dname "Department Name"
      from emp e inner join dept d
      on e.deptno=d.deptno

204.  create table NewEmp1 as select *from emp

create table empuma as select *from emp where empno=0
select *from empuma

200. alter table empuma add mgr1 number

201. alter table empuma add constraint fk_mgr1_empno foreign key(mgr1) references emp(empno)

202. alter table empuma add  deptno1 number

203. alter table empuma add constraint fk_deptno1 foreign key(deptno) references dept(deptno)

 select ename,round((sysdate-hiredate)/365) from emp where round((sysdate-hiredate)/365)>2 
 
 
 
 185.select ename if ename exists more than once
 
  select count(ename) from emp having count(ename)>1
 
 186.Display all enames in reverse order
  
 select ename from emp order by rownum desc
 
 187.Display those employee whose joining of month and grade is equal
 
select e.ename,e.empno,s.grade 
from emp e,salgrade s
where e.sal between s.losal and s.hisal and to_char(hiredate,'mm')=s.grade


 188.Display those employee whose joining date is available in deptno
 
 select ename from emp where to_char(hiredate,'dd')=deptno
 
189.Display those employee name as follows A ALLEN, B BLAKE

  select substr(ename,1,1)||' '||ename from emp

190.List out the employees ename,sal,pf from emp

  select ename,sal,sal*30/100 pf from emp

192.Create table emp with only one column empno

create table emp2(empno number(3))

193.Add this column to emp table ename varchar2(20)

alter table emp2 add ename varchar2(20)

194.OOPSI i forget to give the primary key constraint. Add it now
 
 alter table emp2 add constraint pk_empno_emp2 primary key(empno)
 
 195.Now increase the length of ename column to 30 characters
 
 alter table emp2 modify  ename varchar2(30)
 
 196. Add salary column to emp table?

 alter table emp2 add sal number
 
197.I want to give a validation saying that sal can not be greater 10000(note give a name to this column)

alter table emp2 modify sal number add constraint chkk_sal check (sal>10000) 

198.For the time being i have decided that i will not impose this validation. My boss has agreed to pay more than 10000

alter table emp2 drop constraint chkk_sal

alter table emp2 disable constraint chkk_saal

199. My boss has changed his mind. Now he doesnt want to pay more than 10000 So revoke that salary constraint

alter table emp2 modify sal number add constraint chkk_sal check (sal>10000) 

OR

alter table emp2 enable constraint chkk_saal 

200.Add column called as mgr to your emp table

alter table emp2 add mgr number 

select ename from emp order by rownum desc








 
 184.Create a copy of emp table
 
 create table Empp as select *from emp
 
183.Delete the 10th record of emp table
  
delete from Empp where empno IN (select empno from Empp where rownum <=10
                               minus
                              select empno from Empp where rownum <=9)

182.Display the 10th record of emp table without using group by and rowid
 
 select * from Empp where rownum <=10
  minus
  select * from Empp where rownum <=9

181.Display the half of the enames in upper case and remaining lower case

 select concat(upper(substr(ename,0,length(ename)/2)), lower(substr(ename,length(ename)/2+1,length(ename)))) Employee_name from emp
 
180.Display the 10 th record of emp table (without using rowid)

select * from Empp where rownum <=10
  minus
  select * from Empp where rownum <=9

179.Find all depts which have more than 3 employees

      select e.deptno,d.dname 
      from emp e,dept d 
      where e.deptno=d.deptno
      group by e.deptno,d.dname having count(*)>3

178.Find out avg sal and avg total remainders for each job type

select round(avg(sal)),job,count(*) from emp group by job 

177.Find employees who can earn more than every employees in dept no 30.

select ename,sal from emp where sal>(select max(sal) from emp where deptno=30)
  

177.select dept name and deptno and sum of sal break on deptno on
dname?
 select e.deptno,d.dname,sum(e.sal) from emp e,dept d  
            where e.deptno=d.deptno group by e.deptno,d.dname order by deptno


176.Display employees who can earn more than lowest sal in dept no 30

select ename,sal from emp where sal>(select min(sal) from emp where deptno=30)

175.Write a query of display against the row of the most recently hierd employee.display ename hire date and column max date showing

select empno,ename,hiredate "Max date" from emp where hiredate=(select max(hiredate) from emp)

174.Display avg sal figure for the dept

select deptno,round(avg(sal)) from emp group by deptno

173.In which year did most people join the company. Display the year and number of employees

select count(*),to_char(hiredate,'yyyy') from emp group by to_char(hiredate,'yyyy') having count(*)>3

172.Display the dept no with highest annual remuneration bill as compensation

select deptno,sum(sal) from emp group by deptno having sum(sal)=(select max(sum(sal))from emp group by deptno)

 171.Display the department where there are no employees
 
 select deptno,dname from dept where deptno not in(select distinct deptno from emp)
 
 170.Display ename, sal and deptno for each employee who earn a sal greater than the avg of their department order by deptno
 
**** select e.ename,e.sal,e.deptno from emp e where e.sal > (select round(avg(sal)) from emp group by deptno=e.deptno)order by e.deptno
 
 169.Find out the most recently hired employees in each dept order by hire date
 
 select max(hiredate),deptno from emp group by deptno order by max(hiredate)

 168.Find out the employees who earned the min sal for their job in ascending order
 
 select job,min(sal) from emp group by job order by min(sal)
 
 167.Find out the employees who earned the highest sal in each job typed sort in descending sal order
 
 select job,max(sal) from emp group by job order by max(sal) desc
 
 166.List out the all employees by name and number along with their manager name and number also display 'NO MANAGER' who has no
manager

  select e.ename employee_name,e.empno,m.ename "Manager_name",m.empno "Manager_number",nvl(m.ename,'NO MANAGER')
    from emp e left outer join emp m
    on e.mgr=m.empno

165.Find out the all employees who joined the company before their manager

select *from emp e where hiredate >(select hiredate from emp where empno=e.mgr)


163.List ename, job, annual sal, deptno, dname and grade who earn 30000 per year and who are not clerks

select e.ename,e.job,(e.sal+nvl(comm,0))*12 Annual_sal,e.deptno,d.dname,s.grade 
from emp e inner join dept d
on e.deptno=d.deptno join salgrade s
on
e.sal between s.losal and s.hisal and (e.sal+nvl(comm,0))*12 >30000 and job <>'CLERK'


162.List out the lowest paid employees working for each manager, exclude any groups where minsal is less than
1000 sort the output by sal

select e.ename,e.sal ,m.ename Manager_Name
from emp e,emp m 
where e.mgr=m.empno
and e.sal<1000 order by e.sal

161.Check whether all employees number are indeed unique
select empno,count(*) from emp group by empno having count(*)=1 

159.Find out how many managers are there with out listing them
select count(*)from  emp where job='MANAGER'


160.Find out the avg sal and avg total remuneration for each job type remember
salesman earn commission define emp_ann_sal=(sal+nvl(comm,0))*.12





select *from emp
select ename from emp where ename like 'M%'
select ename from emp where ename like '%R'

create table store_info(store_name varchar2(20),sales number,txn_date date)

insert into store_info values('los angles',2000,'05-jan-2012')
insert into store_info values('san diego',250,'07-jan-2012')
insert into store_info values('san francisco',300,'08-jan-2012')
insert into store_info values('boston',700,'08-jan-2012')

select *from store_info

select store_name,
        case store_name when 'los angles' then sales*2
                        when 'san diego' then sales*1.5
                        else sales end "new sales",
        txn_date from store_info;
                      


select store_name,
        case store_name when 'los angles' then 'america'
                        when 'san diego' then 'california'
                        else 'new york' end "new Name",
        txn_date from store_info
                    








 
 
