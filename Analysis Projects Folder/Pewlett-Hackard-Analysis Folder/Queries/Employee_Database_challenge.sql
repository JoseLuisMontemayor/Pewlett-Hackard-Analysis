-- Deliverable 1: The Nummber of Retiring Employees by Title
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Check the table
SELECT * FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Check the table
SELECT * FROM unique_titles;

-- Number of employees by their most recent job title who are about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Check the table
SELECT * FROM retiring_titles;


-- Derliverable 2: The Employees Eligible for the Mentorship Program 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Check the table
SELECT * FROM mentorship_eligibility;





























		

		