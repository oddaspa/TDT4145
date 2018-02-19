CREATE TABLE Skuespiller(
				SkuespillerID INTEGER NOT NULL PRIMARY KEY,
                Navn VARCHAR(20),
                Fodselsaar INTEGER);

CREATE TABLE Sjanger (
				SjangerID INTEGER NOT NULL PRIMARY KEY,
                Navn VARCHAR(20),
                Beskrivelse VARCHAR(255));

CREATE TABLE Regissor(
				RegissorID INTEGER NOT NULL PRIMARY KEY,
                Navn VARCHAR(20));


CREATE TABLE Movie ( 
				MovieID INTEGER NOT NULL PRIMARY KEY,
                Title VARCHAR(20),
                Produksjonsaar INTEGER,
                RegissorID INTEGER NOT NULL,
				CONSTRAINT Movie_FK 	FOREIGN KEY (RegissorID) 
										REFERENCES Regissor(RegissorID)
										ON UPDATE CASCADE
                                        ON DELETE SET NULL);

CREATE TABLE SjangerForFilm (
				FilmID INTEGER NOT NULL,
                SjangerID INTEGER NOT NULL,
                CONSTRAINT PRIMARY KEY (FilmID, SjangerID),
				CONSTRAINT SjangerForFilm_FK 	FOREIGN KEY (FilmID)
												REFERENCES Movie(MovieID)
												ON UPDATE CASCADE
												ON DELETE CASCADE,
				CONSTRAINT SjangerForFilm_FK2 	FOREIGN KEY (SjangerID)
												REFERENCES Sjanger(SjangerID)
												ON UPDATE CASCADE
												ON DELETE CASCADE );

CREATE TABLE SkuespillerIFilm(
				FilmID INTEGER NOT NULL,
                SkuespillerID INTEGER NOT NULL,
                Rolle VARCHAR(20),
                CONSTRAINT PRIMARY KEY (FilmID, SkuespillerID), 
                CONSTRAINT SkuespillerIFilm_FK 	FOREIGN KEY (FilmID) 
												REFERENCES Movie(MovieID)
												ON UPDATE CASCADE
												ON DELETE CASCADE,
				CONSTRAINT SkuespillerIFilm_FK2 FOREIGN KEY (SkuespillerID)
												REFERENCES Skuespiller(SkuespillerID)
                                                ON UPDATE CASCADE
                                                ON DELETE CASCADE);