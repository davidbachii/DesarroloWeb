-- object: Pelicula | type: TABLE --
CREATE TABLE Pelicula (
    nombrePelicula varchar(50) NOT NULL,
    sinopsis varchar(500) NOT NULL,
    paginaOficial varchar(50),
    tituloOriginal varchar(50),
    genero varchar(50) NOT NULL,
    nacionalidad varchar(50) NOT NULL,
    duracion integer NOT NULL,
    anho integer NOT NULL,
    distribuidora varchar(50),
    director varchar(50) NOT NULL,
    clasificacionEdad smallint NOT NULL,
    otrosDatos varchar(200),
    actores varchar(200),
    url_image varchar(500),
    CONSTRAINT PK_Pelicula PRIMARY KEY (nombrePelicula)
);

-- object: Sala | type: TABLE --
CREATE TABLE Sala (
    nombreSala varchar(20) NOT NULL,
    filas smallint NOT NULL,
    columnas smallint NOT NULL,
    nombrePelicula_Pelicula varchar(50), -- Nueva columna
    CONSTRAINT PK_Sala PRIMARY KEY (nombreSala)
);

-- object: Entrada | type: TABLE --
CREATE TABLE Entrada (
    idEntrada varchar(10) NOT NULL,
    fecha date NOT NULL,
    hora time NOT NULL,
    fila smallint,
    columna smallint NOT NULL,
    nombreSala_Sala varchar(20),
    CONSTRAINT PK_Entrada PRIMARY KEY (idEntrada)
);

-- object: Usuario | type: TABLE --
CREATE TABLE Usuario (
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    contrasenha varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    fechaNacimiento date NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (email)
);

-- object: Reserva | type: TABLE --
CREATE TABLE Reserva (
    numeroRef varchar(20) NOT NULL,
    estado boolean NOT NULL,
    email_Usuario varchar(50),
    idEntrada_Entrada varchar(10),
    CONSTRAINT PK_Reserva PRIMARY KEY (numeroRef)
);

-- object: Comentario | type: TABLE --
CREATE TABLE Comentario (
    texto varchar(500) NOT NULL,
    valoracion smallint NOT NULL,
    fechaComentario date NOT NULL,
    email_Usuario varchar(50) NOT NULL,
    nombrePelicula_Pelicula varchar(50),
    CONSTRAINT PK_Comentario PRIMARY KEY (fechaComentario)
);

--object: Tarjeta | type: TABLE --
CREATE TABLE Tarjeta (
    numeroTarjeta varchar(16) NOT NULL,
    nombreTitular varchar(50) NOT NULL,
    fechaExpiracion date NOT NULL,
    codigoSeguridad varchar(3) NOT NULL,
    email_Usuario varchar(50) NOT NULL,
    CONSTRAINT PK_Tarjeta PRIMARY KEY (numeroTarjeta),
    CONSTRAINT FK_Tarjeta_Usuario FOREIGN KEY (email_Usuario) REFERENCES Usuario (email)
);

-- object: SalaPelicula_fk | type: CONSTRAINT --
ALTER TABLE Sala ADD CONSTRAINT SalaPelicula_fk FOREIGN KEY (nombrePelicula_Pelicula)
REFERENCES Pelicula (nombrePelicula);

-- object: SalaEntrada_fk | type: CONSTRAINT --
ALTER TABLE Entrada ADD CONSTRAINT SalaEntrada_fk FOREIGN KEY (nombreSala_Sala)
REFERENCES Sala (nombreSala);

-- object: UsuarioReserva_fk | type: CONSTRAINT --
ALTER TABLE Reserva ADD CONSTRAINT UsuarioReserva_fk FOREIGN KEY (email_Usuario)
REFERENCES Usuario (email);

-- object: EntradaReserva_fk | type: CONSTRAINT --
ALTER TABLE Reserva ADD CONSTRAINT EntradaReserva_fk FOREIGN KEY (idEntrada_Entrada)
REFERENCES Entrada (idEntrada);

-- object: ComentarioUsuario_fk | type: CONSTRAINT --
ALTER TABLE Comentario ADD CONSTRAINT ComentarioUsuario_fk FOREIGN KEY (email_Usuario)
REFERENCES Usuario (email);

-- object: ComentarioPelicula_fk | type: CONSTRAINT --
ALTER TABLE Comentario ADD CONSTRAINT ComentarioPelicula_fk FOREIGN KEY (nombrePelicula_Pelicula)
REFERENCES Pelicula (nombrePelicula);


--IMPORTS--

-- Películas

INSERT INTO Pelicula (nombrePelicula, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, anho, distribuidora, director, clasificacionEdad, otrosDatos, actores, url_image)
VALUES ('El Padrino', 'Un poderoso drama criminal que sigue la vida de la familia Corleone en el mundo del crimen organizado.', 'https://example.com/godfather', 'Il Padrino', 'Crimen, Drama', 'Estados Unidos', 175, 1972, 'Paramount Pictures', 'Francis Ford Coppola', 18, 'Ganadora de 3 premios Oscar.', 'Marlon Brando, Al Pacino, James Caan','images/ElPadrino.jpeg');

