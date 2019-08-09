---source value 삭제 
---source_value 없는 테이블 : Condition_era, Drug_era, Observation_period

SELECT * 
INTO [Hwang_ECDM].[dbo].[C_FINAL_Condition_era]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Condition_era]

SELECT * 
INTO [Hwang_ECDM].[dbo].[C_FINAL_Drug_era]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Drug_era]

SELECT * 
INTO [Hwang_ECDM].[dbo].[C_FINAL_Observation_period]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Observation_period]

SELECT [person_id]
      ,[gender_concept_id]
      ,[year_of_birth]
      ,[month_of_birth]
      ,[day_of_birth]
      ,[birth_datetime]
      ,[race_concept_id]
      ,[ethnicity_concept_id]
      ,[location_id]
      ,[provider_id]
      ,[care_site_id]
      ,person_source_value = NULL, 
      gender_source_value = NULL, 
	  gender_source_concept_id = 0,
      race_source_value = NULL,
	  race_source_concept_id = 0,
      ethnicity_source_value = NULL,
	  ethnicity_source_concept_id = 0
INTO [Hwang_ECDM].[dbo].[C_FINAL_Person]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Person]

SELECT [condition_occurrence_id]
      ,[person_id]
      ,[condition_concept_id]
      ,[condition_start_date]
      ,[condition_start_datetime]
      ,[condition_end_date]
      ,[condition_end_datetime]
      ,[condition_type_concept_id]
      ,[stop_reason]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[condition_source_value]  = NULL
      ,[condition_source_concept_id] = 0
      ,[condition_status_source_value] = NULL
      ,[condition_status_concept_id] = 0
 INTO [Hwang_ECDM].[dbo].[C_FINAL_Condition_occurrence]
 FROM [Hwang_ECDM].[dbo].[B_FINAL_Condition_occurrence]

 SELECT [person_id]
      ,[death_date]
      ,[death_datetime]
      ,[death_type_concept_id]
      ,[cause_concept_id]
      ,[cause_source_value] = NULL
      ,[cause_source_concept_id] = 0
INTO [Hwang_ECDM].[dbo].[C_FINAL_Death]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Death]

SELECT TOP (1000) [device_exposure_id]
      ,[person_id]
      ,[device_concept_id]
      ,[device_exposure_start_date]
      ,[device_exposure_start_datetime]
      ,[device_exposure_end_date]
      ,[device_exposure_end_datetime]
      ,[device_type_concept_id]
      ,[unique_device_id]
      ,[quantity]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[device_source_value] = NULL
      ,[device_source_concept_id] = 0
INTO [Hwang_ECDM].[dbo].[C_FINAL_Device_exposure]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Device_exposure]

SELECT [DRUG_EXPOSURE_ID]
      ,[PERSON_ID]
      ,[DRUG_CONCEPT_ID]
      ,[DRUG_EXPOSURE_START_DATE]
      ,[DRUG_EXPOSURE_START_DATETIME]
      ,[DRUG_EXPOSURE_END_DATE]
      ,[DRUG_EXPOSURE_END_DATETIME]
      ,[VERBATIM_END_DATE]
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
      ,[DRUG_SOURCE_VALUE] = NULL
      ,[DRUG_SOURCE_CONCEPT_ID] = 0
      ,[ROUTE_SOURCE_VALUE] = NULL
      ,[DOSE_UNIT_SOURCE_VALUE] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Drug_exposure]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Drug_exposure]

SELECT [measurement_id]
      ,[person_id]
      ,[measurement_concept_id]
      ,[measurement_date]
      ,[measurement_datetime]
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
      ,[measurement_source_value] = NULL
      ,[measurement_source_concept_id] = 0
      ,[unit_source_value] = NULL
      ,[value_source_value] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Measurement]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Measurement]

SELECT [NOTE_ID]
      ,[PERSON_ID]
      ,[NOTE_DATE]
      ,[NOTE_DATETIME]
      ,[NOTE_TYPE_CONCEPT_ID]
      ,[NOTE_CLASS_CONCEPT_ID]
      ,[NOTE_TITLE]
      ,[NOTE_TEXT]
      ,[ENDCODING_CONCEPT_ID]
      ,[LANGUAGE_CONCEPT_ID]
      ,[PROVIDER_ID]
      ,[VISIT_OCCURRENCE_ID]
      ,[VISIT_DETAIL_ID]
      ,[NOTE_SOURCE_VALUE] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Note]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Note]

