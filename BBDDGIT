CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);


CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');


--a. Lista el nombre de todos los productos que hay en la tabla producto.

SELECT NOMBRE FROM PRODUCTOS;

--b. Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT NOMBRE AS NOMBRE_DE_PRODUCTO, PRECIO AS EUROS, ID_FABRICANTE AS ID FROM PRODUCTOS;

--c. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(NOMBRE),PRECIO FROM PRODUCTOS;

--d. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(NOMBRE), PRECIO FROM PRODUCTOS;

-- e. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTOS;

--f. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT NOMBRE, TRUNC(PRECIO) FROM PRODUCTOS;

-- g. Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT FABRICANTES.* FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;
SELECT DISTINCT F.ID FROM FABRICANTES F JOIN PRODUCTOS P ON F.ID = P.ID_FABRICANTE;

--h. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT F.ID FROM FABRICANTES F JOIN PRODUCTOS P ON F.ID = P.ID_FABRICANTE;

--i. Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT NOMBRE FROM FABRICANTES ORDER BY NOMBRE ASC;

--j. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT NOMBRE, PRECIO FROM PRODUCTOS ORDER BY PRECIO DESC LIMIT 1;

--k. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT NOMBRE FROM PRODUCTOS WHERE PRECIO >= 400;

--l. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT NOMBRE FROM PRODUCTOS WHERE PRECIO < 400;

--m. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT * FROM PRODUCTOS WHERE PRECIO >= 80 AND PRECIO <= 300;

--n. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT NOMBRE FROM PRODUCTOS WHERE PRECIO BETWEEN 60 AND 200;

--o. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador dE fabricante sea igual a 6.

SELECT * FROM PRODUCTOS WHERE PRECIO > 200 AND ID_FABRICANTE = 6;

--p. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT * FROM PRODUCTOS WHERE ID_FABRICANTE IN (1,3,5);

--q. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT NOMBRE FROM FABRICANTES WHERE NOMBRE LIKE 'S%';

--r. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT NOMBRE FROM FABRICANTEs WHERE NOMBRE LIKE '%e';

--s. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT NOMBRE FROM FABRICANTES WHERE NOMBRE LIKE '%w%';


Consultas multitabla (Composición interna)


--1) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;

--2) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
--productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE FROM PRODUCTOS P JOIN FABRICANTES F ON F.ID = P.ID_FABRICANTE ORDER BY F.NOMBRE ASC;

--3) Devuelve una lista con el identificador del producto, nombre del producto, identificador del
--fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT P.ID, P.NOMBRE, F.ID, F.NOMBRE FROM PRODUCTOS P JOIN FABRICANTES F ON F.ID = P.ID_FABRICANTE;
SELECT PRODUCTOS.ID, PRODUCTOS.NOMBRE, FABRICANTES.ID AS FABRICANTE_ID, FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES  WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;


--4) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE FROM PRODUCTOS P JOIN FABRICANTES F ON P.ID_FABRICANTE = F.ID WHERE P.PRECIO <= ALL (SELECT PRECIO FROM PRODUCTOS);
SELECT P.NOMBRE, P.PRECIO, F.NOMBRE FROM PRODUCTOS P JOIN FABRICANTES F ON P.ID_FABRICANTE = F.ID WHERE P.PRECIO = ALL (SELECT MIN(PRECIO) FROM PRODUCTOS);

SELECT P.NOMBRE, MIN(P.PRECIO) FROM PRODUCTOS P GROUP BY P.NOMBRE;


--5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE FROM PRODUCTOS P JOIN FABRICANTES F ON P.ID_FABRICANTE = F.ID ORDER BY P.PRECIO DESC ;

-- 6) Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT productos.* FROM PRODUCTOS, fabricantes WHERE fabricantes.id = productos.id_fabricante and fabricantes.nombre = 'Lenovo';
SELECT * FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE NOMBRE = 'Lenovo');


--7) Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT productos.* FROM PRODUCTOS, fabricantes WHERE fabricantes.id = productos.id_fabricante and fabricantes.nombre = 'Crucial' and productos.precio > 200; 

--8) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett- Packardy Seagate. Sin utilizar el operador IN.

select productos.* from PRODUCTOS, fabricantes 
WHERE Fabricantes.id = productos.id_fabricante AND ( fabricantes.nombre = 'Asus' or fabricantes.nombre= 'Hewlett-Packard' or fabricantes.nombre='Seagate');

