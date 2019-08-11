## SUBSTRING Query
SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     SUBSTRING(DIAGNOSIS, CHARINDEX('/',DIAGNOSIS)+1,LEN(DIAGNOSIS)) AS TEMP,
     SUBSTRING(DIAGNOSIS, 1, CHARINDEX('/',DIAGNOSIS)-1) as ECG_IMP_1
     INTO CDM_ECG_NEW4
   FROM [CDM_ECG_NEW2] 
   WHERE Diagnosis LIKE '%/%'

SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1,
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_2
   INTO CDM_ECG_NEW5
   FROM [CDM_ECG_NEW4] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'

SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_3
   INTO CDM_ECG_NEW6
   FROM [CDM_ECG_NEW5] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'
  
SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2, ECG_IMP_3
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_4
   INTO CDM_ECG_NEW7
   FROM [CDM_ECG_NEW6] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'

SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2, ECG_IMP_3, ECG_IMP_4
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_5
   INTO CDM_ECG_NEW8
   FROM [CDM_ECG_NEW7] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'

SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2, ECG_IMP_3, ECG_IMP_4, ECG_IMP_5
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_6
   INTO CDM_ECG_NEW9
   FROM [CDM_ECG_NEW8] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'

SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2, ECG_IMP_3, ECG_IMP_4, ECG_IMP_5, ECG_IMP_6
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_7
   INTO CDM_ECG_NEW10
   FROM [CDM_ECG_NEW9] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'
     
SELECT [person_id]      ,[ecgdate]      ,[Vent_rate]      ,[PR]      ,[QRS_duration]
      ,[RR]      ,[QT]      ,[QTc]      ,[P_axis]      ,[R_axis]      ,[T_axis]
      ,[Diagnosis]      ,[visit_occurrence_id], 
     ECG_IMP_1, ECG_IMP_2, ECG_IMP_3, ECG_IMP_4, ECG_IMP_5, ECG_IMP_6, ECG_IMP_7
   ,CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, CHARINDEX('/',TEMP)+1,LEN(TEMP)) 
      ELSE NULL
   END AS TEMP, 
   CASE 
      WHEN TEMP LIKE '%/%'
      THEN SUBSTRING(TEMP, 1, CHARINDEX('/',TEMP)-1) 
      ELSE TEMP
   END as ECG_IMP_8
   INTO CDM_ECG_NEW11
   FROM [CDM_ECG_NEW10] 
   WHERE Diagnosis LIKE '%/%'
   OR TEMP LIKE '%/%'

USE Hwang_EM
SELECT * 
INTO ECDM_Person 
FROM [Dolphin_CDM].[dbo].[person]
  
SELECT * 
INTO ECDM_Visit_occurrence 
FROM Dolphin_CDM.dbo.visit_occurrence
	
SELECT * 
INTO ECDM_Procedure_occurrence 
FROM Dolphin_CDM.dbo.PROCEDURE_OCCURRENCE
	
SELECT * 
INTO ECDM_Measurement 
FROM Dolphin_CDM.dbo.measurement
		 
SELECT * 
INTO ECDM_Condition_occurrence 
FROM Dolphin_CDM.dbo.condition_occurrence
	
SELECT * 
INTO ECDM_Device_exposure
FROM Dolphin_CDM.dbo.device_exposure
	
SELECT * 
INTO ECDM_Death
FROM Dolphin_CDM.dbo.death
	
SELECT * 
INTO ECDM_Observation
FROM Dolphin_CDM.dbo.observation

SELECT * 
INTO ECDM_Specimen 
FROM Dolphin_CDM.dbo.SPECIMEN
	
SELECT * 
INTO ECDM_Location 
FROM Dolphin_CDM.dbo.location

SELECT * 
INTO ECDM_CONDITION_ERA 
FROM [Dolphin_CDM].[dbo].[CONDITION_ERA]

SELECT * 
INTO ECDM_Dose_era	
FROM [Dolphin_CDM].[dbo].[dose_era]

SELECT * 
INTO ECDM_Drug_era
FROM [Dolphin_CDM].[dbo].[drug_era]

