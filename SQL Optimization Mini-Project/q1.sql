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

-- 1. List the name of the student with id equal to v1 (id).

ALTER Table Student
ADD UNIQUE INDEX id_idx (id);

SELECT name FROM Student WHERE id = @v1;


# Query was performing a full table scan. Created a index on the column that was being filtered (id). Added unique constraint to 'id' col.
# Access type updated from 'Full' to 'Const'.



