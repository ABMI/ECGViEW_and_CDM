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
