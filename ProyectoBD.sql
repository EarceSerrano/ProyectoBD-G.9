---ProyectO Base de datos.

create sequence A12
START WITH 1
INCREMENT BY 1;

create sequence A13
START WITH 20
INCREMENT BY 1;

--- secuencia ID materiales
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
drop table tb_empleados;
drop table detalles_factura;
drop table tb_clientes;
drop table tb_cat;
--- creacion de tablas

CREATE TABLE tb_materiales(
ID_material  int primary key not null,
unidadPrecio int not null,
ID_proveedor INT NOT NULL,
unidades INT NOT NULL, 
descripcion varchar2(50) not null,
FOREIGN KEY (ID_proveedor) REFERENCES tb_proveedores (ID_proveedor)
);
---descripcion = nombre (cualquiera)

CREATE TABLE tb_productos(
ID_producto  INT primary key not NULL,
nom_producto varchar2(100) not null,
precio       INT not null,
descripcion  VARCHAR2(100),
ID_categoria INT  not null,
ID_material  INT not null,
unidades     INT not null,
FOREIGN KEY (ID_material) REFERENCES tb_materiales (ID_material),
FOREIGN KEY (ID_categoria) REFERENCES tb_categorias (ID_categoria)
);


CREATE TABLE tb_proveedores(
ID_proveedor INT primary key not null,
nombre_p    VARCHAR2(100),
numero    int not null,
correo    VARCHAR2(100)
)


CREATE TABLE tb_clientes(
ID_cliente  int primary key not null,
telefono     NUMBER,
nombre    VARCHAR2(100),
correo    VARCHAR2(50)
);


--- Esta tabla se debe modificar eventualmente para mejorar el proyecto
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
ID_producto INT NOT NULL,
cantidad INT NOT NULL,
FOREIGN KEY (ID_factura) REFERENCES tb_factura (ID_factura),
FOREIGN KEY (ID_producto) REFERENCES tb_productos (ID_producto)
);



--- tb facturas y detalles , tiene error
CREATE TABLE tb_factura(
ID_factura INT primary key not NULL,
ID_cliente INT not NULL,
ID_empleado INT not NULL,
correo VARCHAR2(50)not NULL,
fecha VARCHAR2(50) not NULL,
FOREIGN KEY (ID_cliente) REFERENCES tb_clientes (ID_cliente),
FOREIGN KEY (ID_empleado) REFERENCES tb_empleados (ID_empleado)
);


CREATE TABLE tb_categorias(
ID_categoria INT primary key not NULL,
nombre_categoria VARCHAR2(50) not NULL, 
descripcion VARCHAR2(50)
);



---------------esto aun falta modificarlo
----------*************************************************---------------
---Inserccion de algunos datos en las tablas (para trabajar momentaneamente)

---Inserccion de algunos datos en las tablas (para trabajar)
---) insert en tb_proveedores

INSERT INTO tb_proveedores (ID_proveedor, nombre_p, numero, correo)
VALUES (A12.NEXTVAL, 'TextiTech', 234312253, 'info@textitech.com');
INSERT INTO tb_proveedores (ID_proveedor, nombre_p, numero, correo)
VALUES (A12.NEXTVAL, 'FiberFab', 29020823, 'contact@fiberfab.com');
INSERT INTO tb_proveedores (ID_proveedor, nombre_p, numero, correo)
VALUES (A12.NEXTVAL, 'Tstore', 234312253, 'info@tstore.com');


----Insert de producto 

INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'Camiseta estampada', 15000, 'Camiseta de algodón estampada', 1, 51, 100);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'Pantalón de mezclilla', 12000, 'Pantalón de mezclilla de corte recto', 2, 53, 50);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'Chaqueta de cuero negra', 70000, 'Chaqueta de cuero negra elegante', 3, 52, 20);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'Tacones rosa', 20000, 'Tacones color rosa', 4, 57, 80);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'Suéter de lana', 15000, 'Suéter de lana con cuello en V', 5, 55, 30);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'zapatillas vans', 20000, 'Vans', 5, 55, 45);
INSERT INTO tb_productos (ID_producto, nom_producto, precio, descripcion, ID_categoria, ID_material, unidades)
VALUES (A13.nextval, 'zapatos deportivos rojos', 18000, 'zapatos deportivos color rojo', 5, 55, 47);


----insert de Cliente
INSERT INTO tb_clientes (telefono, nombre, apellido, ID_cliente, correo)
VALUES (1234, 'Juan', 'Pérez',  A14.nextval, 'juan@example.com');




-----insert de Material 

INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 600, 1, 200, 'Algodón suave');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 2000, 1, 75, 'Cuero');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 500, 2, 300, 'Mezclilla');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 400, 3, 350, 'Poliester');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 700, 2, 100, 'Lana');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 650, 2, 230, 'Lycra');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 300, 1, 400, 'Caucho');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 1000, 1, 230, 'Piel sintetica');
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion)
VALUES (A14.nextval, 500, 2, 400, 'Material sintetico');





---Inserccion de Categorias--- **************

INSERT INTO tb_categorias (ID_categoria, nombre_categoria, descripcion)
VALUES (1, 'Suéter', 'Prendas tejidas para mantenerse abrigado');
INSERT INTO tb_categorias (ID_categoria, nombre_categoria, descripcion)
VALUES (2, 'Chaqueta', 'Prendas de abrigo para el torso');
INSERT INTO tb_categorias (ID_categoria, nombre_categoria, descripcion)
VALUES (3, 'Pantalon', 'Prendas para cubrir las piernas, usualmente mezclilla');
INSERT INTO tb_categorias (ID_categoria, nombre_categoria, descripcion)
VALUES (4, 'Camiseta', 'Prendas de manga corta y sin cuello, hechas de algodon');

---------------------------**********************************------------------------------- 
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







----**********************FUNCIONES*******************************

--- Que producto tiene mas inventario?


--- SIGUE SIN FUNCIONAR , actualmente revisando la funcion.

CREATE OR REPLACE FUNCTION mas_inventario(pCategoria IN tb_categorias.ID_categoria%TYPE) RETURN VARCHAR2 AS
    v_id_producto tb_productos.id_producto%TYPE;
    v_nom_producto tb_productos.nom_producto%TYPE;
    v_max_unidades tb_productos.unidades%TYPE := 0;
BEGIN

    FOR rec IN (SELECT p.ID_producto, p.nom_producto, p.unidades
        FROM tb_productos p
        WHERE p.ID_categoria = pCategoria) LOOP
    IF rec.unidades > v_max_unidades THEN
        v_max_unidades := rec.unidades;
        v_id_producto := rec.ID_producto;
        v_nom_producto := rec.nom_producto;
    END IF;
END LOOP;

    RETURN 'El producto con mayor cantidad de inventario en la categoría ' || pCategoria || ' es: ' || v_nom_producto;
END;


SELECT mas_inventario(5) AS resultado FROM DUAL;
















