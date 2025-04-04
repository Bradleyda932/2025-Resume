-- Bradley Antholz
-- Lab 03: Intro to SQL

-- This Lab is our introduction to SQL in Cloud and Database Systems, something I learned back in my first semester at Drake University with Database Management.
-- We were given an outline of what all Professor Moore was looking for, and it was done through the AWS EC2 Instance. 

----- Question 1: Write a query and display the results of a query that displays all of the student IDs, names, and GPAs 
----- for all students in the database with a sID less than 300. Submit both the query and the results from running the query 
----- (this should also include the last line that indicates X rows in the set).

--- Input:
Select sID, sName, gpa
From Student
Where sID < 300;
---
--- Output:
+------+-------+------+
| sID | sName | gpa |
+------+-------+------+
| 123 | Amy  | 3.9 |
| 234 | Bob  | 3.6 |
+------+-------+------+
2 rows in set (0.00 sec)
---
----- Question 2: Write a query that displays all of the unique student names, college names, and GPAs. 
----- Submit both the query and the results. Submit the query and the results from running the query.

--- Input: 
Select distinct sName, cName, gpa
From Student Join Apply
Where Student.sID = Apply.sID;
---
--- Output: 
+-------+----------+------+
| sName | cName  | gpa |
+-------+----------+------+
| Amy  | Stanford | 3.9 |
| Amy  | Berkeley | 3.9 |
| Amy  | Cornell | 3.9 |
| Bob  | Berkeley | 3.6 |
| Craig | MIT   | 3.5 |
| Craig | Cornell | 3.5 |
| Fay  | Stanford | 3.8 |
| Helen | Stanford | 3.7 |
| Helen | Berkeley | 3.7 |
| Irene | Stanford | 3.9 |
| Irene | MIT   | 3.9 |
| Jay  | Stanford | 2.9 |
| Jay  | Cornell | 2.9 |
| Craig | MIT   | 3.4 |
+-------+----------+------+
14 rows in set (0.00 sec)
---
