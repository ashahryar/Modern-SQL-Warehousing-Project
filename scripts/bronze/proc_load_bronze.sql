/*  
===============================================================================
Stored Procedure : load Bronze layer (Source -> Bronze)
Parameter :
    None 
    Stored Procedure doesn't return or accept any value.
Example :
    EXEC Bronze.load_bronze
===============================================================================
*/

-- First create or alter the procedure
CREATE OR ALTER PROCEDURE Bronze.load_bronze
AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME , @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';        
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT ' >> TRUNCATE TABLE: Bronze.crm_sales_details' ;
		TRUNCATE TABLE Bronze.crm_sales_details;
		PRINT '>> INSERT DATA INTO BRONZE: Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info
		FROM 'C:\Users\info soft\Downloads\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds ';
		
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE: Bronze.crm_prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info;
		PRINT '>> INSERTING DATA INTO : Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info
		FROM 'C:\Users\info soft\Downloads\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds';

		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE : Bronze.crm_sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details;
		PRINT '>> INSERTING DATA INTO : Bronze.crm_sales_details';
		BULK INSERT Bronze.crm_sales_details
		FROM 'C:\Users\info soft\Downloads\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds';

		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';      
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE : Bronze.erp_loc_a101';
		TRUNCATE TABLE Bronze.erp_loc_a101;
		PRINT '>> INSERTING DATA INTO : Bronze.erp_loc_a101';
		BULK INSERT Bronze.erp_loc_a101
		FROM 'C:\Users\info soft\Downloads\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR =  '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds';

		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE Bronze.erp_cust_az12';
		TRUNCATE TABLE Bronze.erp_cust_az12;
		PRINT '>> INSERTING DATA INTO : Bronze.erp_cust_az12';
		BULK INSERT Bronze.erp_cust_az12
		FROM 'C:\Users\info soft\Downloads\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR =  '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds';

		SET @start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE Bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
		PRINT '>> INSERTING DATA INTO : Bronze.erp_px_cat_g1v2';
		BULK INSERT Bronze.erp_px_cat_g1v2
		FROM 'C:\Users\info soft\Downloads\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR =  '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration : ' +CAST (DATEDIFF( SECOND , @start_time , @end_time) AS NVARCHAR ) + ' seconds';

		SET @batch_end_time = GETDATE();
		PRINT  '===================================================='
		PRINT 'Loading Bronze Layer is Completed';
		PRINT ' -Total load Duration: ' + CAST (DATEDIFF( SECOND , @batch_start_time , @batch_end_time) AS NVARCHAR ) + ' seconds';
		PRINT '===================================================='

	END TRY
	BEGIN CATCH
	PRINT '====================================================='
	PRINT 'ERROR OCCUR DURING LOADING BRONZE LAYER'
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Message' + CAST ( ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error Message' + CAST ( ERROR_STATE() AS NVARCHAR);
	PRINT '====================================================='
	END CATCH	
END
GO  -- end of procedure creation

-- Now execute it in a new batch
EXEC Bronze.load_bronze;
