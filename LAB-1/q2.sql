DECLARE 
   c_id employee.empno%type; 
   c_dept employee.deptno%type; 
   c_sal employee.sal%type; 
   CURSOR c_employee is 
      SELECT empno, deptno, sal FROM employee;
BEGIN 
   CREATE TABLE temp(empno number NOT NULL PRIMARY KEY, old_sal number, new_sal number);
   OPEN c_employee; 
   LOOP 
   FETCH c_employee into c_id, c_dept, c_sal; 
      EXIT WHEN c_employee%notfound; 
      dbms_output.put_line(c_id || ' ' || c_dept || ' ' || c_sal); 
      IF (c_dept = 10) THEN
      UPDATE employee SET sal = sal + 1000 WHERE empno = c_id;
      INSERT INTO temp VALUES(c_id, c_sal, c_sal+1000);

   END LOOP; 
   CLOSE c_employee; 
END; 
/