---ProyectO Base de datos.

CREATE TABLE tb_materiales(
UnidadPrecio NUMBER,
proveedor    VARCHAR2(100),
ID           VARCHAR2(50)
);

CREATE TABLE tb_productos(
precio       NUMBER,
descripcion  VARCHAR2(100),
ID           VARCHAR2(50),
categoria    VARCHAR2(50)
);

CREATE TABLE tb_proveedores(
numero    NUMBER,
correo    VARCHAR2(100),
ID        VARCHAR2(50),
nombre    VARCHAR2(50)

);

CREATE TABLE tb_clientes(
telefono     NUMBER,
nombre    VARCHAR2(100),
ID        VARCHAR2(50),
correo    VARCHAR2(50)
);

CREATE TABLE tb_facturas(
cliente     VARCHAR2(100),
correo      VARCHAR(50),
fecha      VARCHAR2(100),
ID           VARCHAR2(50)
);

 --- Tabla opcional , se usara en un futuro de ser necesario
 
CREATE TABLE tb_categorias(
productos   VARCHAR2(100),
materiales  VARCHAR2(100),
proveedores VARCHAR2(100),
clientes    VARCHAR2(100),
ID_categorias VARCHAR2(50)
);


INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (25000, 'Zapatos deportivos','ZA02', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (23000, 'Vans','ZA03', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (2000, 'Sandalias','ZA04', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (12000, 'Zapatos planos','ZA05', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (18000, 'Botines','ZA06', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (9000, 'Alpargata','ZA07', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (4000, 'Botas de lluvia','ZA08', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (5000, 'Pantuflas','ZA09', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (6000, 'Zuecos','ZA10', 'calzado');
INSERT INTO tb_productos(precio, descripcion, ID, categoria) VALUES (25000, 'Botas','ZA11', 'calzado');

commit;



