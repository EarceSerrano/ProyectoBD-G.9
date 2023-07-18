---ProyectO Base de datos.

CREATE TABLE tb_materiales(
UnidadPrecio  NUMBER,
proveedor     VARCHAR2(100),
ID_materiales VARCHAR2(50)
);

CREATE TABLE tb_productos(
precio       NUMBER,
descripcion  VARCHAR2(100),
ID_producto  VARCHAR2(50),
categoria    VARCHAR2(50)
);

CREATE TABLE tb_proveedores(
numero       NUMBER,
correo       VARCHAR2(100),
ID_proveedor VARCHAR2(50),
nombre       VARCHAR2(50)

);

CREATE TABLE tb_clientes(
telefono   NUMBER,
nombre     VARCHAR2(100),
ID_cliente VARCHAR2(50),
correo     VARCHAR2(50) 
);

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

---Inserccion de algunos datos en las tablas (para trabajar)

---) insert en tb_proveedores
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
