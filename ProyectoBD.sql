---ProyectO Base de datos.

<<<<<<< Updated upstream
CREATE TABLE tb_materiales(
UnidadPrecio  NUMBER,
proveedor     VARCHAR2(100),
ID_materiales VARCHAR2(50)
=======
create sequence A12
START WITH 1
INCREMENT BY 1;

create sequence A13
START WITH 20
INCREMENT BY 1;

create sequence A14
START WITH 30
INCREMENT BY 1;

create sequence A15
START WITH 50
INCREMENT BY 1;

create sequence A16
START WITH 60
INCREMENT BY 1;

---------------------------------------------------------------------
---------------------------------------------------------------------
drop table tb_materiales;
drop table tb_productos;
drop table tb_proveedores;
drop table tb_facturas;
drop table tb_clientes;

--- creacion de tablas

CREATE TABLE tb_materiales(
    ID_material  int primary key not null,
    unidadPrecio int not null,
    ID_proveedor INT NOT NULL,
    unidades INT NOT NULL, 
    descripcion varchar2(50) not null,
    FOREIGN KEY (ID_proveedor) REFERENCES tb_proveedores (ID_proveedor)
>>>>>>> Stashed changes
);

CREATE TABLE tb_productos(
precio       NUMBER,
descripcion  VARCHAR2(100),
<<<<<<< Updated upstream
ID_producto  VARCHAR2(50),
categoria    VARCHAR2(50)
);

CREATE TABLE tb_proveedores(
numero       NUMBER,
correo       VARCHAR2(100),
ID_proveedor VARCHAR2(50),
nombre       VARCHAR2(50)

);
=======
ID_material  INT not null,
unidades     INT not null,
FOREIGN KEY (ID_material) REFERENCES tb_materiales (ID_material)
);

CREATE TABLE tb_proveedores(
ID_proveedor int primary key not null,
nombre_p    VARCHAR2(100),
numero    int not null,
correo    VARCHAR2(100)
);
drop table tb_proveedores;
>>>>>>> Stashed changes

CREATE TABLE tb_clientes(
telefono   NUMBER,
nombre     VARCHAR2(100),
ID_cliente VARCHAR2(50),
correo     VARCHAR2(50) 
);

<<<<<<< Updated upstream
CREATE TABLE tb_facturas(
cliente     VARCHAR2(100),
correo      VARCHAR(50),
fecha       VARCHAR2(100),
ID_factura  VARCHAR2(50)
);

 --- Tabla opcional , se usara en un futuro de ser necesario
 
CREATE TABLE tb_categorias(
productos   VARCHAR2(100),
materiales  VARCHAR2(100),
proveedores VARCHAR2(100),
clientes    VARCHAR2(100),
ID_categorias VARCHAR2(50)
);


commit;
=======

CREATE TABLE tb_empleados(
ID_empleado int primary key not null,
nombre VARCHAR2(100),
apellido VARCHAR2(100),
ID_puesto INT,
fecha_nacimiento DATE,
numero_ventas INT
);
---ID_puesto donde 1 es:Administrador 2 es:ventas 3 es:produccion y 4:



CREATE TABLE detalles_factura(
ID_detalle_factura int primary key not NULL,
ID_factura INT NOT NULL,
ID_producto INT not NULL,
cantidad INT NOT NULL,
FOREIGN KEY (ID_factura) REFERENCES tb_factura (ID_factura),
FOREIGN KEY (ID_producto) REFERENCES tb_productos (ID_producto)
);

create table tb_factura(
ID_factura int primary key not null,
ID_cliente int not null,
ID_empleado int not null,
correo varchar (50) not null,
fecha varchar(30) not null,
FOREIGN KEY (ID_cliente) REFERENCES tb_clientes (ID_cliente),
FOREIGN KEY (ID_empleado) REFERENCES tb_empleados (ID_empleado));

---------------esto aun falta modificarlo
----------*************************************************---------------
---Inserccion de algunos datos en las tablas (para trabajar momentaneamente)
>>>>>>> Stashed changes

---Inserccion de algunos datos en las tablas (para trabajar)

---) insert en tb_proveedores
<<<<<<< Updated upstream
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(234312253, 'info@textitech.com', 'PRO001', 'TextiTech');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2902, 'contact@fiberfab.com', 'PRO002', 'FiberFab');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'sales@stylesource.com', 'PRO003', 'StyleSource');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'info@stitchmaster.com', 'PRO004', 'StitchMaster');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'inquiries@fabrico.com', 'PRO005', 'FabriCo');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'contact@threadtech.com', 'PRO006', 'ThreadTech');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'info@fashionfusion.com', 'PRO007', 'FashionFusion');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'sales@clothcraft.com', 'PRO008', 'ClothCraft');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'info@weaveworx.com', 'PRO009', 'WeaveWorx');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'contact@trimtrend.com', 'PRO010', 'TrimTrend');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'info@fabriclink.com', 'PRO011', 'FabricLink');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'sales@designdrape.com', 'PRO012', 'DesignDrape');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'contact@threadworks.com', 'PRO013', 'ThreadWorks');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'info@sewingsupplies.com', 'PRO014', 'SewingSupplies');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'inquiries@trendytextiles.com', 'PRO015', 'TrendyTextiles');
INSERT INTO tb_proveedores(numero, correo, ID, nombre) VALUES(2, 'sales@materialmakers.com', 'PRO016', 'MaterialMakers');
=======
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(234312253, 'info@textitech.com', A12.NEXTVAL, 'TextiTech');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2902, 'contact@fiberfab.com', A12.NEXTVAL, 'FiberFab');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'sales@stylesource.com', A12.NEXTVAL, 'StyleSource');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'info@stitchmaster.com', A12.NEXTVAL, 'StitchMaster');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'inquiries@fabrico.com',A12.NEXTVAL, 'FabriCo');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'contact@threadtech.com',A12.NEXTVAL, 'ThreadTech');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'info@fashionfusion.com', A12.NEXTVAL, 'FashionFusion');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'sales@clothcraft.com', A12.NEXTVAL, 'ClothCraft');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'info@weaveworx.com', A12.NEXTVAL, 'WeaveWorx');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'contact@trimtrend.com', A12.NEXTVAL, 'TrimTrend');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'info@fabriclink.com', A12.NEXTVAL, 'FabricLink');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'sales@designdrape.com',A12.NEXTVAL, 'DesignDrape');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'contact@threadworks.com', A12.NEXTVAL, 'ThreadWorks');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'info@sewingsupplies.com', A12.NEXTVAL, 'SewingSupplies');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'inquiries@trendytextiles.com', A12.NEXTVAL, 'TrendyTextiles');
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p) 
VALUES(2, 'sales@materialmakers.com', A12.NEXTVAL, 'MaterialMakers');

