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

 --- Tabla opcional , esta por verse
 
CREATE TABLE tb_categorias(
productos   VARCHAR2(100),
materiales  VARCHAR2(100),
proveedores VARCHAR2(100),
clientes    VARCHAR2(100),
ID_categorias VARCHAR2(50)
);

