-- dohvati kolicinu svih filmova na DVD-u
SELECT f.naslov, count(f.id) AS 'Broj kopija'
    FROM kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
    WHERE m.tip = 'DVD' AND k.dostupan = 1
    GROUP BY f.id;

-- dohvati kolicinu filmova po svakom mediju za film ID=1
SELECT f.naslov, concat(m.tip, ' ', count(f.id)) AS 'Broj kopija'
    FROM kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
    WHERE f.id = 1 AND k.dostupan = 1
    GROUP BY m.id;

-- za svaki film u bazi dohvatiti kolicinu filmova po mediju
SELECT f.naslov, m.tip, COUNT(*) AS 'kolicina'
	FROM kopija k
	JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
    WHERE k.dostupan = 1
    GROUP BY f.naslov, m.tip; 


-- dohvati prosječnu cijenu filmova s obzirom na ukupnu zalihu filmova
SELECT f.naslov, COUNT(k.id) AS 'Broj kopija', ROUND(AVG(c.cijena * m.koeficijent), 2) AS prosjecna_cijena
    FROM kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN cjenik c ON c.id = f.cjenik_id
    JOIN mediji m ON k.medij_id = m.id
    WHERE k.dostupan = 1
    GROUP BY f.id;

-- izlistai posudbe sa clan.ime i film.naziv
SELECT p.*, c.ime, IFNULL(f.naslov, 'Nije posudio Nista') FROM posudba p 
    JOIN clanovi c ON c.id = p.clan_id
    LEFT JOIN posudba_kopija pk ON p.id = pk.posudba_id
    LEFT JOIN kopija k ON pk.kopija_id = k.id
    LEFT JOIN filmovi f ON k.film_id = f.id;

-- korisetnje IF funkcije
SELECT
    f.naslov,
    m.tip,
    COUNT(k.id) AS 'Broj kopija',
    IF(
        COUNT(k.id) > 2,
        'Dovoljno na zalihi',
        'Nedovoljno na zalihi'
    )
FROM
    kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
GROUP BY
    f.id,
    m.id
ORDER By
    f.naslov;

-- korisetnje CASE strukture toka
SELECT
    f.naslov,
    m.tip,
    COUNT(k.id) AS broj_kopija,
  	CASE
    	WHEN COUNT(k.id) = 0 THEN 'Nema na zalihi'
        WHEN COUNT(k.id) <= 2 THEN 'Malo'
        WHEN COUNT(k.id) > 2 THEN 'Dovoljno'
        ELSE 'Default'
     END AS Stanje
FROM
    kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
GROUP BY
    f.id,
    m.id
ORDER By
    f.naslov;