SELECT * 
INTO ECDM_Drug_exposure 
FROM [Dolphin_CDM].[dbo].[drug_exposure]

SELECT * 
INTO ECDM_Device_exposure
FROM [Dolphin_CDM].[dbo].[device_exposure]

SELECT * 
INTO ECDM_Note 
FROM [Dolphin_CDM].[dbo].[NOTE]

SELECT * 
INTO ECDM_Observation_period 
FROM [Dolphin_CDM].[dbo].[observation_period]

SELECT * 
INTO ECDM_Provider 
FROM [Dolphin_CDM].[dbo].[provider]

SELECT * 
INTO ECDM_Visit_detail 
FROM [Dolphin_CDM].[dbo].[visit_detail]

SELECT * 
INTO ECDM_Cost 
FROM [Dolphin_CDM].[dbo].[cost]

----JOIN OUTPUT 확인	
USE Hwang_EM
SELECT * 
INTO ECDM_Person_2 FROM ECDM_Person_1
SELECT m1.*,m2.* FROM ECDM_Person_1 AS m1 
LEFT JOIN (SELECT * FROM electrocardiogram) AS m2 
ON m1.person_id = m2.person_id
WHERE Diagnosis is not null
 
----JOIN OUTPUT TABLE 생성 
----(Person_1 : mata CDM / 2 : Join mata / 3 : ECG Table 삭제 (ECG 있는 CDM TABLE만 살림)/PERSON ID 중복 생성, 4: 3번 copy 5 : 중복 ID 삭제)
SELECT A.*,
      B.ecgdate,
      B.Vent_rate,
      B.PR,
      B.QRS_duration,
      B.RR,
      B.QT,
      B.QTc,
      B.P_axes,
      B.R_axes,
      B.T_axes,
      B.Diagnosis
INTO ECDM_Person_4 
FROM ECDM_Person_1 AS A
JOIN (SELECT * FROM electrocardiogram) AS B
ON A.person_id = B.person_id
WHERE Diagnosis is not null

----불필요한 컬럼 삭제 (Person_3)
ALTER TABLE ECDM_Person_3
DROP COLUMN ecgdate, Vent_rate, PR, QRS_duration, RR, QT, QTc, P_axes, R_axes, T_axes, Diagnosis

------##중복 ID 삭제 (Person_4)
--중복 카운트
SELECT Person_id, COUNT(*) 
FROM ECDM_Person_3
GROUP BY Person_id
HAVING COUNT(*) > 1;

--중복데이터 조회 
SELECT t.* FROM
( SELECT Person_id , dup_idx = ROW_NUMBER() 
OVER ( PARTITION BY Person_id ORDER BY Person_id ) 
FROM ECDM_Person_3 (NOLOCK) ) tb_dup 
INNER JOIN ECDM_Person_3 t (NOLOCK) 
ON t.Person_id = tb_dup.Person_id
WHERE tb_dup.dup_idx > 1; 

SELECT t.* FROM 
( SELECT Person_id , dup_idx = ROW_NUMBER() 
OVER ( PARTITION BY Person_id ORDER BY Person_id ) 
FROM [dbo].[electrocardiogram] (NOLOCK) ) tb_dup 
INNER JOIN [dbo].[electrocardiogram] t (NOLOCK) 
ON t.Person_id = tb_dup.Person_id
WHERE tb_dup.dup_idx > 1; 

--테이블 복사 / 원본 확보
SELECT * INTO ECDM_Person_4 from ECDM_Person_3
USE Hwang_EM
SELECT * INTO ECDM_Person_5 from ECDM_Person_4

--중복데이터 삭제 
DELETE tb_dup
FROM 
( 
SELECT Person_id
, dup_idx = ROW_NUMBER() OVER ( 
PARTITION BY Person_id ORDER BY Person_id ) 
FROM ECDM_Person_4 
) tb_dup 
WHERE tb_dup.dup_idx > 1;

--ECG META TABLE 비교 확인 작업
SELECT * INTO electrocardiogram_2 from [dbo].[electrocardiogram]

