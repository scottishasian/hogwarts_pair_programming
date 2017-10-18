DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT8
);

CREATE TABLE houses (
  id SERIAL8 PRIMARY KEY,
  house_name VARCHAR(255),
  house_logo VARCHAR(255),
  student_id INT8 REFERENCES students(id) ON DELETE CASCADE
);
