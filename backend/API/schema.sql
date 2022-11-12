DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS region;

CREATE TABLE region (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    avg_footprint INTEGER NOT NULL
);

CREATE TABLE company (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    rfc TEXT NOT NULL,
    industria TEXT NOT NULL,
    id_region INTEGER NOT NULL,
    FOREIGN KEY(id_region) REFERENCES region(id)
);

CREATE TABLE product (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    detalle TEXT NOT NULL,
    footprint INTEGER NOT NULL,
    cadena TEXT NOT NULL,
    id_company INTEGER NOT NULL,
    FOREIGN KEY(id_company) REFERENCES company(id)
);

INSERT INTO region(name, avg_footprint) VALUES("USA", 130);
INSERT INTO region(name, avg_footprint) VALUES("JAP", 100);
INSERT INTO region(name, avg_footprint) VALUES("UK", 150);

INSERT INTO company(name, rfc, industria, id_region) VALUES("Kellogg Company", "A01234567", "Food Products", 1);
INSERT INTO company(name, rfc, industria, id_region) VALUES("Konica Minolta, Inc.", "A01111111", "Technology Hardware and Equipment", 2);
INSERT INTO company(name, rfc, industria, id_region) VALUES("Associated British Foods", "A01222222", "Food Products", 3);

INSERT INTO product(name, detalle, footprint, cadena, id_company) VALUES("Frosted_Flakes", "Cereal", 2, "End", 1);
INSERT INTO product(name, detalle, footprint, cadena, id_company) VALUES("bizhub_C558", "Printer", 1818, "End", 2);
INSERT INTO product(name, detalle, footprint, cadena, id_company) VALUES("bizhub_C658", "Printer", 2274, "End", 2);
INSERT INTO product(name, detalle, footprint, cadena, id_company) VALUES("White_Crystalline Sugar", "Sugar", 650, "Raw", 3);


