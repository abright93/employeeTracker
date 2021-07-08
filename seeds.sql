use employeetracker;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Analystics'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('General Manager', 11000000, 1),
    ('Coach', 4000000, 1),
    ('Team Lead Analyst', 15000000, 2),
    ('Team Analyst', 8000000, 2),
    ('Media Manager', 7000000, 3),
    ('Media Specialist', 3000000, 3),
    ('CEO', 45000000, 4),
    ('CEO Assistant', 25000000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Jon', 'Snow', 1, NULL),
    ('Aarya', 'Stark', 2, 1),
    ('Cersei', 'Lannister', 3, NULL),
    ('Margaery', 'Tyrell', 4, 3),
    ('Stannis', 'Baratheon', 5, NULL),
    ('Daenerys', 'Targaryen', 6, 5),
    ('Sandor', 'Clegane', 7, NULL),
    ('Theon', 'Greyjoy', 8, 7);
    
SELECT role.id, role.title, role.salary FROM role ORDER BY role.id;
SELECT role.id, role.title FROM role ORDER BY role.id;
SELECT * FROM employee;

SELECT department.id, department.name FROM department ORDER BY department.id;

SELECT department.name AS department, role.title, employee.id, employee.first_name, employee.last_name
    FROM employee
    LEFT JOIN role ON (role.id = employee.role_id)
    LEFT JOIN department ON (department.id = role.department_id)
    ORDER BY department.name;
    
SELECT CONCAT(manager.first_name, ' ', manager.last_name) AS manager, department.name AS department, employee.id, employee.first_name, employee.last_name, role.title
  FROM employee
  LEFT JOIN employee manager on manager.id = employee.manager_id
  INNER JOIN role ON (role.id = employee.role_id && employee.manager_id != 'NULL')
  INNER JOIN department ON (department.id = role.department_id)
  ORDER BY manager;
  
SELECT role.title, employee.id, employee.first_name, employee.last_name, department.name AS department
    FROM employee
    LEFT JOIN role ON (role.id = employee.role_id)
    LEFT JOIN department ON (department.id = role.department_id)
    ORDER BY role.title;

SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS manager
  FROM employee
  LEFT JOIN employee manager on manager.id = employee.manager_id
  INNER JOIN role ON (role.id = employee.role_id)
  INNER JOIN department ON (department.id = role.department_id)
  ORDER BY employee.id;
  
SELECT first_name, last_name, role_id FROM employee 	WHERE employee.id = 4;