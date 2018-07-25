/*Procedure*/
create or replace procedure p1(e_deptno emp.deptno%TYPE,e_dname out dept.dname%TYPE,e_loc out dept.loc%TYPE,noofemp out number)
is
Begin
    select dname,loc into e_dname,e_loc from dept where deptno=e_deptno;
    select count(*) into noofemp from emp where deptno=e_deptno group by deptno;
End;

/*Execution block*/
Declare
    e_deptno emp.deptno%TYPE:=:Enter_dept_number;
    e_dname dept.dname%TYPE;
    e_loc dept.loc%TYPE;
    noofemp number;
Begin
    p1(e_deptno,e_dname,e_loc,noofemp);
    dbms_output.put_line(e_dname||' '||e_loc||' '||noofemp);
End;