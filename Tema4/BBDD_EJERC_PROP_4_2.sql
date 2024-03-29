CREATE TABLE OFICINA(
CODOFICINA NUMBER(3) NOT NULL,
DOMICILIO VARCHAR(40) NOT NULL,
TELEFONO NUMBER (9) NOT NULL,
CONSTRAINT PK_OFICINA PRIMARY KEY(CODOFICINA)
);

CREATE TABLE CLIENTE(
DNI_CLIENTE VARCHAR(9) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
PRAPELLIDO VARCHAR(40) NOT NULL,
SGAPELLIDO VARCHAR(40) NULL,
DOMICILIO VARCHAR(50) NOT NULL,
NUMTARJETA NUMBER(20) NOT NULL,
CONSTRAINT PK_CLIENTE PRIMARY KEY(DNI_CLIENTE)
);

CREATE TABLE FABRICANTE(
CODFAB NUMBER(3) NOT NULL,
FABRICANTE VARCHAR(40) NOT NULL,
CONSTRAINT PK_FABRICANTE PRIMARY KEY(CODFAB)
);

CREATE TABLE MARCA(
CODMARCA NUMBER(3) NOT NULL,
MARCA VARCHAR(40) NOT NULL,
CONSTRAINT PK_MARCA PRIMARY KEY(CODMARCA)
);

CREATE TABLE VEHICULO(
CODVEH NUMBER(3) NOT NULL,
MODELO VARCHAR(40) NOT NULL,
TIPO VARCHAR(20) NOT NULL,
COLOR VARCHAR(40) NOT NULL,
CODFAB NUMBER(3) NOT NULL,
CODMARCA NUMBER(3) NOT NULL,
CONSTRAINT PK_VEHICULO PRIMARY KEY(CODVEH),
CONSTRAINT FK_FABRICANTE FOREIGN KEY(CODFAB) REFERENCES FABRICANTE(CODFAB),
CONSTRAINT FK_MARCA FOREIGN KEY(CODMARCA) REFERENCES MARCA(CODMARCA)
);

CREATE TABLE CURSO(
CODCURSO NUMBER(3) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
NUMHORAS NUMBER(2) NOT NULL,
FECHA DATE NOT NULL,
CONSTRAINT PK_CURSO PRIMARY KEY(CODCURSO)
);

CREATE TABLE EMPLEADO(
DNI_EMPLEADO VARCHAR(9) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
PRAPELLIDO VARCHAR(40) NOT NULL,
SGAPELLIDO VARCHAR(40) NULL,
DOMICILIO VARCHAR(50) NOT NULL,
NUMCUENTA NUMBER(19) NOT NULL,
CONSTRAINT PK_EMPLEADO PRIMARY KEY(DNI_EMPLEADO)
);

CREATE TABLE CURSOEMPL(
DNI_EMPLEADO VARCHAR(9) NOT NULL,
CODCURSO NUMBER(3) NOT NULL,
CONSTRAINT PK_CURSOEMPL PRIMARY KEY(DNI_EMPLEADO, CODCURSO),
CONSTRAINT FK_CURSOEMPL_CURSO FOREIGN KEY(CODCURSO) REFERENCES CURSO(CODCURSO),
CONSTRAINT FK_CURSOEMPL_EMPLEADO FOREIGN KEY(DNI_EMPLEADO) REFERENCES EMPLEADO(DNI_EMPLEADO)
);

CREATE TABLE ALQUILER(
CODALQUILER NUMBER(3) NOT NULL,
FECHA DATE NOT NULL,
NUMDIAS NUMBER(4) NOT NULL,
KMACTUAL NUMBER(7) NOT NULL,
KMENTREGA NUMBER(7) NOT NULL,
CODOFICINA NUMBER(3) NOT NULL,
DNI_CLIENTE VARCHAR(9) NOT NULL,
DNI_EMPLEADO VARCHAR(9) NOT NULL,
CODVEH NUMBER(3) NOT NULL,
CONSTRAINT PK_ALQUILER PRIMARY KEY(CODALQUILER),
CONSTRAINT FK_OFICINA FOREIGN KEY(CODOFICINA) REFERENCES OFICINA(CODOFICINA),
CONSTRAINT FK_CLIENTE FOREIGN KEY(DNI_CLIENTE) REFERENCES CLIENTE(DNI_CLIENTE),
CONSTRAINT FK_EMPLEADO FOREIGN KEY(DNI_EMPLEADO) REFERENCES EMPLEADO(DNI_EMPLEADO),
CONSTRAINT FK_VEHICULO FOREIGN KEY(CODVEH) REFERENCES VEHICULO(CODVEH)
);

CREATE TABLE OFICINASALQ(
CODOFICINA NUMBER(3) NOT NULL,
CODALQUILER NUMBER (3) NOT NULL,
CONSTRAINT PK_OFICINASALQ PRIMARY KEY(CODOFICINA, CODALQUILER),
CONSTRAINT FK_OFICINASALQ_OFICINA FOREIGN KEY(CODOFICINA) REFERENCES OFICINA(CODOFICINA),
CONSTRAINT FK_OFICINASALQ_ALQUILER FOREIGN KEY(CODALQUILER) REFERENCES ALQUILER(CODALQUILER)
);