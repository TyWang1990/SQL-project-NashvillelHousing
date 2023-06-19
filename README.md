# SQL Project: Nashville Housing

This project focuses on utilizing various data manipulation commands in SQL to query a relational database containing tables with housing information. The project is referenced from the content on the YouTube channel "Alex The Analyst."

## Instructions

1. Convert the data type of a column:
   - SQL function: `CONVERT(data type, XXX)`
   - SQL command: `UPDATE XXX SET XXX`

2. Add a new column to the table:
   - SQL function: `ALTER TABLE XXX ADD XXX data type`

3. Populate null values in the PropertyAddress column in reference to rows that have the property address, share the same parcel ID with the rows with null values but do not share the unique ID:
   - SQL functions: `UPDATE`, `SET`, `ISNULL(null, reference)`, `JOIN`, `AND`

4. Extract a substring of the property address by using a comma as a separator:
   - SQL functions: `SELECT`, `SUBSTRING()`, `CHARINDEX()`

5. Replace the comma in a string with the period mark and parse the string:
   - SQL functions: `SELECT`, `PARSENAME()`, `REPLACE()`

6. Show distinct values in a column and count the number of those distinct values. Order the query results by the count:
   - SQL functions: `SELECT`, `DISTINCT()`, `COUNT()`, `GROUP BY`, `ORDER BY`

7. Create a new column based on values in a different column:
   - SQL function: `SELECT`, `CASE WHEN XXX THEN XXX ELSE XXX END`

8. Remove duplicates in a table using:
   - SQL functions: `DELETE FROM XXX WHERE XXX`, `WITH XXX AS ()`, `ROW_NUMBER()`, `OVER(PARTITION BY XXX ORDER BY XXX)`

9. Delete column(s):
   - SQL functions: `ALTER TABLE`, `DROP COLUMN`

## Usage

You can use the provided SQL functions and commands to manipulate data in a relational database. Simply replace the placeholders (e.g., `XXX`) with the appropriate table and column names, and modify the data type or conditions as needed.

Please refer to the specific SQL function's documentation for detailed information on its usage and parameters.

