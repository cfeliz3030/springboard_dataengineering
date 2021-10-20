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

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
 SELECT * FROM Student, 
	(SELECT studId 
    FROM Transcript, Course 
    WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
		(SELECT studId 
		FROM Transcript, Course 
		WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

#The above query performs a full table scan, retrieves unnecessary extra columns, and contains duplicates.
#I refactored the query to only return the name column and no duplicates. I also created indexes to
#speed up retrieval time.

ALTER Table Student
ADD unique id_stu_idx (id);

ALTER Table Course
ADD index crs_dept_idx(deptid,crsCode);

ALTER Table Transcript
ADD index trans_crs_idx(crsCode);

SELECT name 
FROM Student
where id in
	(SELECT studId 
    FROM Transcript, Course 
    WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
		(SELECT studId 
		FROM Transcript, Course 
		WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode));



