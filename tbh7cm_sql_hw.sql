SELECT name from country WHERE continent = "South America";
SELECT population from country WHERE name = "Germany";
SELECT name from city WHERE countrycode = "JPN";
SELECT name, population from country WHERE continent = "Africa" ORDER BY population DESC LIMIT 3;
SELECT name, lifeExpectancy from country WHERE population >= 1 AND population <= 5000000;
SELECT country.name, countrylanguage.Language, countrylanguage.IsOfficial FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";
SELECT * FROM `Album` JOIN Artist ON Artist.ArtistId = Album.ArtistId WHERE Artist.Name = "AC/DC";
SELECT FirstName, LastName, Email FROM `Customer` WHERE Country = "Brazil";
SELECT * FROM `Playlist`;
SELECT COUNT(*) FROM `Track` JOIN Genre ON Genre.GenreId = Track.GenreId WHERE Genre.Name = "Rock";
SELECT * FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = "Nancy" AND LastName = "Edwards");
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) FROM `Customer` JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId GROUP BY Customer.CustomerId;

CREATE TABLE states(
    Name VARCHAR(20),
    Population INT,
    GDP INT,
    Governor VARCHAR(256),
    officialAnimal VARCHAR(100),
    electoralVotes INT,
    PRIMARY KEY (Name)
   );

CREATE TABLE governors( 
governorID INT, 
State VARCHAR(20) NOT NULL, 
Name VARCHAR(100) NOT NULL, 
Party VARCHAR(256), 
Elected DATE NOT NULL, 
leftOffice DATE, 
PRIMARY KEY (governorID),
FOREIGN KEY (State) REFERENCES states(Name) 
);

CREATE TABLE cities(
    cityID INT,
    Name VARCHAR(100),
    Population INT,
    Mayor VARCHAR(256),
    State VARCHAR(20),
    isCapital BIT,
    PRIMARY KEY (cityID),
    FOREIGN KEY (State) REFERENCES states(Name)
    );

INSERT INTO states (Name, Population, GDP, Governor, officialAnimal, electoralVotes) VALUES 
	('Virginia', '8684000', '728', 'Glenn Youngkin', 'Northern Cardinal', '13'), 
	('North Carolina', '10700000', '76', 'Roy Cooper', 'Gray Squirrel', '14'), 
	('South Carolina', '5283000', '292', 'Henry McMaster', 'White-tailed Deer', '8'), 
	('Florida', '22240000', '1279', 'Ron DeSantis', 'Florida Panther', '27'), 
	('Georgia', '10910000', '25', 'Brian Kemp', 'White-tailed Deer', '15');
    
INSERT INTO governors (governorID, State, Name, Party, Elected) VALUES 
	('1', 'Virginia', 'Glenn Youngkin', 'Republican', '2021-11-02'), 
	('2', 'North Carolina', 'Roy Cooper', 'Democrat', '2016-11-03'), 
	('3', 'South Carolina', 'Henry McMaster', 'Republican', '2021-11-05'), 
	('4', 'Florida', 'Ron DeSantis', 'Republican', '2018-11-06'), 
	('5', 'Georgia', 'Brian Kemp', 'Republican', '2019-11-04');

INSERT INTO cities (cityID, Name, Population, Mayor, State, isCapital) VALUES 
	('1', 'Richmond', '229395', 'Levar Stoney', 'Virginia', 1), 
	('2', 'Columbia', '21123', 'Daniel Rickenmann', 'South Carolina', 1), 
	('3', 'Raleigh', '312042', 'Mary-Ann Baldwin', 'North Carolina', 1), 
	('4', 'Jacksonville', '201495', 'Donna Deegan', 'Florida', 0), 
	('5', 'Macon', '12834', 'Lester Miller', 'Georgia', 0), 
	('6', 'Jacksonville', '148295', 'Sammy Phillips', 'North Carolina', 0), 
	('7', 'Charlottesville', '45373', 'Juandiego Wade', 'Virginia', 0);
    
SELECT cities.Name, Mayor, cities.Population FROM cities JOIN states ON states.Name = cities.State WHERE State = "Virginia";
SELECT * FROM cities WHERE cities.Name = "Jacksonville";
SELECT governors.Name, governors.State FROM governors WHERE governors.Party = "Republican" AND governors.Elected > "2018-01-01";