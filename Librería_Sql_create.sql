-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 04:43:21.148

-- tables
-- Table: Autores
CREATE TABLE Autores (
    id_autor int NOT NULL COMMENT 'id autor',
    id_paises int NOT NULL COMMENT 'pais',
    nombre_autor varchar(80) NOT NULL COMMENT 'nombre dato del autor',
    ano_nac timestamp NOT NULL COMMENT 'año de nacimiento',
    ano_fall timestamp NOT NULL COMMENT 'año de fallecimiento',
    Paises_id_paises int NOT NULL COMMENT 'pais',
    CONSTRAINT Autores_pk PRIMARY KEY (id_autor,id_paises)
) COMMENT 'dato de los autores';

-- Table: Generos
CREATE TABLE Generos (
    id_genero int NOT NULL,
    genero varchar(90) NOT NULL,
    CONSTRAINT Generos_pk PRIMARY KEY (id_genero)
) COMMENT 'Datos de los géneros';

-- Table: Libros
CREATE TABLE Libros (
    cod_libro int NOT NULL COMMENT 'dato libro',
    titulo varchar(80) NOT NULL COMMENT 'titulo del libro',
    tapa varchar(80) NOT NULL COMMENT 'tapa del libro',
    precio numeric(1,5) NOT NULL COMMENT 'precio del libro',
    fecha timestamp NOT NULL COMMENT 'fecha del libro',
    id_autor int NOT NULL COMMENT 'dato autor',
    id_genero int NOT NULL,
    autores_id_autor int NOT NULL COMMENT 'nombre autor',
    id_paises int NOT NULL,
    CONSTRAINT Libros_pk PRIMARY KEY (cod_libro,id_autor,id_genero)
) COMMENT 'datos de los libros';

-- Table: Paises
CREATE TABLE Paises (
    id_paises int NOT NULL,
    pais varchar(80) NOT NULL,
    CONSTRAINT Paises_pk PRIMARY KEY (id_paises)
) COMMENT 'dato de los paises';

-- foreign keys
-- Reference: Autores_Paises (table: Autores)
ALTER TABLE Autores ADD CONSTRAINT Autores_Paises FOREIGN KEY Autores_Paises (Paises_id_paises)
    REFERENCES Paises (id_paises);

-- Reference: Libros_Autores (table: Libros)
ALTER TABLE Libros ADD CONSTRAINT Libros_Autores FOREIGN KEY Libros_Autores (autores_id_autor,id_paises)
    REFERENCES Autores (id_autor,id_paises);

-- Reference: Libros_Generos (table: Libros)
ALTER TABLE Libros ADD CONSTRAINT Libros_Generos FOREIGN KEY Libros_Generos (id_genero)
    REFERENCES Generos (id_genero);

-- End of file.

