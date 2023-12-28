-- object: Pelicula | type: TABLE --
CREATE TABLE Pelicula (
    nombrePelicula varchar(50) NOT NULL,
    sinopsis varchar(200) NOT NULL,
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


