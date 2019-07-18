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
