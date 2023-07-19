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

drop table tb_materiales;

drop table tb_productos;

drop table tb_proveedores;

drop table tb_facturas;

CREATE TABLE tb_materiales(
UnidadPrecio int not null,
ID_material  int primary key not null,
nom varchar2 (30) not null);



CREATE TABLE tb_productos(
precio       int not null,
descripcion  VARCHAR2(100),
ID_producto  int primary key not null,
categoria    VARCHAR2(50) not null,
nom_producto varchar2(50) not null,
ID_cliente  int not null,
FOREIGN KEY (ID_cliente) REFERENCES tb_clientes (ID_cliente));



CREATE TABLE tb_proveedores(
numero    int not null,
correo    VARCHAR2(100),
ID_proveedor int primary key not null,
nombre_p    VARCHAR2(50),
ID_material int not null,
FOREIGN KEY (ID_material) REFERENCES tb_materiales (ID_material));



CREATE TABLE tb_clientes(
telefono     NUMBER,
nombre    VARCHAR2(100),
apellido varchar2(30),
ID_cliente  int primary key not null,
correo    VARCHAR2(50));

CREATE TABLE tb_facturas(
ID_FACTURA INT PRIMARY KEY NOT NULL,
ID_proveedor int not null,
FOREIGN KEY (ID_proveedor) REFERENCES tb_proveedores (ID_proveedor),
ID_cliente  int not null,
FOREIGN KEY (ID_cliente) REFERENCES tb_clientes (ID_cliente),
ID_producto int NOT NULL,
FOREIGN KEY (ID_producto) REFERENCES tb_productos (ID_producto),
ID_material  int NOT NULL,
FOREIGN KEY (ID_material) REFERENCES tb_materiales (ID_material));



 --- Tabla opcional , se usara en un futuro de ser necesario
 
CREATE TABLE tb_categorias(
productos   VARCHAR2(100),
materiales  VARCHAR2(100),
proveedores VARCHAR2(100),
clientes    VARCHAR2(100),
ID_categorias int primary key not null);


commit;

---Inserccion de algunos datos en las tablas (para trabajar)
---) insert en tb_proveedores
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(234312253, 'info@textitech.com', A12.NEXTVAL, 'TextiTech',40);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2902, 'contact@fiberfab.com', A12.NEXTVAL, 'FiberFab',46);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'sales@stylesource.com', A12.NEXTVAL, 'StyleSource',45);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'info@stitchmaster.com', A12.NEXTVAL, 'StitchMaster',43);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'inquiries@fabrico.com',A12.NEXTVAL, 'FabriCo',44);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'contact@threadtech.com',A12.NEXTVAL, 'ThreadTech',42);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'info@fashionfusion.com', A12.NEXTVAL, 'FashionFusion',40);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'sales@clothcraft.com', A12.NEXTVAL, 'ClothCraft',41);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'info@weaveworx.com', A12.NEXTVAL, 'WeaveWorx',45);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'contact@trimtrend.com', A12.NEXTVAL, 'TrimTrend',43);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'info@fabriclink.com', A12.NEXTVAL, 'FabricLink',41);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'sales@designdrape.com',A12.NEXTVAL, 'DesignDrape',46);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'contact@threadworks.com', A12.NEXTVAL, 'ThreadWorks',44);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'info@sewingsupplies.com', A12.NEXTVAL, 'SewingSupplies',41);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'inquiries@trendytextiles.com', A12.NEXTVAL, 'TrendyTextiles',45);
INSERT INTO tb_proveedores(numero, correo, ID_proveedor, nombre_p,ID_material) 
VALUES(2, 'sales@materialmakers.com', A12.NEXTVAL, 'MaterialMakers',40);


----Insert de producto 
INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (10, 'Camiseta de algodón', A13.nextval, 'Ropa', 'Camiseta básica',30);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (25, 'Zapatillas deportivas', A13.nextval, 'Calzado', 'Zapatillas deportivas Nike',31);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (5, 'Lápiz HB', A13.nextval, 'Material Escolar', 'Lápiz',32);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (50, 'Bolso de cuero', A13.nextval, 'Accesorios', 'Bolso de mano',33);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (15, 'Reloj de acero inoxidable', A13.nextval, 'Accesorios', 'Reloj plateado',34);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (30, 'Pantalones vaqueros', A13.nextval, 'Ropa', 'Pantalones vaqueros ajustados',34);

       INSERT INTO tb_productos (precio, descripcion, ID_producto, categoria, nom_producto,ID_cliente)
VALUES (12, 'Cuaderno de tapa dura', A13.nextval, 'Material Escolar', 'Cuaderno de notas',31);

----insert de Cliente
INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (1234, 'Juan', 'Pérez',  A14.nextval, 'juan@example.com');

INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (9876, 'María', 'González', A14.nextval, 'maria@example.com');

INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (5555, 'Carlos', 'López', A14.nextval, 'carlos@example.com');

INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (1112, 'Ana', 'Sánchez', A14.nextval, 'ana@example.com');

INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (9998, 'Pedro', 'Martínez', A14.nextval, 'pedro@example.com');

-----insert de Material 
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (10, A14.nextval, 'Algodón');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (15, A14.nextval, 'Caucho');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (12, A14.nextval, 'Mina');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (8, A14.nextval, 'Cuero');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (20, A14.nextval, 'Acero inoxidable');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (18, A14.nextval, 'Mezclilla');
INSERT INTO tb_materiales (UnidadPrecio, ID_material, nom)
VALUES (11, A14.nextval, 'Hojas');

/*Views de Clientes y Producto*/
CREATE OR REPLACE VIEW Compras_Clientes AS
SELECT p.nom_producto, p.descripcion, p.categoria, c.nombre, c.apellido, c.correo, p.precio * 5 as "Precio a pagar"
FROM tb_productos p
JOIN tb_clientes c ON p.ID_cliente = c.ID_cliente;

CREATE OR REPLACE VIEW compras_camisa_algodón AS
SELECT p.nom_producto, p.descripcion, p.categoria, c.nombre, c.apellido, c.correo, p.precio * 5 as "Precio a pagar"
FROM tb_productos p
JOIN tb_clientes c ON p.ID_cliente = c.ID_cliente
where p.descripcion = 'Camiseta de algodón';

create or replace view Productos as
select *
from tb_productos;

create or replace view Clientes as
select *
from tb_clientes;

select * from Clientes;

select * from Compras_Clientes;

select * from compras_camisa_algodón;

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


