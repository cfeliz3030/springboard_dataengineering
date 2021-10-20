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

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
ALTER Table Student
ADD INDEX id_name_idx (id,name);

SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;

# Query was performing a full table scan. Created an index using a combination of 'id' and 'name' columns,
# in order to improve speed of name retrieval. Type scan improved from 'ALL' to 'RANGE'.

