ALTER TABLE DIRECTOR ADD TELEFONO NUMBER 9 NOT NULL;
ALTER TABLE DIRECTOR ADD CONSTRAINT UK_TELF_DIRECTOR UNIQUE TELEFONO;
ALTER TABLE DIRECTOR ADD CONSTRAINT CK_TELF_DIRECTOR CHECK (LENGHT(TELEFONO)=9);
ALTER TABLE DIRECTOR ADD EMAIL VARCHAR 20 NOT NULL;
ALTER TABLE DIRECTOR ADD CONSTRAINT UK_EMAIL_DIRECTOR UNIQUE EMAIL;

ALTER TABLE CLIENTE ADD TELEFONO NUMBER 9 NOT NULL;
ALTER TABLE CLIENTE ADD CONSTRAINT UK_TELF_CLIENTE UNIQUE TELEFONO;
ALTER TABLE DCLIENTE ADD CONSTRAINT CK_TELF_DIRECTOR CHECK (LENGHT(TELEFONO)=9);
ALTER TABLE CLIENTE ADD EMAIL VARCHAR 20 NOT NULL;
ALTER TABLE CLIENTE ADD CONSTRAINT UK_EMAIL_CLIENTE UNIQUE EMAIL;

ALTER TABLE VENDEDOR ADD TELEFONO NUMBER 9 NOT NULL;
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_TELF_VENDEDOR UNIQUE TELEFONO;
ALTER TABLE VENDEDOR ADD CONSTRAINT CK_TELF_DIRECTOR CHECK (LENGHT(TELEFONO)=9);
ALTER TABLE VENDEDOR ADD EMAIL VARCHAR 20 NOT NULL;
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_EMAIL_VENDEDOR UNIQUE EMAIL;

ALTER TABLE VENTA ADD CONSTRAINT CK_VENTA CHECK NOT(DNI_CLIENTE=DNI_VENDEDOR);

ALTER TABLE PRODUCTO ADD CONSTRAINT UK_PRODUCTO_DESC UNIQUE DESCRIPCION;
ALTER TABLE PRODUCTO MODIFY FAMILIA ON DELETE SET NULL;
ALTER TABLE PRODUCTO MODIFY GENERO ON DELETE SET NULL;

ALTER TABLE LINEA_VENTA ADD CONSTRAINT CK_NUM_LINEA CHECK (NUM_LINEA<99 AND NUM_LINEA>1);