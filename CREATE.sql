CREATE TABLE sezony
( 
	sezonID INT NOT NULL PRIMARY KEY,
	klubID INT NOT NULL FOREIGN KEY REFERENCES kluby(klubID)
)

CREATE TABLE zawodnicy
(
	zawodnikID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sezonID INT NOT NULL FOREIGN KEY REFERENCES sezony(sezonID),
	klubID INT NOT NULL FOREIGN KEY REFERENCES kluby(klubID),
	imie varchar(30) NOT NULL,
	nazwisko varchar(30) NOT NULL
)

CREATE TABLE kluby
(
	klubID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	stadionID INT NOT NULL FOREIGN KEY REFERENCES stadiony(stadionID),
	adresID  INT NOT NULL FOREIGN KEY REFERENCES adresy(adresID),
	nazwa_klubu varchar(50) NOT NULL
)
CREATE TABLE adresy
(
	adresID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	miasto varchar(30) NOT NULL,
	ulica varchar(30) NOT NULL,
	numer_bud INT NOT NULL
)

CREATE TABLE stadiony
(
	stadionID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	adresID INT NOT NULL FOREIGN KEY REFERENCES adresy(adresID),
	pojemnosc INT NOT NULL,
	nazwa varchar(50) NOT NULL
)

CREATE TABLE sedziowie
(
	sedziaID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	imie varchar(30) NOT NULL,
	nazwisko varchar(30) NOT NULL,
	miasto varchar(30) NOT NULL,
	nr_licencji INT NOT NULL
)

CREATE TABLE mecze
(
	meczID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	stadionID INT NOT NULL FOREIGN KEY REFERENCES stadiony(stadionID),
	sedziaID INT NOT NULL FOREIGN KEY REFERENCES sedziowie(sedziaID),
	data DATE NOT NULL,
	godzina TIME NOT NULL,
	gospodarze INT NOT NULL FOREIGN KEY REFERENCES kluby(klubID),
	gosp_pkt INT DEFAULT 0,
	goscie INT NOT NULL FOREIGN KEY REFERENCES kluby(klubID),
	goscie_pkt INT DEFAULT 0
)

CREATE TABLE bramka
(
	bramkaID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	meczID INT NOT NULL FOREIGN KEY REFERENCES mecze(meczID),
	zawodnikID INT NOT NULL FOREIGN KEY REFERENCES zawodnicy(zawodnikID),
	minuta_meczu TIME NOT NULL
)

CREATE TABLE rzut_wolny
(
	wolnyID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	meczID INT NOT NULL FOREIGN KEY REFERENCES mecze(meczID),
	zawodnikID INT NOT NULL FOREIGN KEY REFERENCES zawodnicy(zawodnikID),
	minuta_meczu TIME NOT NULL
)

CREATE TABLE kartka
(
	kartkaID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	meczID INT NOT NULL FOREIGN KEY REFERENCES mecze(meczID),
	zawodnikID INT NOT NULL FOREIGN KEY REFERENCES zawodnicy(zawodnikID),
	minuta_meczu TIME NOT NULL,
	kolor varchar(10) NOT NULL
)


--DROP TABLE sezony

ALTER TABLE bramka ALTER COLUMN minuta_meczu INT 
ALTER TABLE sklady ADD CONSTRAINT sklady_PK PRIMARY KEY(skladID)
ALTER TABLE sklady DROP COLUMN klubID
ALTER TABLE mecze ADD CONSTRAINT sedziowie_miasta CHECK  (mecze.goscie=kluby.klubID and kluby.adresID=adresy.adresID and sedziowie.miasto!=adresy.miasto)