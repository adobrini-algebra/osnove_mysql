INSERT INTO zanrovi (ime)
VALUES
('Action'),
('Comedy'),
('Drama');

INSERT INTO filmovi (naslov, godina, zanr_id)
VALUES
('Inception', 1, 1),
('The Hangover', 2, 2),
('The Godfather', 3, 1);

INSERT INTO cjenik (tip_filma, cijena, zakasnina_po_danu)
VALUES
('Hit', 3.00, 1.50),
('Regular', 2.00, 1.00),
('Old', 1.00, 0.50);

INSERT INTO mediji (tip, koeficijent)
VALUES
('kazeta', 1),
('DVD', 1.2),
('BlueRay', 1.5);

INSERT INTO clanovi (ime, adresa, telefon, email, clanski_broj)
VALUES
('John Doe', '123 Elm Street', '555-1234', 'a@b.com', 'V001'),
('Jane Smith', '456 Oak Avenue', '555-5678', 'a@b2.com', 'V002'),
('Alice Johnson', '789 Pine Road', '555-9012', 'a@b3.com', 'V003');

INSERT INTO posudba (datum_posudbe, datum_povrata, film_id, clan_id, cjenik_id, medij_id)
VALUES
('2024-09-06', DATE_SUB(NOW(), INTERVAL 2 DAY), 1, 2, 1, 3),
(DATE_SUB(NOW(), INTERVAL 2 DAY), NULL, 2, 3, 2, 3),
(DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), 3, 1, 2, 1);


INSERT INTO film_medij
VALUES
(1,3),
(2,3),
(3,1);