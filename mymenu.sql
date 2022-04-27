CREATE DATABASE MyMenu;
USE MyMenu;
CREATE TABLE resturants( rest_id CHAR(225) not null primary key, 
						 rest_name CHAR(225) not null);
                         
CREATE TABLE ingredients( ing_id CHAR(225) not null primary key, 
						  ing_name CHAR(225) not null);

CREATE TABLE allergies( allerg_id CHAR(225) not null primary key, 
						allerg_name CHAR(225) not null);

CREATE TABLE partOfAllergy( allergies CHAR(225) not null,
							ingredients CHAR(225) not null);
                            
CREATE TABLE recipe( reci_id CHAR(225) not null foreign key, 
					 reci_name CHAR(225) not null, 
					 reci_res CHAR(225));
                     
CREATE TABLE partOfRecipe( recipe CHAR(225) not null primary key, 
						   ingredient CHAR(225) not null);












SELECT * FROM resturants;
SELECT * FROM ingredients;
SELECT * FROM allergies;
SELECT * FROM partOfAllergy;
SELECT * FROM recipe;
SELECT * FROM partOfRecipe;

