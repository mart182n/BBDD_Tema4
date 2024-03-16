CREATE TABLE PROFESOR(
DNI_PROFESOR VARCHAR(9) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
AP1 VARCHAR(40) NOT NULL,
AP2 VARCHAR(40) NULL,
DIRECCION VARCHAR(50) NOT NULL,
CUENTA VARCHAR(16) NOT NULL,
TELEFONO NUMBER(9) NOT NULL,
CONSTRAINT PK_PROFESOR PRIMARY KEY(DNI_PROFESOR)
);

CREATE TABLE CICLOFORM(
CODCICLO NUMBER(3) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
TIPO VARCHAR(20) NOT NULL,
CONSTRAINT PK_CICLOFORM PRIMARY KEY(CODCICLO)
);

CREATE TABLE ASIGNATURA(
CODASIG NUMBER(3) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
NUMHORAS NUMBER(2) NOT NULL,
DNI_PROFESOR NUMBER(9) NOT NULL,
CODCICLO NUMBER(3) NOT NULL,
CONSTRAINT PK_ASIGNATURA PRIMARY KEY(CODASIG),
CONSTRAINT FK_PROFESOR FOREIGN KEY(DNI_PROFESOR) REFERENCES PROFESOR(DNI_PROFESOR),
CONSTRAINT FK_CICLOFORM FOREIGN KEY(CODCICLO) REFERENCES CICLOFORM(CODCICLO)
);

CREATE TABLE IDIOMA(
CODIDIOMA NUMBER(3) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
CONSTRAINT PK_IDIOMA PRIMARY KEY(CODIDIOMA)
);

CREATE TABLE ALUMNO(
DNI_ALUMNO VARCHAR(9) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
AP1 VARCHAR(40) NOT NULL,
AP2 VARCHAR(40) NULL,
DIRECCION VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
TELEFONO NUMBER(9) NOT NULL,
CODIDIOMA NUMBER(3) NOT NULL,
CONSTRAINT PK_ALUMNO PRIMARY KEY(DNI_ALUMNO),
CONSTRAINT FK_IDIOMA FOREIGN KEY(CODIDIOMA) REFERENCES IDIOMA(CODIDIOMA)
);

CREATE TABLA MATRICULA(
DNI_ALUMNO VARCHAR(9) NOT NULL,
CODASIG NUMBER(3) NOT NULL,
CONSTRAINT PK_MATRICULA PRIMARY KEY(DNI_MATRICULA, CODASIG),
CONSTRAINT FK_ALUMNO FOREIGN KEY(DNI_ALUMNO) REFERENCES ALUMNO(DNI_ALUMNO),
CONSTRAINT FK_ASIGNATURA FOREIGN KEY(CODASIG) REFERENCES ASIGNATURA(CODASIG)
);

CREATE TABLE IDIOMASPROF(
CODIDIOMA NUMBER(3) NOT NULL,
DNI_PROFESOR VARCHAR(9) NOT NULL,
CONSTRAINT PK_IDIOMASPROF PRIMARY KEY(CODIDIOMA, DNI_PROFESOR),
CONSTRAINT FK_IDIOMA_1 FOREIGN KEY(CODIDIOMA) REFERENCES IDIOMA(CODIDIOMA),
CONSTRAINT FK_PROFESOR_1 FOREIGN KEY(DNI_PROFESOR) REFERENCES PROFESOR(DNI_PROFESOR)
);