---################################################################################################################
---ECG VIEW DATATHON SAMPLE DATA Extration 추가 작업
---1) 민감 질병에 해당되는 환자군 삭제 -> 모든 테이블 적용 (완료) B_FINAL TABLE 해당 / A_FINAL은 민감 질병군 포함
---2) Person ID 구분 못하게 변환 -> 모든 테이블 적용
---3) 각 테이블 Source value 삭제 -> 삭제 전 매핑 테이블 생성 (완료)
---4) Measurement rare value, 민감 질병 유추 가능 value 삭제 및 변환(범위 지정 필요)
---################################################################################################################

---특정 진단명 삭제 (rare IMP / 개인정보유출 유려 IMP 포함)
SELECT * 
INTO [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1] 
FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]  ---원본 확보 (원본은 _1임)

SELECT *
FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
LIKE 'A5%'   ---1,833 삭제해야 함

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
LIKE 'A5%'   ----SELECT 확인 후 삭제 완료

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN 'F10' AND 'F19'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN 'F70' AND 'F79'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'O00' AND 'O08'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'O30' AND 'O48'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q00' AND 'Q07'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q10' AND 'Q18'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q20' AND 'Q28'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q30' AND 'Q34'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q35' AND 'Q37'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q38' AND 'Q45'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q50' AND 'Q56'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q60' AND 'Q64'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q65' AND 'Q79'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q80' AND 'Q89'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Q90' AND 'Q99'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'X60' AND 'X84'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'X85' AND 'X99'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Y00' AND 'Y09'

DELETE [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]
WHERE [condition_source_value]
BETWEEN
'Z80' AND 'Z99'

--삭제 확인 및 실제 케이스 Fq 확인 

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN 'F10' AND 'F19'  ---4,427

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN 'F70' AND 'F79' ---2,051

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'O00' AND 'O08' ---5,294

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'O30' AND 'O48' ---17,259

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q00' AND 'Q07' ---2,111

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q10' AND 'Q18'  ---1,970

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q20' AND 'Q28' ---9,708

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q30' AND 'Q34'  ---170

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q35' AND 'Q37'  ---1,274

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q38' AND 'Q45' ---3,983

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q50' AND 'Q56'  ---2,643

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q60' AND 'Q64'   ---2,981

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q65' AND 'Q79'  ---10,549

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q80' AND 'Q89'   ---4,024

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Q90' AND 'Q99'  ---2,244

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'X60' AND 'X84'  ---567

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'X85' AND 'X99'  ---31

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Y00' AND 'Y09'  ---428

SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence_1]
WHERE [condition_source_value]
BETWEEN
'Z80' AND 'Z99' ---30,262

----Condition 수정 table에 해당하는 환자와 Mapping
----모든 테이블 적용----

SELECT A.* 
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Person]    ----243,501
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_1] AS A    ----388,131
	JOIN (SELECT DISTINCT person_id FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Condition_era]  ----2,192,741
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_era] AS A   
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Condition_occurrence] ---4,221,935
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Condition_occurrence] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Death] ----2,862
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Death] AS A 
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Device_exposure] ---2,832,351
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Device_exposure] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Drug_era] ----3,820,883
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Drug_era] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Drug_exposure] ----17,584,064
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Drug_exposure] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Measurement]   ----- 34,834,047
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Measurement] AS A  ---- 36,575,210
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.PERSON_ID = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Note] ---101,849
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Note] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Observation] ----71,010
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Observation] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Observation_period] ----1,232,250
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Observation_period] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Procedure_occurrence] ---11,124,824
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Procedure_occurrence] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.*
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Specimen] ---74,270
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Specimen] AS A
	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

SELECT A.* 
	INTO [Hwang_ECDM].[dbo].[B_FINAL_Visit_Occurrence] -----3,226,206
	FROM [Hwang_ECDM].[dbo].[A_FINAL_Visit_Occurrence] AS A
 	JOIN (SELECT * FROM [Hwang_ECDM].[dbo].[A_FINAL_Person_3]) AS B
	ON A.person_id = B.person_id

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
