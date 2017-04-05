DECLARE 
   c_id employee.empno%type; 
   c_name employee.empname%type; 
   c_job employee.job%type; 
   CURSOR c_employee is 
      SELECT empno, empname, job FROM employee WHERE deptno = 10;
BEGIN 
   OPEN c_employee; 
   LOOP 
   FETCH c_employee into c_id, c_name, c_job; 
      EXIT WHEN c_employee%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_job); 
   END LOOP; 
   CLOSE c_employee; 
END; 
/