--9) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett- Packardy Seagate. Utilizando el operador IN.

select productos.* from PRODUCTOS, fabricantes WHERE Fabricantes.id = productos.id_fabricante AND FABRICANTES.NOMBRE IN ('Asus', 'Hewlett-Packard', 'Seagate');

--10) Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT P.NOMBRE, P.PRECIO FROM PRODUCTOS P, FABRICANTES F WHERE F.id = p.id_fabricante AND F.NOMBRE LIKE '%e';

--11) Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT P.NOMBRE, P.PRECIO FROM PRODUCTOS P, FABRICANTES F WHERE F.id = p.id_fabricante AND F.NOMBRE LIKE '%w%';

--12) Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE FROM PRODUCTOS P, FABRICANTES F WHERE F.id = p.id_fabricante AND p.precio >= 180 ORDER BY P.PRECIO ASC , P.NOMBRE DESC;

--Consultas multitabla (Composición externa)
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--A. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos.
--El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT F.*,p.nombre FROM FABRICANTES F LEFT JOIN PRODUCTOS P ON F.id = p.id_fabricante;

--B. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT F.* FROM FABRICANTES F LEFT JOIN PRODUCTOS P ON F.id = p.id_fabricante WHERE P.NOMBRE IS NULL;

SELECT * FROM Fabricantes WHERE id NOT IN (SELECT f.id FROM FABRICANTES F JOIN PRODUCTOS P ON F.id = p.id_fabricante);

--C. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique surespuesta.

SELECT COUNT(NOMBRE) FROM PRODUCTOS WHERE ID_FABRICANTE IS NULL;

--Consultas resumen


--1) Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(*) FROM PRODUCTOS;

--2) Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT COUNT (DISTINCT ID_FABRICANTE) FROM PRODUCTOS;

--3) Calcula la media del precio de todos los productos.

SELECT AVG(PRECIO) FROM PRODUCTOS;

--4) Calcula el precio más barato de todos los productos.

SELECT MIN(PRECIO) FROM PRODUCTOS;

--5) Lista el nombre y el precio del producto más caro.

SELECT NOMBRE, PRECIO FROM PRODUCTOS WHERE PRECIO=(SELECT MAX(PRECIO) FROM PRODUCTOS);

--6) Calcula la suma de los precios de todos los productos.

SELECT SUM(PRECIO) FROM PRODUCTOS;

--7) Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(ID) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Asus');

--8) Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Asus');

--9) Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT MIN(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Asus');

--10) Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT MAX(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Asus');

--11) Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Asus');

--12) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT MAX(PRECIO), MIN(PRECIO), AVG(PRECIO), COUNT(ID) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE nombre = 'Crucial');


--13) Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también
--debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas,
--una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.

SELECT f.nombre, COUNT(p.id) FROM PRODUCTOS P JOIN FABRICANTES F ON P.ID_FABRICANTE=F.ID GROUP BY F.NOMBRE;

--14) Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de losfabricantes.
--El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT F.NOMBRE, MAX(P.PRECIO), MIN(P.PRECIO), AVG(P.PRECIO) FROM PRODUCTOS P JOIN FABRICANTES F ON P.ID_FABRICANTE=F.ID GROUP BY F.NOMBRE;

--15) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que 
--tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

SELECT ID_FABRICANTE, MAX(PRECIO), MIN(precio), AVG(PRECIO), COUNT(id) FROM PRODUCTOS GROUP BY ID_FABRICANTE HAVING AVG(PRECIO)>200;

--16) Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior
--a 200€. Es necesario mostrar el nombre del fabricante.

SELECT FABRICANTES.NOMBRE, MAX(PRECIO), MIN(PRECIO), AVG(PRECIO), COUNT(PRODUCTOS.ID) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRECIO)>200;

--17) Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(*) FROM PRODUCTOS WHERE PRECIO >= 180;

--18) Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT FABRICANTES.NOMBRE, COUNT(PRODUCTOS.ID) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE AND PRECIO >=180 GROUP BY FABRICANTES.NOMBRE;

--19) Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

SELECT FABRICANTES.ID, AVG(PRECIO) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.ID;

--20) Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT FABRICANTES.NOMBRE, AVG(PRECIO) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE;

--21) Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRECIO) >=150;

--22) Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING COUNT(PRODUCTOS.ID)>=2;

--Subconsultas (En la cláusula WHERE)

