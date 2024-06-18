### Baza podataka jednostavne knjiznice
- Knjižnica svojim članovima izdaje članske iskaznice.
- Knjige su kategorizirane po žanrovima.
- Svaka knjiga ima jedinstveni ISBN, ali može postojati više kopija iste knjige.
- Knjižnica treba pratiti svaku fizičku kopiju knjige i stanje dostupnosti iste.
- Članovi mogu posuđivati ​​knjige na određeno vrijeme, a zakašnjeli povrati povlače novčanu kaznu.

### ER Diagram
Entiteti:
- Član
- Knjiga
- Kategorija (Žanr)
- Kopija
- Posudba

### Relacije
- Članovi mogu posuditi više knjiga.
- Svaka knjiga pripada jednom žanru.
- Svaka knjiga može imati više primjeraka.
- Svaki zapis o posudbi povezan je s jednim članom i jednim primjerkom knjige.

### SQL naredbe za kreiranje baze

kreirajte bazu i popunite tablice sa proizvoljnim podacima

```sql
DROP DATABASE IF EXISTS knjiznica;
CREATE DATABASE IF NOT EXISTS knjiznica DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE knjiznica;

-- Tablica za članove knjižnice
CREATE TABLE IF NOT EXISTS clanovi (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(100) NOT NULL,
    prezime VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    datum_rodjenja DATE,
    datum_clanstva DATE NOT NULL DEFAULT (CURDATE())
);-- ako ne navedemo ENGINE=InnoDB MySQL ce po zadanim postavkama sam postaviti InnoDB

-- Tablica za žanrove knjiga
CREATE TABLE IF NOT EXISTS zanrovi (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    naziv VARCHAR(100) UNIQUE NOT NULL
);

-- Tablica za knjige
CREATE TABLE IF NOT EXISTS knjige (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    naslov VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    zanr_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (zanr_id) REFERENCES zanrovi(id)
);

-- Tablica za fizičke kopije knjiga
CREATE TABLE IF NOT EXISTS kopija (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    knjiga_id INT UNSIGNED NOT NULL,
    barkod VARCHAR(50) NOT NULL,
    dostupna BOOLEAN DEFAULT TRUE,
    UNIQUE (knjiga_id, barkod),
    FOREIGN KEY (knjiga_id) REFERENCES knjige(id)
);

-- Tablica za posudbe
CREATE TABLE IF NOT EXISTS posudbe (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    clan_id INT UNSIGNED NOT NULL,
    kopija_id INT UNSIGNED NOT NULL,
    datum_posudbe DATE NOT NULL DEFAULT (CURDATE()),
    datum_povrata DATE,
    zakasnina DECIMAL(5, 2),
    FOREIGN KEY (clan_id) REFERENCES clanovi(id),
    FOREIGN KEY (kopija_id) REFERENCES kopija(id)
);
```