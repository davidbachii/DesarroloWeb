

-- object: Sala | type: TABLE --
CREATE TABLE Sala (
	"nombreSala" varchar(20) NOT NULL,
	filas smallint NOT NULL,
	columnas smallint NOT NULL,
	CONSTRAINT "nombreSala" PRIMARY KEY ("nombreSala")
);

-- object: Entrada | type: TABLE --
CREATE TABLE Entrada (
	"idEntrada" varchar(10) NOT NULL,
	fecha date NOT NULL,
	hora time NOT NULL,
	fila smallint,
	columna smallint NOT NULL,
	"nombreSala_Sala" varchar(20),
	CONSTRAINT "idEntrada" PRIMARY KEY ("idEntrada")
);

-- object: "Sala_fk" | type: CONSTRAINT --
ALTER TABLE Entrada ADD CONSTRAINT "Sala_fk" FOREIGN KEY ("nombreSala_Sala")
REFERENCES Sala ("nombreSala");

-- ddl-end --

-- object: Pelicula | type: TABLE --
CREATE TABLE Pelicula (
	"nombrePelicula" varchar(50) NOT NULL,
	sinopsis varchar(200) NOT NULL,
	"paginaOficial" varchar(50),
	"tituloOriginal" varchar(50),
	genero varchar(50) NOT NULL,
	nacionalidad varchar(50) NOT NULL,
	duracion integer NOT NULL,
	anho integer NOT NULL,
	distribuidora varchar(50),
	director varchar(50) NOT NULL,
	"clasificacionEdad" smallint NOT NULL,
	"otrosDatos" varchar(200),
	actores varchar(200),
	"nombreSala_Sala" varchar(20),
	CONSTRAINT "nombrePelicula" PRIMARY KEY ("nombrePelicula")
);

-- object: "Sala_fk" | type: CONSTRAINT --
ALTER TABLE Pelicula ADD CONSTRAINT "SalaCine_fk" FOREIGN KEY ("nombreSala_Sala")
REFERENCES Sala ("nombreSala");

-- ddl-end --

-- object: Usuario | type: TABLE --
CREATE TABLE Usuario (
	nombre varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,
	contrasenha varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"fechaNacimiento" date NOT NULL,
	CONSTRAINT email PRIMARY KEY (email)
);

-- object: Reserva | type: TABLE --
CREATE TABLE Reserva (
	"numeroRef" varchar(20) NOT NULL,
	estado boolean NOT NULL,
	"email_Usuario" varchar(50),
	"idEntrada_Entrada" varchar(10),
	CONSTRAINT "nRef" PRIMARY KEY ("numeroRef")
);

-- object: Comentario | type: TABLE --
CREATE TABLE Comentario (
	texto varchar(500) NOT NULL,
	valoracion smallint NOT NULL,
	"fechaComentario" date NOT NULL,
	"email_Usuario" varchar(50) NOT NULL,
	"nombrePelicula_Pelicula" varchar(50),
	CONSTRAINT "idComentario" PRIMARY KEY ("fechaComentario")
);

-- object: "Usuario_fk" | type: CONSTRAINT --
ALTER TABLE Reserva ADD CONSTRAINT "Usuario_fk" FOREIGN KEY ("email_Usuario")
REFERENCES Usuario (email);

-- ddl-end --

-- object: "Entrada_fk" | type: CONSTRAINT --
ALTER TABLE Reserva ADD CONSTRAINT "Entrada_fk" FOREIGN KEY ("idEntrada_Entrada")
REFERENCES Entrada ("idEntrada");

-- ddl-end --

-- object: "Reserva_uq" | type: CONSTRAINT --
ALTER TABLE Reserva ADD CONSTRAINT "Reserva_uq" UNIQUE ("idEntrada_Entrada");
-- ddl-end --

-- object: "Usuario_fk" | type: CONSTRAINT --
ALTER TABLE Comentario ADD CONSTRAINT "UsuarioComentario_fk" FOREIGN KEY ("email_Usuario")
REFERENCES Usuario (email);
-- ddl-end --

-- object: "Pelicula_fk" | type: CONSTRAINT --
ALTER TABLE Comentario ADD CONSTRAINT "Pelicula_fk" FOREIGN KEY ("nombrePelicula_Pelicula")
REFERENCES Pelicula ("nombrePelicula"); 
-- ddl-end --


