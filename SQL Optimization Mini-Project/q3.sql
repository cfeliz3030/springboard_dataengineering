USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);

# New Query
# I created a new query using a inner join instead of a subquery because it has a faster retrieval process. 
# Then I created a unique index on 'Id' from student table and an index on 'crsCode' from the Transcript table.
# The original query performed a full table scan, using a join and indexes our query now performs access type 'ref'.

ALTER Table Student
ADD unique id_name (id);

ALTER Table Transcript
ADD INDEX crs_idx (crsCode);

SELECT name 
FROM Student as s
join Transcript as t
on s.id = t.studId
WHERE crsCode = @v4;