DELETE tb_dup
FROM ( 
SELECT Person_id
, dup_idx = ROW_NUMBER() OVER ( 
PARTITION BY Person_id ORDER BY Person_id ) 
FROM electrocardiogram_2
) tb_dup 
WHERE tb_dup.dup_idx > 1;

SELECT * FROM [Hwang_EM].[dbo].[electrocardiogram_2]
ORDER BY ecgdate DESC

SELECT * FROM [dbo].[ECDM_visit_occurrence]
ORDER BY [visit_start_date] DESC

-----ECDM_Person_5 기준 CDM Extraction
-----두 테이블에서 겹치는 Person_id, provider_id, care_site_id는 한 테이블에만 남기고 쿼리 작성 (중복 시 오류)
SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Visit_Occurrence_1
FROM ECDM_visit_occurrence AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Condition_era_1
FROM [dbo].[ECDM_CONDITION_ERA] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Condition_occurrence_1
FROM [dbo].[ECDM_Condition_occurrence] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Death_1
FROM [dbo].[ECDM_Death] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Device_exposure_1
FROM [dbo].[ECDM_Device_exposure] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id
	
SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Drug_era_1
FROM [dbo].[ECDM_Drug_era] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Drug_exposure_1
FROM [dbo].[ECDM_Drug_exposure] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Measurement_1
FROM [dbo].[ECDM_Measurement] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Note_1
FROM [dbo].[ECDM_Note] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Observation_1
FROM [dbo].[ECDM_Observation] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Procedure_occurrence_1
FROM [dbo].[ECDM_Procedure_occurrence] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id
	
SELECT A.*,
      B.gender_concept_id,
      B.year_of_birth,
      B.month_of_birth,
      B.day_of_birth,
      B.birth_datetime,
      B.race_concept_id,
      B.ethnicity_concept_id,
      B.location_id,
      B.Person_source_value,
      B.gender_source_value,
      B.gender_source_concept_id,
      B.race_source_value,
      B.race_source_concept_id,
      B.ethnicity_source_value,
      B.ethnicity_source_concept_id 
INTO ECDM_Specimen_1
FROM [dbo].[ECDM_Specimen] AS A
JOIN (SELECT * FROM ECDM_Person_5) AS B
ON A.PERSON_ID = B.person_id

-----table data 검증 예정

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

----## 고유 환자 수 COUNT / PERSON TABLE ROW수와 비교

SELECT Person_id, COUNT(*) 
	FROM ECDM_Condition_era_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;    -------- 236,986 rows /  

 SELECT Person_id, COUNT(*)     
	FROM ECDM_Visit_Occurrence_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;        -------- 310,885 rows /

SELECT Person_id, COUNT(*)     
	FROM ECDM_Procedure_occurrence_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;       -------- 237,544 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Measurement_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;        --------- 262,502 rows 

SELECT Person_id, COUNT(*)     
	FROM ECDM_Condition_occurrence_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1  OR COUNT(*) = 1;      -------- 245,658 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Device_exposure_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1  OR COUNT(*) = 1;      ---------  139,008 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Death_1
	GROUP BY Person_id   
	HAVING COUNT(*) = 1;       ---------    2,909 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Observation_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;  ---------    3,730 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Specimen_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1  OR COUNT(*) = 1; ---------   39,304 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Drug_era_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1  OR COUNT(*) = 1;  ---------   206,474 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Drug_exposure_1 
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1;  ---------  210,128 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Note_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1; ---------  49,954 rows

SELECT Person_id, COUNT(*)     
	FROM ECDM_Observation_period_1
	GROUP BY Person_id
	HAVING COUNT(*) > 1 OR COUNT(*) = 1; ---------   310,884 rows

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
      ,[provider_id]
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
FROM [Hwang_ECDM].[dbo].[C_FINAL_Measurement]) A      ------ 34,834,04
			 
----PLAN A (추가 필요)
----이상치값 -> 5~99.5%에 포함되는 값으로 치환
			
			
----PLAN B (이상치값 전체 삭제)		 
DELETE FROM  [Hwang_ECDM].[dbo].[C_FINAL_Measurement_1] 
WHERE per_rank <= 0.05 OR per_rank >= 0.95
© 2019 GitHub, Inc.
