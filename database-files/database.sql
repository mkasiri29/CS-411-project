drop database if exists test1;
create database if not exists test1;
use test1;
SET GLOBAL local_infile=1;
DROP TABLE IF EXISTS resturant;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS allergy;
DROP TABLE IF EXISTS partOfAllergy;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS partOfRecipe;
USE test1;


CREATE TABLE ingredient( ing_id int not null primary key, 
                          ing_name varchar(225) not null);

CREATE TABLE allergy( allerg_id int not null primary key, 
                        allerg_name varchar(225) not null);

CREATE TABLE partOfAllergy( allergies int not null,
                            ingredients int not null,
                            primary key(allergies,ingredients),
                            FOREIGN KEY (allergies) REFERENCES allergy(allerg_id),
                            FOREIGN KEY (ingredients) REFERENCES ingredient(ing_id));
                            
CREATE TABLE resturant( rest_id int not null primary key, 
                         rest_name varchar(225) not null);
                         
CREATE TABLE recipe(reci_id int not null primary key, 
					reci_name varchar(225) not null, 
					rest int not null,
					FOREIGN KEY (rest) REFERENCES resturant(rest_id)
                    );

CREATE TABLE partOfRecipe(reci int not null, 
						ing int not null,
						primary key(reci,ing),
						FOREIGN KEY (reci) REFERENCES recipe(reci_id),
						FOREIGN KEY (ing) REFERENCES ingredient(ing_id));
				
	
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\allergy.csv' into table allergy fields terminated by ',';
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\ingredient.csv' into table ingredient fields terminated by ',';
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\partOfAllergy.csv' into table partOfAllergy fields terminated by ',';
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\resturant.csv' into table resturant fields terminated by ',';
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\recipe.csv' into table recipe fields terminated by ',';
load data local infile 'C:\\Users\\lamya\\Desktop\\testing\\partOfRecipe.csv' into table partOfRecipe fields terminated by ',';


SELECT * FROM allergy;
SELECT * FROM ingredient;
SELECT * FROM partOfAllergy;
SELECT * FROM resturant;
SELECT * FROM recipe;
SELECT * FROM partOfRecipe;