--1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT nombre FROM productos WHERE precio = (SELECT MAX(p.precio) FROM productos p WHERE p.id_fabricante = (SELECT id FROM fabricantes f WHERE f.nombre = 'Lenovo'));
            
--2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM productos WHERE precio = (SELECT MAX(p.precio) FROM productos p WHERE p.id_fabricante = (SELECT id FROM fabricantes f WHERE f.nombre = 'Lenovo'));

--3. Lista el nombre del producto más caro del fabricante Lenovo.

SELECT NOMBRE FROM PRODUCTOS WHERE ID_FABRICANTE=(SELECT ID FROM FABRICANTES WHERE NOMBRE='Lenovo') AND PRECIO=(SELECT MAX(PRECIO)FROM PRODUCTOS
WHERE ID_FABRICANTE = (SELECT ID FROM FABRICANTES WHERE NOMBRE='Lenovo'));

--4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT * FROM PRODUCTOS WHERE PRECIO=(SELECT MIN(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE=(SELECT ID FROM FABRICANTES WHERE NOMBRE='Hewlett-Packard'));

--5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT * FROM productos WHERE precio = (SELECT MAX(p.precio) FROM productos p WHERE p.id_fabricante = (SELECT id FROM fabricantes f WHERE f.nombre = 'Lenovo'));

--6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT * FROM productos WHERE precio >= (SELECT AVG(p.precio) FROM productos p WHERE p.id_fabricante = (SELECT id FROM fabricantes f WHERE f.nombre = 'Asus'))
AND id_fabricante = (SELECT idFROM fabricantes f WHERE f.nombre = 'Asus');

--Subconsultas con ALL y ANY

--7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT * FROM productos p WHERE p.precio >= ALL (SELECT precio FROM productos);

--8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT * FROM productos p WHERE p.precio <= ALL (SELECT precio FROM productos);

--9. Devuelve los nombres de los fabricantes que tienen productos asociados.(Utilizando ALL o ANY).

SELECT nombre FROM fabricantes WHERE id = ANY (SELECT id_fabricante FROM productos);

--10. Devuelve los nombres de los fabricantes que no tienen productos asociados.(Utilizando ALL o ANY).

SELECT nombre FROM fabricantes WHERE id <> ALL (SELECT id_fabricante FROM productos);

-- Subconsultas con IN y NOT IN
--11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre FROM fabricantes WHERE id IN (SELECT id_fabricante FROM productos);

--12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre FROM fabricantes WHERE id NOT IN (SELECT id_fabricante FROM productos);

--Subconsultas con EXISTS y NOT EXISTS
--13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre FROM fabricantes WHERE EXISTS(SELECT * FROM productos WHERE productos.id_fabricante = fabricantes.id);

--14. Devuelve los nombres de los fabricantes que no tienen productos asociados.(Utilizando EXISTS o NOT EXISTS).

SELECT nombre FROM fabricantes WHERE NOT EXISTS(SELECT * FROM productos WHERE productos.id_fabricante = fabricantes.id);

--Subconsultas correlacionadas
--15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT F.NOMBRE, P.NOMBRE, P.PRECIO FROM FABRICANTES F JOIN PRODUCTOS P ON F.ID = P.ID_FABRICANTE WHERE PRECIO =
(SELECT MAX(PRECIO) FROM PRODUCTOS P2 WHERE P2.ID_FABRICANTE=F.ID);

--16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT P.* FROM PRODUCTOS P WHERE PRECIO >= (SELECT AVG(P2.PRECIO) FROM PRODUCTOS P2 WHERE P2.ID_FABRICANTE=P.ID_FABRICANTE);

--17. Lista el nombre del producto más caro del fabricante Lenovo.

SELECT P.NOMBRE FROM FABRICANTES F JOIN PRODUCTOS P ON F.ID=P.ID_FABRICANTE 
WHERE F.NOMBRE='Lenovo' AND P.PRECIO=(SELECT MAX(PRECIO) FROM PRODUCTOS P2 WHERE P2.ID_FABRICANTE=F.ID);

--Subconsultas (En la cláusula HAVING)

--18. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

SELECT FABRICANTES.NOMBRE, COUNT(PRODUCTOS.NOMBRE) FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE
GROUP BY FABRICANTES.NOMBREHAVING COUNT(PRODUCTOS.NOMBRE) = (SELECT COUNT(PRODUCTOS.NOMBRE) FROM PRODUCTOS, FABRICANTES 
WHERE FABRICANTES.NOMBRE = 'Lenovo' AND FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE);