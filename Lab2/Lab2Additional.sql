use university;

-- A
SELECT
    SUM(CASE
        WHEN takes.grade = 'A' THEN 4.0 * course.credits
        WHEN takes.grade = 'A+' THEN 4.0 * course.credits
        WHEN takes.grade = 'A-' THEN 3.7 * course.credits
        WHEN takes.grade = 'B+' THEN 3.3 * course.credits
        WHEN takes.grade = 'B' THEN 3.0 * course.credits
        WHEN takes.grade = 'B-' THEN 2.7 * course.credits
        WHEN takes.grade = 'C+' THEN 2.3 * course.credits
        WHEN takes.grade = 'C' THEN 2.0 * course.credits
        WHEN takes.grade = 'C-' THEN 1.7 * course.credits
        WHEN takes.grade = 'D+' THEN 1.3 * course.credits
        WHEN takes.grade = 'D' THEN 1.0 * course.credits
        WHEN takes.grade = 'D-' THEN 0.7 * course.credits
        ELSE 0.0
    END) Total_GPA
FROM takes JOIN course ON takes.course_id = course.course_id where ID="12345";

-- B
SELECT
    SUM(CASE
        WHEN takes.grade = 'A' THEN 4.0 * course.credits
        WHEN takes.grade = 'A+' THEN 4.0 * course.credits
        WHEN takes.grade = 'A-' THEN 3.7 * course.credits
        WHEN takes.grade = 'B+' THEN 3.3 * course.credits
        WHEN takes.grade = 'B' THEN 3.0 * course.credits
        WHEN takes.grade = 'B-' THEN 2.7 * course.credits
        WHEN takes.grade = 'C+' THEN 2.3 * course.credits
        WHEN takes.grade = 'C' THEN 2.0 * course.credits
        WHEN takes.grade = 'C-' THEN 1.7 * course.credits
        WHEN takes.grade = 'D+' THEN 1.3 * course.credits
        WHEN takes.grade = 'D' THEN 1.0 * course.credits
        WHEN takes.grade = 'D-' THEN 0.7 * course.credits
        ELSE 0.0
    END) / SUM(course.credits) AS GPA
FROM takes JOIN course ON takes.course_id = course.course_id where ID="12345";

-- C
SELECT
    takes.ID,
    SUM(CASE
        WHEN takes.grade = 'A' THEN 4.0 * course.credits
        WHEN takes.grade = 'A+' THEN 4.0 * course.credits
        WHEN takes.grade = 'A-' THEN 3.7 * course.credits
        WHEN takes.grade = 'B+' THEN 3.3 * course.credits
        WHEN takes.grade = 'B' THEN 3.0 * course.credits
        WHEN takes.grade = 'B-' THEN 2.7 * course.credits
        WHEN takes.grade = 'C+' THEN 2.3 * course.credits
        WHEN takes.grade = 'C' THEN 2.0 * course.credits
        WHEN takes.grade = 'C-' THEN 1.7 * course.credits
        WHEN takes.grade = 'D+' THEN 1.3 * course.credits
        WHEN takes.grade = 'D' THEN 1.0 * course.credits
        WHEN takes.grade = 'D-' THEN 0.7 * course.credits
        ELSE 0.0
    END) / SUM(course.credits) AS GPA
FROM takes JOIN course ON takes.course_id = course.course_id GROUP BY takes.ID order by GPA desc;

-- D
SELECT
    t.ID,
    COALESCE(
        SUM(CASE
		WHEN takes.grade = 'A' THEN 4.0 * course.credits
        WHEN takes.grade = 'A+' THEN 4.0 * course.credits
        WHEN takes.grade = 'A-' THEN 3.7 * course.credits
        WHEN takes.grade = 'B+' THEN 3.3 * course.credits
        WHEN takes.grade = 'B' THEN 3.0 * course.credits
        WHEN takes.grade = 'B-' THEN 2.7 * course.credits
        WHEN takes.grade = 'C+' THEN 2.3 * course.credits
        WHEN takes.grade = 'C' THEN 2.0 * course.credits
        WHEN takes.grade = 'C-' THEN 1.7 * course.credits
        WHEN takes.grade = 'D+' THEN 1.3 * course.credits
        WHEN takes.grade = 'D' THEN 1.0 * course.credits
        WHEN takes.grade = 'D-' THEN 0.7 * course.credits
        ELSE 0.0
        END) /NULLIF(SUM(CASE WHEN takes.grade IS NOT NULL THEN c.credits ELSE 0 END), 0), 0.0) AS Weighted_GPA
FROM takes JOIN course ON takes.course_id = course.course_id GROUP BY takes.ID order by Weighted_GPA desc;
