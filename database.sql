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

CREATE TABLE resturant( rest_id varchar(225) not null primary key, 
                         rest_name varchar(225) not null);

CREATE TABLE ingredient( ing_id varchar(225) not null primary key, 
                          ing_name varchar(225) not null);

CREATE TABLE allergy( allerg_id varchar(225) not null primary key, 
                        allerg_name varchar(225) not null);

CREATE TABLE partOfAllergy( allergies varchar(225) not null,
                            ingredients varchar(225) not null,
                            primary key(allergies,ingredients),
                            FOREIGN KEY (allergies) REFERENCES allergy(allerg_id),
                            FOREIGN KEY (ingredients) REFERENCES ingredient(ing_id));

CREATE TABLE recipe( reci_id varchar(225) not null primary key, 
                     reci_name varchar(225) not null, 
                     rest_id varchar(225),
                     FOREIGN KEY (rest_id) REFERENCES resturant(rest_id));

CREATE TABLE partOfRecipe(     recipe varchar(225) not null, 
                            ingredient varchar(225) not null,
                            primary key(recipe,ingredient),
                            FOREIGN KEY (recipe) REFERENCES recipe(reci_id),
                            FOREIGN KEY (ingredient) REFERENCES ingredient(ing_id));

load data local infile 'C:\Users\lamya\Desktop\mymenu_data\data - restaurant.csv' into table resturant fields terminated by ',';
load data local infile 'file-path.csv' into table ingredient fields terminated by ',';
load data local infile 'C:\Users\lamya\Desktop\mymenu_data\data - Allergy.csv' into table allergy fields terminated by ',';
load data local infile 'file-path.csv' into table partOfAllergy fields terminated by ',';
load data local infile 'file-path.csv' into table recipe fields terminated by ',';
load data local infile 'file-path.csv' into table partOfRecipe fields terminated by ',';


