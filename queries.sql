/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM ANIMALS WHERE NAME LIKE '%mon';

SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-01';

SELECT NAME FROM ANIMALS WHERE NEUTERED = true and ESCAPE_ATTEMPTS < 3;

SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME IN ('Agumon','Pikachu');

SELECT NAME,ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;

SELECT * FROM ANIMALS WHERE NEUTERED = true

SELECT * FROM ANIMALS WHERE NAME <>  'Gabumon';

SELECT * FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;




-- Day 2
SELECT COUNT(NAME) AS NUMBER_OF_ANIMALS FROM ANIMALS
SELECT COUNT(NAME) AS NUMBER_OF_ANIMALS FROM ANIMALS WHERE ESCAPE_ATTEMPTS <=0;
SELECT AVG(WEIGHT_KG) AS AVERAGE_WEIGHT  FROM ANIMALS;
SELECT NEUTERED ,  MAX(ESCAPE_ATTEMPTS) AS  ESCAPES  FROM ANIMALS  GROUP BY NEUTERED;
SELECT SPECIES, MIN(WEIGHT_KG), MAX(WEIGHT_KG) FROM ANIMALS GROUP BY SPECIES;
SELECT SPECIES, AVG(ESCAPE_ATTEMPTS) FROM ANIMALS WHERE  DATE_OF_BIRTH >= '01-01-1990' AND  DATE_OF_BIRTH <= '31-12-2000'  GROUP BY SPECIES;


-- DAY 3
SELECT o.ID, o.FULL_NAME , a.NAME Animal_owned, a.OWNER_ID  
FROM OWNERS o JOIN ANIMALS a  ON o.ID = a.OWNER_ID WHERE o.FULL_NAME = 'Melody Pond';


SELECT NAME FROM ANIMALS 
WHERE SPECIES_ID = 1;

SELECT o.FULL_NAME, a.NAME ANIMAL_NAME  FROM OWNERS o
FULL JOIN ANIMALS a ON o.ID = a.OWNER_ID;

SELECT  s.NAME, COUNT(s.ID) FROM ANIMALS a JOIN SPECIES s ON a.SPECIES_ID = s.ID 
GROUP BY s.ID;

SELECT o.FULL_NAME, a.NAME FROM ANIMALS a JOIN OWNERS o ON a.OWNER_ID = o.ID 
WHERE a.OWNER_ID = 2 AND a.SPECIES_ID = 2;

SELECT o.FULL_NAME, a.NAME FROM ANIMALS a JOIN OWNERS o ON a.OWNER_ID = o.ID  
WHERE o.FULL_NAME = 'Dean Winchester' AND a.ESCAPE_ATTEMPTS = 0;

SELECT o.FULL_NAME , COUNT(a.OWNER_ID) FROM ANIMALS a RIGHT JOIN OWNERS o  ON a.OWNER_ID = o.ID 
GROUP BY O.FULL_NAME ORDER BY COUNT(a.OWNER_ID) DESC;


-- Day 4
SELECT v.ANIMAL_ID, a.NAME, v.DATE_OF_VISIT FROM VISITS v JOIN ANIMALS a ON v.ANIMAL_ID = a.ID WHERE VET_ID = 1 ORDER BY DATE_OF_VISIT DESC FETCH FIRST 1 ROW ONLY;
SELECT COUNT(*) FROM VISITS WHERE VET_ID = 3 ;

SELECT v.id, v.name , s.name specialization FROM VETS v LEFT JOIN SPECIALIZATIONS sp ON v.ID = sp.VET_ID LEFT JOIN SPECIES s ON s.ID = sp.SPECIES_ID;

SELECT vt.NAME , a.NAME, vs.DATE_OF_VISIT  FROM VISITS vs JOIN ANIMALS a ON a.ID = vs.ANIMAL_ID JOIN VETS vt  ON vs.VET_ID = vt.ID  WHERE vs.VET_ID = 3 AND DATE_OF_VISIT >'04-01-2020' AND DATE_OF_VISIT < '08-30-2020';

SELECT  a.NAME,  COUNT(v.ANIMAL_ID) AS NUMBER_OF_VISITS FROM VISITS v JOIN ANIMALS a ON a.ID = v.ANIMAL_ID GROUP BY a.NAME ORDER BY NUMBER_OF_VISITS DESC FETCH FIRST 1 ROW ONLY;

SELECT vt.NAME VET_NAME,  a.NAME ANIMAL_NAME, vs.DATE_OF_VISIT FROM VISITS vs JOIN ANIMALS a ON vs.ANIMAL_ID = a.ID JOIN VETS vt ON vt.ID = vs.VET_ID  WHERE VET_ID = 2  ORDER BY DATE_OF_VISIT FETCH FIRST 1 ROW ONLY;

SELECT vt.*,  a.*, vs.DATE_OF_VISIT FROM VISITS vs JOIN ANIMALS a ON vs.ANIMAL_ID = a.ID JOIN VETS vt ON vt.ID = vs.VET_ID   ORDER BY DATE_OF_VISIT DESC FETCH FIRST 1 ROW ONLY;

SELECT COUNT(*) VISITS_COUNT_TO_NON_SPECIALIZED_VET FROM VISITS  LEFT JOIN SPECIALIZATIONS ON VISITS.VET_ID = SPECIALIZATIONS.VET_ID WHERE SPECIALIZATIONS.VET_ID IS NULL;

SELECT COUNT(v.ANIMAL_ID) NUMBER_OF_VISITS, a.NAME FROM VISITS v JOIN ANIMALS a ON a.ID = v.ANIMAL_ID   WHERE VET_ID = 2 GROUP BY a.NAME  ORDER BY NUMBER_OF_VISITS DESC FETCH FIRST 1 ROW ONLY;
