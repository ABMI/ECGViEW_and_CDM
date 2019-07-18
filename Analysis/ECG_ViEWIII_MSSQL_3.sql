--######################
-----각 테이블 별 환자 수 확인 
SELECT *
  FROM [Hwang_EM].[dbo].[ECDM_Condition_era_1]
  WHERE person_id 

SELECT Person_id, COUNT(*) 
	FROM ECDM_Condition_era_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;      -------- 159,532 rows /  

SELECT Person_id, COUNT(*)     
	FROM ECDM_Visit_Occurrence_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;        -------- 234,863 rows /

SELECT Person_id, COUNT(*)     
	FROM ECDM_Procedure_occurrence_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;      -------- 208,833 rows /  

SELECT Person_id, COUNT(*)     
	FROM ECDM_Measurement_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1;       --------- 254,573 rows 

SELECT Person_id, COUNT(*)     
	FROM ECDM_Condition_occurrence_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1;      -------- 196,091 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Device_exposure_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;      ---------  120,630 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Death_1
	GROUP BY Person_id      ---------    2,909 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Observation_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------    3,730 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Specimen_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------   17,246 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Drug_era_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------   189,563 rows

USE Hwang_EM
SELECT Person_id, COUNT(*)     
	FROM ECDM_Drug_exposure_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------  196,978 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Device_exposure
	GROUP BY Person_id
	HAVING COUNT(*) > 1; ---------  912,423 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Note 
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------  174,024 rows

USE Hwang_EM
SELECT Person_id, COUNT(*)     
	FROM ECDM_Observation_period_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1;  ---------   172,295 rows

--######################
----원본 테이블 백업, 작업용 복사하기

SELECT * INTO ECDM_Condition_era_2 from ECDM_Condition_era_1
SELECT * INTO ECDM_Condition_occurrence_2 from ECDM_Condition_occurrence_1
SELECT * INTO ECDM_Death_2 from ECDM_Death_1
SELECT * INTO ECDM_Device_exposure_2 from ECDM_Device_exposure_1
SELECT * INTO ECDM_Drug_era_2 from ECDM_Drug_era_1
SELECT * INTO ECDM_Drug_exposure_2 from ECDM_Drug_exposure_1  
SELECT * INTO ECDM_Measurement_2 from ECDM_Measurement_1 
SELECT * INTO ECDM_Note_2 from ECDM_Note_1
SELECT * INTO ECDM_Observation_2 from ECDM_Observation_1
SELECT * INTO ECDM_Observation_period_2 from ECDM_Observation_period_1
SELECT * INTO ECDM_Procedure_occurrence_2 from ECDM_Procedure_occurrence_1
SELECT * INTO ECDM_Specimen_2 from ECDM_Specimen_1 
SELECT * INTO ECDM_Visit_Occurrence_2 from ECDM_Visit_Occurrence_1

--######################
----##불필요한 컬럼 삭제
------- *** 1 : meta table, 2 : 최종버전 

ALTER TABLE ECDM_Condition_era_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Condition_occurrence_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Death_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Device_exposure_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Drug_era_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Drug_exposure_2    
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Measurement_2 
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Note_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Observation_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Observation_period_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Procedure_occurrence_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Specimen_2 
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 

ALTER TABLE ECDM_Visit_Occurrence_2
	DROP COLUMN gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, 
	race_concept_id, ethnicity_concept_id, location_id, Person_source_value, gender_source_value,
	gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value,
	ethnicity_source_concept_id 
