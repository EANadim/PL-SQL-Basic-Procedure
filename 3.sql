/*Procedure*/
create or replace procedure p1(e_empno emp.empno%TYPE,e_ename emp.ename%TYPE,e_deptno emp.deptno%TYPE)
is
begin
    if(VALID_DEPTNO(e_deptno)=1)
    then
    insert into emp (empno,ename,deptno) values(e_empno,e_ename,e_deptno);
    dbms_output.put_line('Okay');
    else
    dbms_output.put_line('Not Okay');
    end if;
end;

/*Fucntion*/
create or replace function VALID_DEPTNO(e_deptno emp.deptno%TYPE)
return number
is
    cursor c1 is
    select deptno from dept;
begin
    for i in c1 loop
        if(e_deptno=i.deptno)
        then
        return 1;
        end if;
    end loop;
    return 0;
end;

/*Execution block*/
declare
    e_ename emp.ename%TYPE:=:Enter_Name;
    e_empno emp.empno%TYPE:=:Enter_Emp_No;
    e_deptno emp.deptno%TYPE:=:Enter_Dept_No;
begin
    p1(e_empno,e_ename,e_deptno);
end;