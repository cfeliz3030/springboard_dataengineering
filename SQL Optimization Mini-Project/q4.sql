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

-- 4. List the names of students who have taken a course taught by professor v5 (name).
 SELECT name 
FROM Student,
	(SELECT studId 
    FROM Transcript,
		(SELECT crsCode, semester 
        FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;

# The query above had a couple of performance issues and no output. One of it's issues was performing a full table scan in order to look for the appropriate records.
# The query also made use of multiple nested sub queries which can slow down performance. In order to improve the performance of this query I decided to make
# use of common table expressions. This will not only improve the speed of this query but also its readability. I also created indexes on tables that we where 
# joining on (primary keys or foreign keys). Query performance was then improved by filtering and retrieving less records than before. 
# The original query performed a full table scan, using a cte and indexes our query now performs access type 'ref/eq_ref'.

ALTER Table Student
ADD unique id_stu_idx (id);

ALTER Table Professor
ADD unique id_prof_idx(id);

ALTER Table Teaching
ADD index prof_crs_idx(profid,crsCode);

ALTER Table Transcript
ADD index trans_crs_idx(crsCode);


# retrieve courses taught by amber hill
with cte as (
select t.crsCode, tr.studId
from Professor as p
join Teaching as t
on p.id = t.profid
join Transcript as tr
on t.crsCode = tr.crsCode
where p.name = @v5)

select name
from cte
join Student as s
on cte.studId = s.id;


