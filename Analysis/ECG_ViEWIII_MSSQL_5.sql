-------날짜 RANDOM SHIFTING Query------

----SHIFTING RANDOM 값 포함된 TABLE 생성하기 / PERSON ID 기준
USE Hwang_ECDM
SELECT Person_id, ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%15 AS Shifting_date
INTO ETL_Person_MAPPING 
FROM ETL_Person_1

----SHIFTING TABLE를 이용해서 날짜 변환하기
SELECT [visit_occurrence_id]
      ,A.[PERSON_ID]
      ,[visit_concept_id]
      ,DATEADD(DD, Shifting_date, visit_start_date) AS visit_start_date
      ,DATEADD(DD, Shifting_date, visit_start_datetime) AS visit_start_datetime
      ,DATEADD(DD, Shifting_date, visit_end_date) AS visit_end_date
      ,DATEADD(DD, Shifting_date, visit_end_datetime) AS visit_end_datetime
      ,[visit_type_concept_id]
      ,[provider_id]
      ,[care_site_id]
      ,[visit_source_value]
      ,[visit_source_concept_id]
      ,[admitting_source_concept_id]
      ,[admitting_source_value]
      ,[discharge_to_concept_id]
      ,[discharge_to_source_value]
      ,[preceding_visit_occurrence_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Visit_Occurrence]
FROM [Hwang_ECDM].[dbo].[ETL_Visit_Occurrence] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [condition_era_id]
      ,A.[person_id]
      ,[condition_concept_id]
      ,DATEADD(DD, Shifting_date, condition_era_start_date) AS vcondition_era_start_date
      ,DATEADD(DD, Shifting_date, condition_era_end_date) AS condition_era_end_date
      ,[condition_occurrence_count]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Condition_era]
FROM [Hwang_ECDM].[dbo].[ETL_Condition_era] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [condition_occurrence_id]
      ,A.[person_id]
      ,[condition_concept_id]
      ,DATEADD(DD, Shifting_date, condition_start_date) AS condition_start_date
      ,DATEADD(DD, Shifting_date, condition_start_datetime) AS condition_start_datetime
      ,DATEADD(DD, Shifting_date, condition_end_date) AS condition_end_date
      ,DATEADD(DD, Shifting_date, condition_end_datetime) AS condition_end_datetime
      ,[condition_type_concept_id]
      ,[stop_reason]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[condition_source_value]
      ,[condition_source_concept_id]
      ,[condition_status_source_value]
      ,[condition_status_concept_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
FROM [Hwang_ECDM].[dbo].[ETL_Condition_occurrence] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT A.[person_id]
      ,DATEADD(DD, Shifting_date, death_date) AS death_date
      ,DATEADD(DD, Shifting_date, death_datetime) AS death_datetime
      ,[death_type_concept_id]
      ,[cause_concept_id]
      ,[cause_source_value]
      ,[cause_source_concept_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Death]
FROM [Hwang_ECDM].[dbo].[ETL_Death] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [device_exposure_id]
      ,A.[person_id]
      ,[device_concept_id]
      ,DATEADD(DD, Shifting_date, device_exposure_start_date) AS device_exposure_start_date
      ,DATEADD(DD, Shifting_date, device_exposure_start_datetime) AS device_exposure_start_datetime
      ,DATEADD(DD, Shifting_date, device_exposure_end_date) AS device_exposure_end_date
      ,DATEADD(DD, Shifting_date, device_exposure_end_datetime) AS device_exposure_end_datetime
      ,[device_type_concept_id]
      ,[unique_device_id]
      ,[quantity]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[device_source_value]
      ,[device_source_concept_id]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Device_exposure]
FROM [Hwang_ECDM].[dbo].[ETL_Device_exposure] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [drug_era_id]
      ,A.[person_id]
      ,[drug_concept_id]
      ,DATEADD(DD, Shifting_date, drug_era_start_date) AS drug_era_start_date
      ,DATEADD(DD, Shifting_date, drug_era_end_date) AS drug_era_end_date
      ,[drug_exposure_count]
      ,[gap_days]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Drug_era]
FROM [Hwang_ECDM].[dbo].[ETL_Drug_era] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [DRUG_EXPOSURE_ID]
      ,A.[PERSON_ID]
      ,[DRUG_CONCEPT_ID]
      ,DATEADD(DD, Shifting_date, DRUG_EXPOSURE_START_DATE) AS DRUG_EXPOSURE_START_DATE
      ,DATEADD(DD, Shifting_date, DRUG_EXPOSURE_START_DATETIME) AS DRUG_EXPOSURE_START_DATETIME
      ,DATEADD(DD, Shifting_date, DRUG_EXPOSURE_END_DATE) AS DRUG_EXPOSURE_END_DATE
      ,DATEADD(DD, Shifting_date, DRUG_EXPOSURE_END_DATETIME) AS DRUG_EXPOSURE_END_DATETIME
      ,DATEADD(DD, Shifting_date, VERBATIM_END_DATE) AS VERBATIM_END_DATE
      ,[DRUG_TYPE_CONCEPT_ID]
      ,[STOP_REASON]
      ,[REFILLS]
      ,[QUANTITY]
      ,[DAYS_SUPPLY]
      ,[SIG]
      ,[ROUTE_CONCEPT_ID]
      ,[LOT_NUMBER]
      ,[PROVIDER_ID]
      ,[VISIT_OCCURRENCE_ID]
      ,[DRUG_SOURCE_VALUE]
      ,[DRUG_SOURCE_CONCEPT_ID]
      ,[ROUTE_SOURCE_VALUE]
      ,[DOSE_UNIT_SOURCE_VALUE]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Drug_exposure]
