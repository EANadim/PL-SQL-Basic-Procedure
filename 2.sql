/*Procedure*/
create or replace procedure p1(e_ename emp.ename%TYPE,salcom out emp.sal%TYPE)
is
begin
    select sal+nvl(comm,0) into salcom from emp where ename=e_ename;
end;

/*Execution Block*/
declare
    e_ename emp.ename%TYPE;
    salcom emp.sal%TYPE;
    cursor c1 is
    select ename from emp;
begin
    for i in c1 loop
        e_ename:=i.ename;
        p1(e_ename,salcom);
        dbms_output.put_line(e_ename||' '||salcom);
    end loop;
end;