select *
from tb_materiales;
----Insert de producto 
INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (10, 'Camiseta de algodón', A13.nextval, 'Camiseta básica',51,17);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (25, 'Zapatillas deportivas', A13.nextval, 'Zapatillas deportivas Nike',51,10);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (5, 'Lápiz HB', A13.nextval, 'Lápiz',52,52);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (50, 'Bolso de cuero', A13.nextval, 'Bolso de mano',53,67);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (15, 'Reloj de acero inoxidable', A13.nextval,  'Reloj plateado',54,74);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (30, 'Pantalones vaqueros', A13.nextval,  'Pantalones vaqueros ajustados',54,90);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, nom_producto,ID_material,unidades)
VALUES (12, 'Cuaderno de tapa dura', A13.nextval, 'Cuaderno de notas',55,89);


----insert de Cliente
INSERT INTO tb_clientes (telefono, nombre, ID_cliente, correo)
VALUES (1234, 'Juan',  A14.nextval, 'juan@example.com');

INSERT INTO tb_clientes (telefono, nombre, ID_cliente, correo)
VALUES (9876, 'María', A14.nextval, 'maria@example.com');

INSERT INTO tb_clientes (telefono, nombre, ID_cliente, correo)
VALUES (5555, 'Carlos', A14.nextval, 'carlos@example.com');

INSERT INTO tb_clientes (telefono, nombre, ID_cliente, correo)
VALUES (1112, 'Ana', A14.nextval, 'ana@example.com');

INSERT INTO tb_clientes (telefono, nombre, ID_cliente, correo)
VALUES (9998, 'Pedro', A14.nextval, 'pedro@example.com');


select  *
from tb_proveedores;

-----insert de Material 
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (10, A14.nextval, 'Algodón',39,61);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (15, A14.nextval, 'Caucho',31,61);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (12, A14.nextval, 'Mina',11,63);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (8, A14.nextval, 'Cuero',31,71);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (20, A14.nextval, 'Acero inoxidable',78,74);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (18, A14.nextval, 'Mezclilla',90,68);
INSERT INTO tb_materiales (UnidadPrecio, ID_material, descripcion, unidades, ID_proveedor)
VALUES (11, A14.nextval, 'Hojas',12,69);

/*Views de Clientes y Producto*/
CREATE OR REPLACE VIEW Productos_de_Materiales AS
SELECT p.nom_producto, p.descripcion, c.unidades, c.descripcion as "Descripcion del producto ", c.unidadprecio, p.precio * 5 as "Precio a pagar"
FROM tb_productos p
JOIN tb_materiales c ON p.ID_material = c.ID_material;

CREATE OR REPLACE VIEW Producto_Algodon AS
SELECT  p.nom_producto, p.descripcion, c.unidades, c.unidadprecio, p.precio * 5 as "Precio a pagar"
FROM tb_productos p
JOIN tb_materiales c ON p.ID_material = c.ID_material
where p.descripcion = 'Camiseta de algodón';

drop view compras_camisa_algodón;

create or replace view Productos as
select *
from tb_productos;

create or replace view Clientes as
select *
from tb_clientes;

select * from Clientes;

select * 
from Productos_de_Materiales;

select * from Producto_Algodon;

select * from Productos;

----Vista Material
create or Replace view Materiales as
select *
from tb_materiales;

select * from Materiales;

---Vistas de Proveedores
create or replace view Proveedores as
select *
from tb_proveedores;

select * from Proveedores;

---Vista de Factura 
CREATE VIEW Factura_Completa AS
SELECT f.ID_FACTURA, p.precio, p.descripcion, p.categoria, p.nom_producto,
       c.telefono, c.nombre, c.apellido, c.correo,
       pr.numero AS proveedor_numero, pr.correo AS proveedor_correo, pr.nombre_p AS proveedor_nombre,
       m.UnidadPrecio, m.nom
FROM tb_facturas f
INNER JOIN tb_productos p ON f.ID_producto = p.ID_producto
INNER JOIN tb_clientes c ON f.ID_cliente = c.ID_cliente
INNER JOIN tb_proveedores pr ON f.ID_proveedor = pr.ID_proveedor
INNER JOIN tb_materiales m ON f.ID_material = m.ID_material;

select * from Factura_Completa;
>>>>>>> Stashed changes