INSERT INTO Pelicula (nombrePelicula, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, anho, distribuidora, director, clasificacionEdad, otrosDatos, actores, url_image)
VALUES ('Cadena Perpetua', 'La historia de un hombre inocente encarcelado que encuentra esperanza y amistad en Shawshank.', 'https://example.com/shawshank', 'Shawshank Redemption', 'Drama', 'Estados Unidos', 142, 1994, 'Columbia Pictures', 'Frank Darabont', 15, 'Basada en la novela de Stephen King.', 'Tim Robbins, Morgan Freeman', 'images/CadenaPerpetua.jpeg');

INSERT INTO Pelicula (nombrePelicula, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, anho, distribuidora, director, clasificacionEdad, otrosDatos, actores, url_image)
VALUES ('El Caballero Oscuro', 'Batman se enfrenta a su némesis, el Joker, en un juego de ingenio que amenaza Gotham City.', 'https://example.com/darkknight', 'The Dark Knight', 'Acción, Crimen, Drama', 'Estados Unidos', 152, 2008, 'Warner Bros.', 'Christopher Nolan', 16, 'Ganadora de 2 premios Oscar.', 'Christian Bale, Heath Ledger, Aaron Eckhart', 'images/CaballeroOscuro.jpeg');

-- Puedes agregar más películas según sea necesario...

-- Salas
INSERT INTO Sala (nombreSala, filas, columnas, nombrePelicula_Pelicula)
VALUES ('Sala 1', 10, 15, 'El Padrino');

INSERT INTO Sala (nombreSala, filas, columnas, nombrePelicula_Pelicula)
VALUES ('Sala 2', 8, 12, 'Cadena Perpetua');

INSERT INTO Sala (nombreSala, filas, columnas, nombrePelicula_Pelicula)
VALUES ('Sala 3', 12, 20, 'El Caballero Oscuro');

-- Entradas
INSERT INTO Entrada (idEntrada, fecha, hora, fila, columna, nombreSala_Sala)
VALUES ('E1', '2023-01-01', '12:00:00', 5, 10, 'Sala 1');

INSERT INTO Entrada (idEntrada, fecha, hora, fila, columna, nombreSala_Sala)
VALUES ('E2', '2023-01-02', '15:30:00', 3, 8, 'Sala 2');

INSERT INTO Entrada (idEntrada, fecha, hora, fila, columna, nombreSala_Sala)
VALUES ('E3', '2023-01-03', '18:45:00', 8, 15, 'Sala 3');

-- Usuarios
INSERT INTO Usuario (nombre, apellidos, contrasenha, email, fechaNacimiento)
VALUES ('Rafael', 'Gonzalez', 'contraseña1', 'rafael@example.com', '1990-05-15');

INSERT INTO Usuario (nombre, apellidos, contrasenha, email, fechaNacimiento)
VALUES ('Maria', 'Lopez', 'contraseña2', 'maria@example.com', '1985-09-22');

INSERT INTO Usuario (nombre, apellidos, contrasenha, email, fechaNacimiento)
VALUES ('Carlos', 'Martinez', 'contraseña3', 'carlos@example.com', '1995-12-10');

-- Reservas
INSERT INTO Reserva (numeroRef, estado, email_Usuario, idEntrada_Entrada)
VALUES ('R1', TRUE, 'rafael@example.com', 'E1');

INSERT INTO Reserva (numeroRef, estado, email_Usuario, idEntrada_Entrada)
VALUES ('R2', TRUE, 'maria@example.com', 'E2');

INSERT INTO Reserva (numeroRef, estado, email_Usuario, idEntrada_Entrada)
VALUES ('R3', FALSE, 'carlos@example.com', 'E3');

-- Comentarios
INSERT INTO Comentario (texto, valoracion, fechaComentario, email_Usuario, nombrePelicula_Pelicula)
VALUES ('Una obra maestra, actuaciones increíbles.', 5, '2023-01-05', 'rafael@example.com', 'El Padrino');

INSERT INTO Comentario (texto, valoracion, fechaComentario, email_Usuario, nombrePelicula_Pelicula)
VALUES ('Emocionante de principio a fin.', 4, '2023-01-06', 'maria@example.com', 'Cadena Perpetua');

INSERT INTO Comentario (texto, valoracion, fechaComentario, email_Usuario, nombrePelicula_Pelicula)
VALUES ('Efectos visuales asombrosos.', 4, '2023-01-07', 'carlos@example.com', 'El Caballero Oscuro');

-- Tarjetas
INSERT INTO Tarjeta (numeroTarjeta, nombreTitular, fechaExpiracion, codigoSeguridad, email_Usuario)
VALUES ('1111222233334444', 'Rafael Gonzalez', '2024-08-31', '456', 'rafael@example.com');

INSERT INTO Tarjeta (numeroTarjeta, nombreTitular, fechaExpiracion, codigoSeguridad, email_Usuario)
VALUES ('4444555566667777', 'Maria Lopez', '2023-11-30', '987', 'maria@example.com');

INSERT INTO Tarjeta (numeroTarjeta, nombreTitular, fechaExpiracion, codigoSeguridad, email_Usuario)
VALUES ('7777888899990000', 'Carlos Martinez', '2023-09-30', '345', 'carlos@example.com');
