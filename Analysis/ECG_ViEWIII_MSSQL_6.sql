----- person table birth shifting

SELECT A.[person_id]
      ,[gender_concept_id]
      ,[year_of_birth]
      ,[month_of_birth]
      ,[day_of_birth]
      ,DATEADD(DD, Shifting_date, birth_datetime) AS birth_datetime
      ,[race_concept_id]
      ,[ethnicity_concept_id]
      ,[location_id]
      ,[provider_id]https://github.com/ABMI/ECGViEW_and_CDM/blob/master/Analysis/ECG_ViEWIII_MSSQL_7.sql
      ,[care_site_id]
      ,[person_source_value]
      ,[gender_source_value]
      ,[gender_source_concept_id]
      ,[race_source_value]
      ,[race_source_concept_id]
      ,[ethnicity_source_value]
      ,[ethnicity_source_concept_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Person]
FROM [Hwang_ECDM].[dbo].[ETL_Person] AS A
JOIN [Hwang_ECDM].[dbo].[A_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [person_id]
      ,[gender_concept_id]
      ,DATEPART(YYYY, birth_datetime) AS year_of_birth
      ,DATEPART(MM, birth_datetime) AS month_of_birth
      ,DATEPART(DD, birth_datetime) AS day_of_birth
      ,[birth_datetime]
      ,[race_concept_id]
      ,[ethnicity_concept_id]
      ,[location_id]
      ,[provider_id]
      ,[care_site_id]
      ,[person_source_value]
      ,[gender_source_value]
      ,[gender_source_concept_id]
      ,[race_source_value]
      ,[race_source_concept_id]
      ,[ethnicity_source_value]
      ,[ethnicity_source_concept_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Person_1]
FROM [Hwang_ECDM].[dbo].[A_FINAL_Person] 
