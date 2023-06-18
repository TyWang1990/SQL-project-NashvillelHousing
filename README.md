# SQL-project-NashvillelHousing
1. convert the data type of a column.
SQL function: CONVERT(data type, XXX), UPDATE XXX SET XXX

2. add a new column to the table.
SQL function: ALTER TABLE XXX ADD XXX data type

3. populate null values in PropertyAddress column in reference to rows that have the property address, share the same parcel ID with the rows with null values but do not share the unique ID
SQL function: UPDATE, SET, ISNULL(null, reference), JOIN, AND

4. extract substring of the property address by using comma as a separator.
SQL function: SELECT, SUBSTRING(), CHARINDEX()

5. replace the comma in a string with the period mark, and parse the string.
SQL function: SELECT, PARSENAME(), REPLACE()

6. show distinct values in a column and count the number of those distinct values. Order the query results by the count.
SQL function: SELECT, DISTINCT(), COUNT(), GROUP BY, ORDER BY

7. 
