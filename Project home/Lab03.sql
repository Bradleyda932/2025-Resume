-- Bradley Antholz
-- Lab 03: Intro to SQL

-- This Lab is our introduction to SQL in Cloud and Database Systems, something I learned back in my first semester at Drake University with Database Management.
-- We were given an outline of what we need to do, and it was done through the AWS EC2 Instance. 

----- Question 1: Write a query and display the results of a query that displays all of the student IDs, names, and GPAs 
----- for all students in the database with a sID less than 300. Submit both the query and the results from running the query 
----- (this should also include the last line that indicates X rows in the set).

--- Input:
Select sID, sName, gpa
From Student
Where sID < 300;
---
--- Output:
+------+--------+------+
| sID  | sName  | gpa  |
+------+--------+------+
| 123  | Amy    | 3.9  |
| 234  | Bob    | 3.6  |
+------+--------+------+
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
| sName | cName    | gpa  |
+-------+----------+------+
| Amy   | Stanford | 3.9  |
| Amy   | Berkeley | 3.9  |
| Amy   | Cornell  | 3.9  |
| Bob   | Berkeley | 3.6  |
| Craig | MIT      | 3.5  |
| Craig | Cornell  | 3.5  |
| Fay   | Stanford | 3.8  |
| Helen | Stanford | 3.7  |
| Helen | Berkeley | 3.7  |
| Irene | Stanford | 3.9  |
| Irene | MIT      | 3.9  |
| Jay   | Stanford | 2.9  |
| Jay   | Cornell  | 2.9  |
| Craig | MIT      | 3.4  |
+-------+----------+------+
---

----- Question 3: What are the GPAs of students in the database that applied to Stanford with a major in CS and has a sizeHS of 
----- less than 900? Submit the query and the results from running the query.

--- Input: 
SELECT GPA
FROM Student, Apply
WHERE Student.sID = Apply.sID and sizeHS < 900 and major = 'CS' and cName = 'Stanford';
---
--- Output:
+------+
| GPA  |
+------+
| 3.7  |
| 3.9  |
+------+
---

----- Question 4: What are the sIDs, sNames, GPA, cNames, and state for all students in the database with 
----- a GPA greater than 3.75 that applied to a college in the state of CA? Display only distinct values. 
----- Submit the query and the results from running the query.

--- Input:
Select distinct S.sID, sName, GPA, C.cName, state
From Student S, College C, Apply A
Where S.sID = A.sID and C.cName = A.cName and GPA > 3.75 and state = 'CA';
---
--- Output: 
+------+-------+------+----------+-------+
| sID  | sName | GPA  | cName    | state |
+------+-------+------+----------+-------+
| 123  | Amy   | 3.9  | Berkeley | CA    |
| 123  | Amy   | 3.9  | Stanford | CA    |
| 678  | Fay   | 3.8  | Stanford | CA    |
| 876  | Irene | 3.9  | Stanford | CA    |
+------+-------+------+----------+-------+
---

