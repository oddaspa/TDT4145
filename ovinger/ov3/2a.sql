# 2, a)
SELECT * FROM movie;

# 2, b)
SELECT Navn FROM skuespiller AS SP WHERE SP.Fodselsaar < 1960;

# 2, c)
SELECT Navn FROM skuespiller AS SP WHERE SP.Fodselsaar <1990 AND SP.Fodselsaar >1979 ORDER BY Navn;

# 2, d) Finn Morgan freeman skuespiller ID Join Skuespillerifilm og film Select morgans ID?

SELECT title FROM skuespillerifilm AS SPIF 
		 JOIN movie AS M ON SPIF.FilmID = M.MovieID 
         JOIN skuespiller AS SP ON SP.SkuespillerID = SPIF.SkuespillerID 
         WHERE SP.Navn = "Morgan Freeman";

# 2, e)

SELECT DISTINCT title FROM movie AS M JOIN regissor AS R ON M.RegissorID = R.RegissorID 
							 JOIN (
                             skuespillerifilm AS SPIF JOIN skuespiller AS S ON SPIF.SkuespillerID = S.SkuespillerID
                             ) ON M.MovieID = SPIF.FilmID WHERE R.Navn = S.Navn;

# 2, f)

SELECT count(*) AS names_starting_with_C FROM skuespiller AS S WHERE S.Navn LIKE "C%";

# 2, g)
SELECT COUNT(*) AS Antall, S.Navn FROM sjanger AS S JOIN sjangerforfilm AS SFF ON S.SjangerID = SFF.SjangerID GROUP BY S.SjangerID;



# 2, h)

SELECT Navn FROM skuespiller AS S JOIN skuespillerifilm AS SPIF ON S.SkuespillerID = SPIF.SkuespillerID 
								  JOIN movie AS M on M.MovieID = SPIF.FilmID 
                                  WHERE M.Title ="Ace Ventura: Pet Detective"
								  AND S.Navn NOT IN(
SELECT Navn FROM skuespiller AS S JOIN skuespillerifilm AS SPIF ON S.SkuespillerID = SPIF.SkuespillerID 
								  JOIN movie AS M on M.MovieID = SPIF.FilmID 
                                  WHERE M.Title ="Ace Ventura: When Nature Calls");


# 2, i)

SELECT M.Title, M.MovieID, AVG(S.Fodselsaar) AS Snitt 
							FROM movie AS M JOIN skuespillerifilm AS SPIF ON SPIF.FilmID = M.MovieID 
											JOIN skuespiller AS S ON S.SkuespillerID = SPIF.SkuespillerID
                                            group by M.MovieID
                                            HAVING snitt > (SELECT AVG(Fodselsaar) FROM skuespiller);
                                                            
                                  
                                         