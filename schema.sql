/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

-- To connect to the database created 
\c vet_clinic 



CREATE TABLE animals(
ID INT GENERATED ALWAYS AS IDENTITY,
NAME TEXT,
DATE_OF_BIRTH DATE,
ESCAPE_ATTEMPTS INT,
NEUTERED BOOLEAN,
WEIGHT_KG FLOAT
);


-- DAY 2
ALTER TABLE ANIMALS ADD SPECIES TEXT;

-- Day 3
CREATE TABLE OWNERS (ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, FULL_NAME TEXT , AGE INT );
CREATE TABLE SPECIES (ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,NAME TEXT);

ALTER TABLE ANIMALS ADD PRIMARY KEY (ID);
\d animals

ALTER TABLE ANIMALS DROP COLUMN SPECIES;

ALTER TABLE ANIMALS ADD SPECIES_ID INT;
ALTER TABLE ANIMALS ADD FOREIGN KEY (SPECIES_ID) REFERENCES SPECIES (ID);

ALTER TABLE ANIMALS ADD OWNER_ID INT;
ALTER TABLE ANIMALS ADD FOREIGN KEY (OWNER_ID) REFERENCES OWNERS (ID);
