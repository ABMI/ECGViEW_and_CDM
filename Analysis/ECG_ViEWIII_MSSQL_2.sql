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
