SELECT *
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
ORDER BY ParcelID DESC;



--Standardize Date Format
SELECT SaleDate
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]

SELECT SaleDate, CAST(SaleDate AS DATE) --or CONVERT(DATE, SaleDate)
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
--1
UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]  --this sql query did not work
SET SaleDate=CONVERT(DATE, SaleDate)
--2
ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD SaleDateConverted Date;

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET SaleDateConverted=CONVERT(DATE, SaleDate)

SELECT SaleDate, SaleDateConverted
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]



--3
--Populate Null Values in Property Address Fields (column) in Reference to Rows That Share the Same Values in A Different Column to The null  Rows
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress
FROM [SQL_housing dataset].[dbo].[NashvilleHousing] a
JOIN [SQL_housing dataset].[dbo].[NashvilleHousing] b
ON a.ParcelID=b.ParcelID
AND a.UniqueID<>b.UniqueID
WHERE a.PropertyAddress IS NULL

UPDATE a
SET a.PropertyAddress=ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [SQL_housing dataset].[dbo].[NashvilleHousing] a
JOIN [SQL_housing dataset].[dbo].[NashvilleHousing] b
ON a.ParcelID=b.ParcelID
AND a.UniqueID<>b.UniqueID



--Braking out Address into Individual Columns
--4
SELECT
SUBSTRING(PropertyAddress, 1, (CHARINDEX(',', PropertyAddress)-1)) AS address,--take substring from string, CHARINDEX() returns the index position of ',', which is then taken as the length of charindex
SUBSTRING(PropertyAddress, (CHARINDEX(',', PropertyAddress)+1), LEN(PropertyAddress)) AS addressLatter
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD PropertySplitAddress NVARCHAR(255)

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET PropertySplitAddress=SUBSTRING(PropertyAddress, 1, (CHARINDEX(',', PropertyAddress)-1))

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD PropertySplitCity NVARCHAR(255)

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET PropertySplitCity=SUBSTRING(PropertyAddress, (CHARINDEX(',', PropertyAddress)+1), LEN(PropertyAddress))

SELECT PropertyAddress, PropertySplitAddress, PropertySplitCity FROM [SQL_housing dataset].[dbo].[NashvilleHousing]

SELECT OwnerAddress FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
--5
SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD OwnerSplitAddress NVARCHAR(255)

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET OwnerSplitAddress=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD OwnerSplitCity NVARCHAR(255)

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET OwnerSplitCity=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
ADD OwnerSplitState NVARCHAR(255)

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET OwnerSplitState=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

SELECT *
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]



--Change Y and N to Yes and No in 'Sold as Vacant' field
--6
SELECT DISTINCT(SoldAsVacant), Count(SoldASVacant) AS countnumber
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
GROUP BY SoldAsVacant
ORDER BY countnumber
--7
SELECT SoldAsVacant,
CASE WHEN SoldAsVacant='Y' THEN 'Yes'
     WHEN SoldAsVacant='N' THEN 'No'
	   ELSE SoldAsVacant
	   END
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]

UPDATE [SQL_housing dataset].[dbo].[NashvilleHousing]
SET SoldAsVacant=CASE WHEN SoldAsVacant='Y' THEN 'Yes'
                      WHEN SoldAsVacant='N' THEN 'No'
	                  ELSE SoldAsVacant
	                  END



--Remove Duplicates;
--8
WITH RowNumCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
ORDER BY UniqueID
) row_num
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
--ORDER BY row_num, ParcelID
)
DELETE
FROM RowNumCTE
WHERE row_num>1

WITH RowNumCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
ORDER BY UniqueID
) row_num
FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
--ORDER BY row_num, ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num>1



--Delete Unused Columns
--9
ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddressf

ALTER TABLE [SQL_housing dataset].[dbo].[NashvilleHousing]
DROP COLUMN SaleDate

--Create, alter and populate A New Table, and Rename A Column
USE [SQL_housing dataset]
CREATE TABLE TestTable
(
id INT PRIMARY KEY, 
address NVARCHAR(255),
bedress INT,
price DECIMAL(10, 2)
);



SELECT * FROM [SQL_housing dataset].[dbo].[NashvilleHousing]
