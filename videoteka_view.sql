CREATE VIEW film_na_dvdu
AS
SELECT f.naslov, count(f.id) AS 'Broj kopija'
    FROM kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
    WHERE m.tip = 'DVD' AND k.dostupan = 1 AND f.naslov = ???
    GROUP BY f.id;

SELECT * FROM `film_na_dvdu`;