FROM [Hwang_ECDM].[dbo].[ETL_Drug_exposure] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [measurement_id]
      ,A.[person_id]
      ,[measurement_concept_id]
      ,DATEADD(DD, Shifting_date, measurement_date) AS measurement_date
      ,DATEADD(DD, Shifting_date, measurement_datetime) AS measurement_datetime
      ,[measurement_type_concept_id]
      ,[operator_concept_id]
      ,[value_as_number]
      ,[value_as_concept_id]
      ,[unit_concept_id]
      ,[range_low]
      ,[range_high]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[measurement_source_value]
      ,[measurement_source_concept_id]
      ,[unit_source_value]
      ,[value_source_value]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Measurement]
FROM [Hwang_ECDM].[dbo].[ETL_Measurement] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [NOTE_ID]
      ,A.[PERSON_ID]
      ,DATEADD(DD, Shifting_date, NOTE_DATE) AS NOTE_DATE
      ,DATEADD(DD, Shifting_date, NOTE_DATETIME) AS NOTE_DATETIME
      ,[NOTE_TYPE_CONCEPT_ID]
      ,[NOTE_CLASS_CONCEPT_ID]
      ,[NOTE_TITLE]
      ,[NOTE_TEXT]
      ,[ENDCODING_CONCEPT_ID]
      ,[LANGUAGE_CONCEPT_ID]
      ,[PROVIDER_ID]
      ,[VISIT_OCCURRENCE_ID]
      ,[VISIT_DETAIL_ID]
      ,[NOTE_SOURCE_VALUE]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Note]
FROM [Hwang_ECDM].[dbo].[ETL_Note] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [observation_id]
      ,A.[person_id]
      ,[observation_concept_id]
      ,DATEADD(DD, Shifting_date, observation_date) AS observation_date
      ,DATEADD(DD, Shifting_date, observation_datetime) AS observation_datetime
      ,[observation_type_concept_id]
      ,[value_as_number]
      ,[value_as_string]
      ,[value_as_concept_id]
      ,[qualifier_concept_id]
      ,[unit_concept_id]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[observation_source_value]
      ,[observation_source_concept_id]
      ,[unit_source_value]
      ,[qualifier_source_value]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Observation]
FROM [Hwang_ECDM].[dbo].[ETL_Observation] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [OBSERVATION_PERIOD_ID]
      ,A.[PERSON_ID]
      ,DATEADD(DD, Shifting_date, OBSERVATION_PERIOD_START_DATE) AS OBSERVATION_PERIOD_START_DATE
      ,DATEADD(DD, Shifting_date, OBSERVATION_PERIOD_END_DATE) AS OBSERVATION_PERIOD_END_DATE
      ,[PERIOD_TYPE_CONCEPT_ID]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Observation_period]  
FROM [Hwang_ECDM].[dbo].[ETL_Observation_period] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [procedure_occurrence_id]
      ,A.[person_id]
      ,[procedure_concept_id]
      ,DATEADD(DD, Shifting_date, procedure_date) AS procedure_date
      ,DATEADD(DD, Shifting_date, procedure_datetime) AS procedure_datetime
      ,[procedure_type_concept_id]
      ,[modifier_concept_id]
      ,[quantity]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[procedure_source_value]
      ,[procedure_source_concept_id]
      ,[modifier_source_value]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Procedure_occurrence]
FROM [Hwang_ECDM].[dbo].[ETL_Procedure_occurrence] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id

SELECT [SPECIMEN_ID]
      ,A.[PERSON_ID]
      ,[SEPECIMEN_CONCEPT_ID]
      ,[SPECIMEN_TYPE_CONCEPT_ID]
      ,DATEADD(DD, Shifting_date, SPECIMEN_DATE) AS SPECIMEN_DATE
      ,DATEADD(DD, Shifting_date, SPECIMEN_TIME) AS SPECIMEN_TIME
      ,[QUANTITY]
      ,[UNIT_CONCEPT_ID]
      ,[ANATOMIC_SITE_CONCEPT_ID]
      ,[DISEASE_STATUS_CONCEPT_ID]
      ,[SPECIMEN_SOURCE_ID]
      ,[SPECIMEN_SOURCE_VALUE]
      ,[UNIT_SOURCE_VALUE]
      ,[ANATOMIC_SITE_SOURCE_VALUE]
      ,[DISEASE_STATUS_SOURCE_VALUE]
INTO [Hwang_ECDM].[dbo].[A_FINAL_Specimen]
FROM [Hwang_ECDM].[dbo].[ETL_Specimen] AS A
JOIN [Hwang_ECDM].[dbo].[ETL_Person_MAPPING] AS B
ON A.person_id = B.person_id
