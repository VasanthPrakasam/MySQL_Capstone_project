Create database PetRegistry;
use PetRegistry;
Create Table pets (PetId Int Primary Key, Name Varchar(50), Species Varchar(50), Age int, Owner Varchar(50) );

INSERT INTO pets (PetId, Name, Species, Age, Owner) VALUES
(1, 'Fluffy', 'Cat', 4, 'Alice'),
(2, 'Buddy', 'Dog', 5, 'Bob'),
(3, 'Charlie', 'Parrot', 2, 'David'),
(4, 'Daisy', 'Rabbit', 3, 'Eve'),
(5, 'Max', 'Dog', 7, 'Frank');

-- Query 1
/*
The council wants to know how many pets are currently registered. Can you help them get this information ?
*/
select count(*) as total_pets from pets;

-- Query 2
/*
Alice is worried she might have given the wrong age for her cat,Fluffy. 
Can you help her check Fluffy's current age in the registry?
*/
SELECT age FROM pets WHERE name = 'Fluffy' AND owner = 'Alice'; -- 4

-- Query 3
/*
Bob realizes he made a mistake. His dog Buddy is actually 6 years old, not 5. 
Can you help update this information in the registry and then display Buddy's information?
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE pets 
SET age = 6 -- 5
WHERE PetId = 2;
SELECT * FROM pets WHERE PetId = 2;
SET SQL_SAFE_UPDATES = 1;

-- Query 4
/*
Eve's friend Grace just moved to the neighborhood with her turtle, Shelly. 
Can you help add Shelly to the registry? Shelly is 10 years old, and should have the ID 6. 
After adding Shelly, please display all the information of pets owned by Grace.
*/
Insert into pets (PetId, Name, Species, Age, Owner) Values (6,'Shelly','Turtle',10, 'Grace');
select * from pets where Owner = 'Grace';
select Count(*) from pets where Owner = 'Grace';

-- Query 5: Find all dogs in the registry:
SELECT * FROM pets WHERE Species = 'Dog';

-- Query 6; List all pets owned by a specific owner (e.g., Bob):
SELECT * FROM pets WHERE Owner = 'Bob';

-- Query 7; List all pets owned by a specific owner (e.g., Bob):
SELECT AVG(Age) AS average_pet_age FROM pets;

-- Query 8; Find the average age of all pets:
SELECT AVG(Age) AS average_pet_age FROM pets;

-- Query 9;Count the number of pets for each species:
SELECT Species, COUNT(*) AS number_of_pets FROM pets GROUP BY Species;

--Query 10; List pets older than a certain age (e.g., 5 years):
SELECT * FROM pets WHERE Age > 5;
