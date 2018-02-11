CREATE TABLE Person (
	Pnr 	INTEGER NOT NULL,
	Navn 	VARCHAR(20),
	CONSTRAINT Person_PK PRIMARY KEY (Pnr));

CREATE TABLE Hund (
	Regnr		INTEGER NOT NULL, 
	Navn		VARCHAR(30),
	Faar		INTEGER,
	Rase		VARCHAR(30),
	EierPnr		INTEGER NOT NULL,
	CONSTRAINT Hund_PK PRIMARY KEY (Regnr),
	CONSTRAINT Hund_FK FOREIGN KEY (EierPnr) REFERENCES Person(Pnr)
											 ON UPDATE CASCADE
											 ON DELETE NO ACTION,
											 
	CONSTRAINT Alderssjekk CHECK (Faar > 1980));
    
CREATE TABLE BittAv (
	Pnr		INTEGER NOT NULL,
    Regnr 	INTEGER NOT NULL,
    Antall	INTEGER DEFAULT 0,
    CONSTRAINT BittAv_PK PRIMARY KEY (Pnr, Regnr),
    CONSTRAINT BittAv_FK FOREIGN KEY (Pnr) 	REFERENCES Person(Pnr)
											ON UPDATE CASCADE
											ON DELETE CASCADE,
	CONSTRAINT BittAv_FK2 FOREIGN KEY (Regnr) 	REFERENCES Hund(Regnr)
												ON UPDATE CASCADE
                                                ON DELETE CASCADE,
	CONSTRAINT AntallSjekk CHECK (Antall >= 0));
    