SELECT [observation_id]
      ,[person_id]
      ,[observation_concept_id]
      ,[observation_date]
      ,[observation_datetime]
      ,[observation_type_concept_id]
      ,[value_as_number]
      ,[value_as_string]
      ,[value_as_concept_id]
      ,[qualifier_concept_id]
      ,[unit_concept_id]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[observation_source_value] = NULL
      ,[observation_source_concept_id] = 0
      ,[unit_source_value] = NULL
      ,[qualifier_source_value] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Observation]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Observation]

SELECT [procedure_occurrence_id]
      ,[person_id]
      ,[procedure_concept_id]
      ,[procedure_date]
      ,[procedure_datetime]
      ,[procedure_type_concept_id]
      ,[modifier_concept_id]
      ,[quantity]
      ,[provider_id]
      ,[visit_occurrence_id]
      ,[visit_detail_id]
      ,[procedure_source_value] = NULL
      ,[procedure_source_concept_id] = 0
      ,[modifier_source_value] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Procedure_occurrence]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Procedure_occurrence]

SELECT [SPECIMEN_ID]
      ,[PERSON_ID]
      ,[SEPECIMEN_CONCEPT_ID]
      ,[SPECIMEN_TYPE_CONCEPT_ID]
      ,[SPECIMEN_DATE]
      ,[SPECIMEN_TIME]
      ,[QUANTITY]
      ,[UNIT_CONCEPT_ID]
      ,[ANATOMIC_SITE_CONCEPT_ID]
      ,[DISEASE_STATUS_CONCEPT_ID]
      ,[SPECIMEN_SOURCE_ID] = 0
      ,[SPECIMEN_SOURCE_VALUE] = NULL
      ,[UNIT_SOURCE_VALUE] = NULL
      ,[ANATOMIC_SITE_SOURCE_VALUE] = NULL
      ,[DISEASE_STATUS_SOURCE_VALUE] = NULL
INTO [Hwang_ECDM].[dbo].[C_FINAL_Specimen]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Specimen]

SELECT [visit_occurrence_id]
      ,[PERSON_ID]
      ,[visit_concept_id]
      ,[visit_start_date]
      ,[visit_start_datetime]
      ,[visit_end_date]
      ,[visit_end_datetime]
      ,[visit_type_concept_id]
      ,[provider_id]
      ,[care_site_id]
      ,[visit_source_value] = NULL
      ,[visit_source_concept_id] = 0
      ,[admitting_source_concept_id] = 0
      ,[admitting_source_value] = NULL
      ,[discharge_to_concept_id] = 0
      ,[discharge_to_source_value] = NULL
      ,[preceding_visit_occurrence_id] = 0
INTO [Hwang_ECDM].[dbo].[C_FINAL_Visit_Occurrence]
FROM [Hwang_ECDM].[dbo].[B_FINAL_Visit_Occurrence]

----Measurement rare case 삭제 
----각 Measurement Concept 별 상위 95% 이상 값/ 하위 5% 이하 값 삭제

SELECT *  --------컨셉 그룹별 상위 퍼센트 불러오기
FROM (SELECT [value_as_number], [measurement_concept_id], 
		PERCENT_RANK() OVER (PARTITION BY [measurement_concept_id] ORDER BY [value_as_number] DESC) AS per_rank 
	FROM [Hwang_ECDM].[dbo].[C_FINAL_Measurement] WHERE [value_as_number] IS NOT NULL) A
WHERE A.per_rank <= 0.05;

SELECT *   ----- 전체 데이터 구간 계산해서 새 테이블 생성하기 
INTO [Hwang_ECDM].[dbo].[C_FINAL_Measurement_RANK] 
FROM (SELECT [measurement_id] ,[person_id] ,[measurement_concept_id]
      ,[measurement_date] ,[measurement_datetime] ,[measurement_type_concept_id]
      ,[operator_concept_id] ,[value_as_number] ,[value_as_concept_id]
      ,[unit_concept_id] ,[range_low] ,[range_high] ,[provider_id]
      ,[visit_occurrence_id] ,[visit_detail_id] ,[measurement_source_value]
      ,[measurement_source_concept_id] ,[unit_source_value] ,[value_source_value]
      ,PERCENT_RANK() OVER (PARTITION BY [measurement_concept_id] ORDER BY [value_as_number] DESC) AS per_rank 
FROM [Hwang_ECDM].[dbo].[C_FINAL_Measurement]) A      ------ 34,834,047
	   
DELETE FROM  [Hwang_ECDM].[dbo].[C_FINAL_Measurement_1] ---- 범위 지정 삭제 
WHERE per_rank <= 0.05 OR per_rank >= 0.95
