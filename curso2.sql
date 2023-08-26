CREATE TABLE tb_proveedores ( 
    ID_proveedor INT PRIMARY KEY, 
    Nombre VARCHAR(255), 
    Contacto VARCHAR(100) 
);

CREATE TABLE tb_materiales( 
ID_material  int primary key Not null, 
unidadPrecio int Not null, 
ID_proveedor INT NOT NULL, 
unidades INT NOT NULL,  
descripcion varchar2(50) not null, 
FOREIGN KEY (ID_proveedor) REFERENCES tb_proveedores (ID_proveedor) 
);

CREATE TABLE tb_productos ( 
    ID_producto INT PRIMARY KEY, 
    Nombre VARCHAR(255), 
    ID_material INT, 
    Unidades INT, 
    Precio DECIMAL(10, 2), 
    FOREIGN KEY (ID_material) REFERENCES tb_materiales (ID_material) 
);

CREATE TABLE tb_clientes(
ID_cliente  int primary key not null,
telefono     NUMBER,
nombre    VARCHAR2(100),
correo    VARCHAR2(50)
);

CREATE TABLE tb_empleados(
ID_empleado int primary key not null,
nombre VARCHAR2(100),
apellido VARCHAR2(100),
ID_puesto INT,
fecha_nacimiento DATE,
numero_ventas INT
);

CREATE TABLE tb_factura(
ID_factura INT primary key not NULL,
ID_cliente INT not NULL,
ID_empleado INT not NULL,
correo VARCHAR2(50)not NULL,
fecha VARCHAR2(50) not NULL,
FOREIGN KEY (ID_cliente) REFERENCES tb_clientes (ID_cliente),
FOREIGN KEY (ID_empleado) REFERENCES tb_empleados (ID_empleado)
);






--insert proveedores
INSERT INTO tb_proveedores (ID_proveedor, Nombre, Contacto) 
VALUES 
    (001,  'companySA', 'comda@gmail.com');

INSERT INTO tb_proveedores (ID_proveedor, Nombre, Contacto) 
VALUES 
    (002,  'companyYD', 'comda@gmail.com');

INSERT INTO tb_proveedores (ID_proveedor, Nombre, Contacto) 
VALUES 
    (003,  'companyFG', 'comda@gmail.com');


--insert materiales
INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion) 
VALUES 
    (0956, 100, 1, 500, 'seda');

INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion) 
VALUES 
    (0545, 150, 2, 300, 'lana');

INSERT INTO tb_materiales (ID_material, unidadPrecio, ID_proveedor, unidades, descripcion) 
VALUES 
    (0458, 200, 3, 700, 'cuero');



--insert poroductos 
INSERT INTO tb_productos (ID_producto, Nombre, ID_material, Unidades, Precio) 
VALUES 
    (0282, 'Producto 1', 0956, 100, 50.00);


INSERT INTO tb_productos (ID_producto, Nombre, ID_material, Unidades, Precio) 
VALUES 
    (0362, 'Producto 2', 0956, 50, 75.00);

INSERT INTO tb_productos (ID_producto, Nombre, ID_material, Unidades, Precio) 
VALUES 
    (0273, 'Producto 3', 0458, 30, 65.00);

INSERT INTO tb_productos (ID_producto, Nombre, ID_material, Unidades, Precio) 
VALUES 
    (0816, 'Producto 4', 0545, 150, 110.00);


-- insert empleados
INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (1, 'Juan', 'Pérez', 101, TO_DATE('1990-05-15', 'YYYY-MM-DD'), 10);

INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (2, 'María', 'García', 102, TO_DATE('1988-11-30', 'YYYY-MM-DD'), 15);

INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (3, 'Carlos', 'Martínez', 101, TO_DATE('1995-07-22', 'YYYY-MM-DD'), 8);

INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (4, 'Laura', 'López', 103, TO_DATE('1992-04-10', 'YYYY-MM-DD'), 12);

INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (5, 'Pedro', 'Rodríguez', 102, TO_DATE('1987-09-05', 'YYYY-MM-DD'), 20);

INSERT INTO tb_empleados (ID_empleado, nombre, apellido, ID_puesto, fecha_nacimiento, numero_ventas)
VALUES (6, 'Ana', 'Sánchez', 101, TO_DATE('1998-12-18', 'YYYY-MM-DD'), 6);


--insert clientes
INSERT INTO tb_clientes (ID_cliente, telefono, nombre, correo)
VALUES (1, 1234567890, 'Juan Pérez', 'juan@example.com');

INSERT INTO tb_clientes (ID_cliente, telefono, nombre, correo)
VALUES (2, 9876543210, 'María García', 'maria@example.com');

INSERT INTO tb_clientes (ID_cliente, telefono, nombre, correo)
VALUES (3, 5551234567, 'Carlos Martínez', 'carlos@example.com');

INSERT INTO tb_clientes (ID_cliente, telefono, nombre, correo)
VALUES (4, 8889990000, 'Laura López', 'laura@example.com');

INSERT INTO tb_clientes (ID_cliente, telefono, nombre, correo)
VALUES (5, 1112223333, 'Pedro Rodríguez', 'pedro@example.com');


--insert facturas
INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
VALUES (1, 1, 1, 'cliente1@example.com', '2023-08-26');

INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
VALUES (2, 2, 2, 'cliente2@example.com', '2023-08-26');

INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
VALUES (3, 3, 3, 'cliente3@example.com', '2023-08-26');

INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
VALUES (4, 4, 4, 'cliente4@example.com', '2023-08-26');

INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
VALUES (5, 5, 5, 'cliente5@example.com', '2023-08-26');







select* 
from tb_productos;

select* 
from tb_materiales 
;

select* 
from tb_productos;


CREATE VIEW vw_proveedores_materiales_productos AS

SELECT
    p.ID_proveedor,
    p.Nombre AS Proveedor,
    m.ID_material,
    m.descripcion AS Material,
    pr.ID_producto,
    pr.Nombre AS Producto,
    pr.Unidades AS UnidadesProducto,
    pr.Precio AS PrecioProducto
FROM
    tb_proveedores p
INNER JOIN
    tb_materiales m ON p.ID_proveedor = m.ID_proveedor
INNER JOIN
    tb_productos pr ON m.ID_material = pr.ID_material;



--cliente factura
CREATE VIEW vw_clientes_facturas AS
SELECT
    c.ID_cliente,
    c.nombre AS Cliente,
    c.correo AS CorreoCliente,
    f.ID_factura,
    f.fecha AS FechaFactura,
    f.correo AS CorreoFactura
FROM
    tb_clientes c
INNER JOIN
    tb_factura f ON c.ID_cliente = f.ID_cliente;


--empleados y facturas
CREATE VIEW vw_empleados_facturas AS
SELECT
    e.ID_empleado,
    e.nombre AS NombreEmpleado,
    e.apellido AS ApellidoEmpleado,
    e.numero_ventas AS NumeroVentas,
    f.ID_factura,
    f.fecha AS FechaFactura,
    f.correo AS CorreoFactura
FROM
    tb_empleados e
INNER JOIN
    tb_factura f ON e.ID_empleado = f.ID_empleado;


SELECT * FROM vw_clientes_facturas;
SELECT * FROM vw_empleados_facturas;
SELECT * FROM vw_proveedores_materiales_productos;

--cursor proveedor 
DECLARE
    CURSOR c_proveedores IS
    SELECT * FROM tb_proveedores;
    
    v_id_proveedor INT;
    v_nombre VARCHAR(255);
    v_contacto VARCHAR(100);
BEGIN
    OPEN c_proveedores;
    LOOP
        FETCH c_proveedores INTO v_id_proveedor, v_nombre, v_contacto;
        EXIT WHEN c_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_id_proveedor || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
    END LOOP;
    CLOSE c_proveedores;
END;


--cursor materiales
DECLARE
    CURSOR c_materiales IS
    SELECT * FROM tb_materiales;
    
    v_id_material INT;
    v_unidad_precio INT;
    v_id_proveedor INT;
    v_unidades INT;
    v_descripcion VARCHAR2(50);
BEGIN
    OPEN c_materiales;
    LOOP
        FETCH c_materiales INTO v_id_material, v_unidad_precio, v_id_proveedor, v_unidades, v_descripcion;
        EXIT WHEN c_materiales%NOTFOUND;
        -- Aquí puedes realizar operaciones con los valores obtenidos del cursor
        -- Por ejemplo, imprimir los valores
        DBMS_OUTPUT.PUT_LINE('ID_material: ' || v_id_material || ', Unidad_Precio: ' || v_unidad_precio || ', ID_proveedor: ' || v_id_proveedor || ', Unidades: ' || v_unidades || ', Descripcion: ' || v_descripcion);
    END LOOP;
    CLOSE c_materiales;
END;


SELECT
    p.ID_proveedor,
    p.Nombre AS Proveedor,
    m.ID_material,
    m.descripcion AS Material,
    pr.ID_producto,
    pr.Nombre AS Producto,
    pr.Unidades AS UnidadesProducto,
    pr.Precio AS PrecioProducto
FROM
    tb_proveedores p
INNER JOIN
    tb_materiales m ON p.ID_proveedor = m.ID_proveedor
INNER JOIN
    tb_productos pr ON m.ID_material = pr.ID_material;



--cliente factura
CREATE VIEW vw_clientes_facturas AS
SELECT
    c.ID_cliente,
    c.nombre AS Cliente,
    c.correo AS CorreoCliente,
    f.ID_factura,
    f.fecha AS FechaFactura,
    f.correo AS CorreoFactura
FROM
    tb_clientes c
INNER JOIN
    tb_factura f ON c.ID_cliente = f.ID_cliente;


--empleados y facturas
CREATE VIEW vw_empleados_facturas AS
SELECT
    e.ID_empleado,
    e.nombre AS NombreEmpleado,
    e.apellido AS ApellidoEmpleado,
    e.numero_ventas AS NumeroVentas,
    f.ID_factura,
    f.fecha AS FechaFactura,
    f.correo AS CorreoFactura
FROM
    tb_empleados e
INNER JOIN
    tb_factura f ON e.ID_empleado = f.ID_empleado;


SELECT * FROM vw_clientes_facturas;
SELECT * FROM vw_empleados_facturas;
SELECT * FROM vw_proveedores_materiales_productos;

--cursor proveedor 
DECLARE
    CURSOR c_proveedores IS
    SELECT * FROM tb_proveedores;
    
    v_id_proveedor INT;
    v_nombre VARCHAR(255);
    v_contacto VARCHAR(100);
BEGIN
    OPEN c_proveedores;
    LOOP
        FETCH c_proveedores INTO v_id_proveedor, v_nombre, v_contacto;
        EXIT WHEN c_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_id_proveedor || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
    END LOOP;
    CLOSE c_proveedores;
END;


--cursor materiales
DECLARE
    CURSOR c_materiales IS
    SELECT * FROM tb_materiales;
    
    v_id_material INT;
    v_unidad_precio INT;
    v_id_proveedor INT;
    v_unidades INT;
    v_descripcion VARCHAR2(50);
BEGIN
    OPEN c_materiales;
    LOOP
        FETCH c_materiales INTO v_id_material, v_unidad_precio, v_id_proveedor, v_unidades, v_descripcion;
        EXIT WHEN c_materiales%NOTFOUND;
        -- Aquí puedes realizar operaciones con los valores obtenidos del cursor
        -- Por ejemplo, imprimir los valores
        DBMS_OUTPUT.PUT_LINE('ID_material: ' || v_id_material || ', Unidad_Precio: ' || v_unidad_precio || ', ID_proveedor: ' || v_id_proveedor || ', Unidades: ' || v_unidades || ', Descripcion: ' || v_descripcion);
    END LOOP;
    CLOSE c_materiales;
END;

--cursor proveedor 
DECLARE
    CURSOR c_proveedores IS
    SELECT * FROM tb_proveedores;
    
    v_id_proveedor INT;
    v_nombre VARCHAR(255);
    v_contacto VARCHAR(100);
BEGIN
    OPEN c_proveedores;
    LOOP
        FETCH c_proveedores INTO v_id_proveedor, v_nombre, v_contacto;
        EXIT WHEN c_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_id_proveedor || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
    END LOOP;
    CLOSE c_proveedores;
END;



--cursor factura
DECLARE
    CURSOR c_facturas IS
        SELECT f.ID_factura, f.ID_cliente, f.ID_empleado, f.correo, f.fecha,
               c.nombre AS nombre_cliente, e.nombre AS nombre_empleado
        FROM tb_factura f
        JOIN tb_clientes c ON f.ID_cliente = c.ID_cliente
        JOIN tb_empleados e ON f.ID_empleado = e.ID_empleado;
    
    v_ID_factura tb_factura.ID_factura%TYPE;
    v_ID_cliente tb_factura.ID_cliente%TYPE;
    v_ID_empleado tb_factura.ID_empleado%TYPE;
    v_correo tb_factura.correo%TYPE;
    v_fecha tb_factura.fecha%TYPE;
    v_nombre_cliente tb_clientes.nombre%TYPE;
    v_nombre_empleado tb_empleados.nombre%TYPE;
BEGIN

    OPEN c_facturas;
    

    LOOP
  
        FETCH c_facturas INTO v_ID_factura, v_ID_cliente, v_ID_empleado, v_correo, v_fecha,
                               v_nombre_cliente, v_nombre_empleado;
        

        EXIT WHEN c_facturas%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || v_ID_factura || ', Cliente: ' || v_nombre_cliente ||
                             ', Empleado: ' || v_nombre_empleado || ', Correo: ' || v_correo ||
                             ', Fecha: ' || v_fecha);
    END LOOP;
    

    CLOSE c_facturas;
END;

--cursor clientes
DECLARE
    CURSOR c_clientes IS
        SELECT ID_cliente, telefono, nombre, correo
        FROM tb_clientes;
    v_ID_cliente tb_clientes.ID_cliente%TYPE;
    v_telefono tb_clientes.telefono%TYPE;
    v_nombre tb_clientes.nombre%TYPE;
    v_correo tb_clientes.correo%TYPE;
BEGIN

    OPEN c_clientes;
    LOOP
        FETCH c_clientes INTO v_ID_cliente, v_telefono, v_nombre, v_correo;
        
        EXIT WHEN c_clientes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || v_ID_cliente || ', Teléfono: ' || v_telefono ||
                             ', Nombre: ' || v_nombre || ', Correo: ' || v_correo);
    END LOOP;
    CLOSE c_clientes;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        CLOSE c_clientes; 
END;
--triggers factura
CREATE OR REPLACE TRIGGER actualizar_unidades_materiales
BEFORE INSERT ON tb_factura
FOR EACH ROW
BEGIN
    UPDATE tb_materiales
    SET unidades = unidades - :NEW.Unidades
    WHERE ID_material = (SELECT ID_material FROM tb_productos WHERE ID_producto = :NEW.ID_producto);
END;


--trigger de proveedores
CREATE TRIGGER tr_actualizacion_proveedores
BEFORE UPDATE ON tb_proveedores
FOR EACH ROW
BEGIN
    IF OLD.Nombre != NEW.Nombre OR OLD.Contacto != NEW.Contacto THEN
        INSERT INTO tb_proveedores_historial (ID_proveedor, Nombre_anterior, Contacto_anterior, Fecha_actualizacion)
        VALUES (OLD.ID_proveedor, OLD.Nombre, OLD.Contacto, NOW());
    END IF;
END;

--trigger de materiales
CREATE TRIGGER tr_actualizacion_materiales
BEFORE UPDATE ON tb_materiales
FOR EACH ROW
BEGIN
    IF OLD.unidadPrecio != NEW.unidadPrecio OR OLD.unidades != NEW.unidades THEN
        INSERT INTO tb_materiales_historial (ID_material, Precio_anterior, Unidades_anterior, Fecha_actualizacion)
        VALUES (OLD.ID_material, OLD.unidadPrecio, OLD.unidades, NOW());
    END IF;
END;

--trigger de productos
CREATE TRIGGER tr_actualizacion_productos
BEFORE UPDATE ON tb_productos
FOR EACH ROW
BEGIN
    IF OLD.Precio != NEW.Precio OR OLD.Unidades != NEW.Unidades THEN
        INSERT INTO tb_productos_historial (ID_producto, Precio_anterior, Unidades_anterior, Fecha_actualizacion)
        VALUES (OLD.ID_producto, OLD.Precio, OLD.Unidades, NOW());
    END IF;
END;

--cursor proveedor 
DECLARE
    CURSOR c_proveedores IS
    SELECT * FROM tb_proveedores;
    
    v_id_proveedor INT;
    v_nombre VARCHAR(255);
    v_contacto VARCHAR(100);
BEGIN
    OPEN c_proveedores;
    LOOP
        FETCH c_proveedores INTO v_id_proveedor, v_nombre, v_contacto;
        EXIT WHEN c_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_id_proveedor || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
    END LOOP;
    CLOSE c_proveedores;
END;



--cursor factura
DECLARE
    CURSOR c_facturas IS
        SELECT f.ID_factura, f.ID_cliente, f.ID_empleado, f.correo, f.fecha,
               c.nombre AS nombre_cliente, e.nombre AS nombre_empleado
        FROM tb_factura f
        JOIN tb_clientes c ON f.ID_cliente = c.ID_cliente
        JOIN tb_empleados e ON f.ID_empleado = e.ID_empleado;
    
    v_ID_factura tb_factura.ID_factura%TYPE;
    v_ID_cliente tb_factura.ID_cliente%TYPE;
    v_ID_empleado tb_factura.ID_empleado%TYPE;
    v_correo tb_factura.correo%TYPE;
    v_fecha tb_factura.fecha%TYPE;
    v_nombre_cliente tb_clientes.nombre%TYPE;
    v_nombre_empleado tb_empleados.nombre%TYPE;
BEGIN

    OPEN c_facturas;
    

    LOOP
  
        FETCH c_facturas INTO v_ID_factura, v_ID_cliente, v_ID_empleado, v_correo, v_fecha,
                               v_nombre_cliente, v_nombre_empleado;
        

        EXIT WHEN c_facturas%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || v_ID_factura || ', Cliente: ' || v_nombre_cliente ||
                             ', Empleado: ' || v_nombre_empleado || ', Correo: ' || v_correo ||
                             ', Fecha: ' || v_fecha);
    END LOOP;
    

    CLOSE c_facturas;
END;

--cursor clientes
DECLARE
    CURSOR c_clientes IS
        SELECT ID_cliente, telefono, nombre, correo
        FROM tb_clientes;
    v_ID_cliente tb_clientes.ID_cliente%TYPE;
    v_telefono tb_clientes.telefono%TYPE;
    v_nombre tb_clientes.nombre%TYPE;
    v_correo tb_clientes.correo%TYPE;
BEGIN

    OPEN c_clientes;
    LOOP
        FETCH c_clientes INTO v_ID_cliente, v_telefono, v_nombre, v_correo;
        
        EXIT WHEN c_clientes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || v_ID_cliente || ', Teléfono: ' || v_telefono ||
                             ', Nombre: ' || v_nombre || ', Correo: ' || v_correo);
    END LOOP;
    CLOSE c_clientes;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        CLOSE c_clientes; 
END;


DECLARE
    v_ID_proveedor tb_proveedores.ID_proveedor%TYPE;
    
    CURSOR cursor_id_proveedores IS
    SELECT ID_proveedor
    FROM tb_proveedores;
    
BEGIN
    OPEN cursor_id_proveedores;
    
    LOOP
        FETCH cursor_id_proveedores INTO v_ID_proveedor;
        EXIT WHEN cursor_id_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_ID_proveedor);
    END LOOP;
    
    CLOSE cursor_id_proveedores;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_proveedores%ISOPEN THEN
            CLOSE cursor_id_proveedores;
        END IF;
        RAISE;
END;

DECLARE
    v_Nombre tb_proveedores.Nombre%TYPE;
    
    CURSOR cursor_nombres_proveedores IS
    SELECT Nombre
    FROM tb_proveedores;
    
BEGIN
    OPEN cursor_nombres_proveedores;
    
    LOOP
        FETCH cursor_nombres_proveedores INTO v_Nombre;
        EXIT WHEN cursor_nombres_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_Nombre);
    END LOOP;
    
    CLOSE cursor_nombres_proveedores;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_nombres_proveedores%ISOPEN THEN
            CLOSE cursor_nombres_proveedores;
        END IF;
        RAISE;
END;

DECLARE
    v_Contacto tb_proveedores.Contacto%TYPE;
    
    CURSOR cursor_contactos_proveedores IS
    SELECT Contacto
    FROM tb_proveedores;
    
BEGIN
    OPEN cursor_contactos_proveedores;
    
    LOOP
        FETCH cursor_contactos_proveedores INTO v_Contacto;
        EXIT WHEN cursor_contactos_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Contacto: ' || v_Contacto);
    END LOOP;
    
    CLOSE cursor_contactos_proveedores;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_contactos_proveedores%ISOPEN THEN
            CLOSE cursor_contactos_proveedores;
        END IF;
        RAISE;
END;

--cursur materiales
DECLARE
    CURSOR cursor_id_material IS
    SELECT ID_material
    FROM tb_materiales;
    
    v_ID_material tb_materiales.ID_material%TYPE;
BEGIN
    OPEN cursor_id_material;
    
    LOOP
        FETCH cursor_id_material INTO v_ID_material;
        EXIT WHEN cursor_id_material%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_material: ' || v_ID_material);
    END LOOP;
    
    CLOSE cursor_id_material;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_material%ISOPEN THEN
            CLOSE cursor_id_material;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_unidad_precio IS
    SELECT unidadPrecio
    FROM tb_materiales;
    
    v_unidad_precio tb_materiales.unidadPrecio%TYPE;
BEGIN
    OPEN cursor_unidad_precio;
    
    LOOP
        FETCH cursor_unidad_precio INTO v_unidad_precio;
        EXIT WHEN cursor_unidad_precio%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('unidadPrecio: ' || v_unidad_precio);
    END LOOP;
    
    CLOSE cursor_unidad_precio;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_unidad_precio%ISOPEN THEN
            CLOSE cursor_unidad_precio;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_id_proveedor IS
    SELECT ID_proveedor
    FROM tb_materiales;
    
    v_ID_proveedor tb_materiales.ID_proveedor%TYPE;
BEGIN
    OPEN cursor_id_proveedor;
    
    LOOP
        FETCH cursor_id_proveedor INTO v_ID_proveedor;
        EXIT WHEN cursor_id_proveedor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_proveedor: ' || v_ID_proveedor);
    END LOOP;
    
    CLOSE cursor_id_proveedor;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_proveedor%ISOPEN THEN
            CLOSE cursor_id_proveedor;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_unidades IS
    SELECT unidades
    FROM tb_materiales;
    
    v_unidades tb_materiales.unidades%TYPE;
BEGIN
    OPEN cursor_unidades;
    
    LOOP
        FETCH cursor_unidades INTO v_unidades;
        EXIT WHEN cursor_unidades%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('unidades: ' || v_unidades);
    END LOOP;
    
    CLOSE cursor_unidades;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_unidades%ISOPEN THEN
            CLOSE cursor_unidades;
        END IF;
        RAISE;
END;

--cursor producto 
DECLARE
    CURSOR cursor_id_producto IS
    SELECT ID_producto
    FROM tb_productos;
    
    v_ID_producto tb_productos.ID_producto%TYPE;
BEGIN
    OPEN cursor_id_producto;
    
    LOOP
        FETCH cursor_id_producto INTO v_ID_producto;
        EXIT WHEN cursor_id_producto%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_producto: ' || v_ID_producto);
    END LOOP;
    
    CLOSE cursor_id_producto;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_producto%ISOPEN THEN
            CLOSE cursor_id_producto;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_nombre_producto IS
    SELECT Nombre
    FROM tb_productos;
    
    v_nombre tb_productos.Nombre%TYPE;
BEGIN
    OPEN cursor_nombre_producto;
    
    LOOP
        FETCH cursor_nombre_producto INTO v_nombre;
        EXIT WHEN cursor_nombre_producto%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    END LOOP;
    
    CLOSE cursor_nombre_producto;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_nombre_producto%ISOPEN THEN
            CLOSE cursor_nombre_producto;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_id_material_producto IS
    SELECT ID_material
    FROM tb_productos;
    
    v_ID_material tb_productos.ID_material%TYPE;
BEGIN
    OPEN cursor_id_material_producto;
    
    LOOP
        FETCH cursor_id_material_producto INTO v_ID_material;
        EXIT WHEN cursor_id_material_producto%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_material: ' || v_ID_material);
    END LOOP;
    
    CLOSE cursor_id_material_producto;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_material_producto%ISOPEN THEN
            CLOSE cursor_id_material_producto;
        END IF;
        RAISE;
END;


DECLARE
    CURSOR cursor_unidades_producto IS
    SELECT Unidades
    FROM tb_productos;
    
    v_unidades tb_productos.Unidades%TYPE;
BEGIN
    OPEN cursor_unidades_producto;
    
    LOOP
        FETCH cursor_unidades_producto INTO v_unidades;
        EXIT WHEN cursor_unidades_producto%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Unidades: ' || v_unidades);
    END LOOP;
    
    CLOSE cursor_unidades_producto;
    
    EXCEPTION
    WHEN OTHERS THEN
        IF cursor_unidades_producto%ISOPEN THEN
            CLOSE cursor_unidades_producto;
        END IF;
        RAISE;
END;


DECLARE
    CURSOR cursor_precio_producto IS
    SELECT Precio
    FROM tb_productos;
    
    v_precio tb_productos.Precio%TYPE;
BEGIN
    OPEN cursor_precio_producto;
    
    LOOP
        FETCH cursor_precio_producto INTO v_precio;
        EXIT WHEN cursor_precio_producto%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    END LOOP;
    
    CLOSE cursor_precio_producto;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_precio_producto%ISOPEN THEN
            CLOSE cursor_precio_producto;
        END IF;
        RAISE;
END;


--cursor empleados
DECLARE
    CURSOR cursor_id_empleado IS
    SELECT ID_empleado
    FROM tb_empleados;
    
    v_ID_empleado tb_empleados.ID_empleado%TYPE;
BEGIN
    OPEN cursor_id_empleado;
    
    LOOP
        FETCH cursor_id_empleado INTO v_ID_empleado;
        EXIT WHEN cursor_id_empleado%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID_empleado: ' || v_ID_empleado);
    END LOOP;
    
    CLOSE cursor_id_empleado;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_empleado%ISOPEN THEN
            CLOSE cursor_id_empleado;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_nombre_empleado IS
    SELECT nombre
    FROM tb_empleados;
    
    v_nombre tb_empleados.nombre%TYPE;
BEGIN
    OPEN cursor_nombre_empleado;
    
    LOOP
        FETCH cursor_nombre_empleado INTO v_nombre;
        EXIT WHEN cursor_nombre_empleado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    END LOOP;
    
    CLOSE cursor_nombre_empleado;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_nombre_empleado%ISOPEN THEN
            CLOSE cursor_nombre_empleado;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_id_puesto_empleado IS
    SELECT ID_puesto
    FROM tb_empleados;
    
    v_ID_puesto tb_empleados.ID_puesto%TYPE;
BEGIN
    OPEN cursor_id_puesto_empleado;
    
    LOOP
        FETCH cursor_id_puesto_empleado INTO v_ID_puesto;
        EXIT WHEN cursor_id_puesto_empleado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_puesto: ' || v_ID_puesto);
    END LOOP;
    
    CLOSE cursor_id_puesto_empleado;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_puesto_empleado%ISOPEN THEN
            CLOSE cursor_id_puesto_empleado;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_numero_ventas_empleado IS
    SELECT numero_ventas
    FROM tb_empleados;
    
    v_numero_ventas tb_empleados.numero_ventas%TYPE;
BEGIN
    OPEN cursor_numero_ventas_empleado;
    
    LOOP
        FETCH cursor_numero_ventas_empleado INTO v_numero_ventas;
        EXIT WHEN cursor_numero_ventas_empleado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Numero de Ventas: ' || v_numero_ventas);
    END LOOP;
    
    CLOSE cursor_numero_ventas_empleado;
    
EXCEPTION
    WHEN OTHERS THEN
    IF cursor_numero_ventas_empleado%ISOPEN THEN
            CLOSE cursor_numero_ventas_empleado;
        END IF;
        RAISE;
END;


IF cursor_numero_ventas_empleado%ISOPEN THEN
            CLOSE cursor_numero_ventas_empleado;
        END IF;
        RAISE;
END;


IF cursor_numero_ventas_empleado%ISOPEN THEN
            CLOSE cursor_numero_ventas_empleado;
        END IF;
        RAISE;
END;


--cursor factura
DECLARE
    CURSOR cursor_datos_factura IS
    SELECT *
    FROM tb_factura;
    
    v_ID_factura tb_factura.ID_factura%TYPE;
    v_ID_cliente tb_factura.ID_cliente%TYPE;
    v_ID_empleado tb_factura.ID_empleado%TYPE;
    v_correo tb_factura.correo%TYPE;
    v_fecha tb_factura.fecha%TYPE;
BEGIN
    OPEN cursor_datos_factura;
    
    LOOP
        FETCH cursor_datos_factura INTO v_ID_factura, v_ID_cliente, v_ID_empleado, v_correo, v_fecha;
        EXIT WHEN cursor_datos_factura%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_factura: ' || v_ID_factura);
        DBMS_OUTPUT.PUT_LINE('ID_cliente: ' || v_ID_cliente);
        DBMS_OUTPUT.PUT_LINE('ID_empleado: ' || v_ID_empleado);
        DBMS_OUTPUT.PUT_LINE('Correo: ' || v_correo);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_fecha);
    END LOOP;
    
    CLOSE cursor_datos_factura;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_datos_factura%ISOPEN THEN
            CLOSE cursor_datos_factura;
        END IF;
        RAISE;
END;


--cursro cliente
DECLARE
    CURSOR cursor_id_cliente IS
    SELECT ID_cliente
    FROM tb_clientes;
    
    v_ID_cliente tb_clientes.ID_cliente%TYPE;
BEGIN
    OPEN cursor_id_cliente;
    
    LOOP
        FETCH cursor_id_cliente INTO v_ID_cliente;
        EXIT WHEN cursor_id_cliente%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_cliente: ' || v_ID_cliente);
    END LOOP;
    
    CLOSE cursor_id_cliente;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_id_cliente%ISOPEN THEN
            CLOSE cursor_id_cliente;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_telefono_cliente IS
    SELECT telefono
    FROM tb_clientes;
    
    v_telefono tb_clientes.telefono%TYPE;
BEGIN
    OPEN cursor_telefono_cliente;
    
    LOOP
        FETCH cursor_telefono_cliente INTO v_telefono;
        EXIT WHEN cursor_telefono_cliente%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || v_telefono);
    END LOOP;
    
    CLOSE cursor_telefono_cliente;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_telefono_cliente%ISOPEN THEN
            CLOSE cursor_telefono_cliente;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_nombre_cliente IS
    SELECT nombre
    FROM tb_clientes;
    
    v_nombre tb_clientes.nombre%TYPE;
BEGIN
    OPEN cursor_nombre_cliente;
    
    LOOP
        FETCH cursor_nombre_cliente INTO v_nombre;
        EXIT WHEN cursor_nombre_cliente%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    END LOOP;
    
    CLOSE cursor_nombre_cliente;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_nombre_cliente%ISOPEN THEN
            CLOSE cursor_nombre_cliente;
        END IF;
        RAISE;
END;

DECLARE
    CURSOR cursor_correo_cliente IS
    SELECT correo
    FROM tb_clientes;
    
    v_correo tb_clientes.correo%TYPE;
BEGIN
    OPEN cursor_correo_cliente;
    
    LOOP
        FETCH cursor_correo_cliente INTO v_correo;
        EXIT WHEN cursor_correo_cliente%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Correo: ' || v_correo);
    END LOOP;
    
     CLOSE cursor_correo_cliente;
    
EXCEPTION
    WHEN OTHERS THEN
        IF cursor_correo_cliente%ISOPEN THEN
            CLOSE cursor_correo_cliente;
        END IF;
        RAISE;
END;


---vistas -------
CREATE VIEW vw_proveedores AS
SELECT * FROM tb_proveedores;

CREATE VIEW vw_productos AS
SELECT * FROM tb_productos;

CREATE VIEW vw_materiales AS
SELECT * FROM tb_materiales;

CREATE VIEW vw_clientes AS
SELECT * FROM tb_clientes;

CREATE VIEW vw_empleados AS
SELECT * FROM tb_empleados;

CREATE VIEW vw_factura AS
SELECT * FROM tb_factura;

CREATE VIEW vw_proveedores_materiales AS
SELECT
    p.ID_proveedor,
    p.Nombre AS Proveedor,
    p.Contacto AS ContactoProveedor,
    m.ID_material,
    m.unidadPrecio,
    m.unidades,
    m.descripcion AS DescripcionMaterial
FROM
    tb_proveedores p
INNER JOIN
    tb_materiales m ON p.ID_proveedor = m.ID_proveedor;

CREATE VIEW vw_productos_materiales_proveedores AS
SELECT
    pr.ID_proveedor,
    pr.Nombre AS Proveedor,
    m.ID_material,
    m.unidadPrecio,
    m.unidades,
    m.descripcion AS DescripcionMaterial,
    p.ID_producto,
    p.Nombre AS Producto,
    p.Unidades AS UnidadesProducto,
    p.Precio
FROM
    tb_proveedores pr
INNER JOIN
    tb_materiales m ON pr.ID_proveedor = m.ID_proveedor
INNER JOIN
    tb_productos p ON m.ID_material = p.ID_material;

CREATE VIEW vw_empleados_facturas AS
SELECT
    e.ID_empleado,
    e.nombre AS Empleado,
    e.apellido,
    f.ID_factura,
    f.fecha AS FechaFactura,
    f.correo AS CorreoFactura
FROM
    tb_empleados e
INNER JOIN
    tb_factura f ON e.ID_empleado = f.ID_empleado;


--triggers proveedores
CREATE TRIGGER tr_after_update_proveedores
AFTER UPDATE ON tb_proveedores
FOR EACH ROW
BEGIN
    INSERT INTO log_actualizaciones_proveedores (ID_proveedor, Fecha_actualizacion)
    VALUES (NEW.ID_proveedor, NOW());
END;


CREATE TRIGGER tr_after_insert_or_update_proveedores
AFTER INSERT OR UPDATE ON tb_proveedores
FOR EACH ROW
BEGIN
    IF NEW.Nombre <> OLD.Nombre OR NEW.Contacto <> OLD.Contacto THEN
        INSERT INTO notificaciones_proveedores (ID_proveedor, Mensaje)
        VALUES (NEW.ID_proveedor, 'Se ha actualizado la información del proveedor.');
    END IF;
END;

CREATE TRIGGER tr_before_delete_proveedores
BEFORE DELETE ON tb_proveedores
FOR EACH ROW
BEGIN
    DECLARE num_productos INT;
    SELECT COUNT(*) INTO num_productos FROM tb_productos WHERE ID_proveedor = OLD.ID_proveedor;
    
    IF num_productos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede borrar el proveedor. Tiene productos asociados.';
    END IF;
END;




--triggers productos
--tabla nueva
CREATE TABLE log_actualizaciones_productos (
    ID_producto INT,
    Fecha_actualizacion DATE
);

CREATE TABLE notificaciones_productos (
    ID_producto INT,
    Mensaje VARCHAR(255)
);

CREATE TABLE registros_borrados_productos (
    ID_producto INT,
    Fecha_borrado DATE
);

CREATE OR REPLACE TRIGGER tr_after_update_productos
AFTER UPDATE ON tb_productos
FOR EACH ROW
BEGIN
    INSERT INTO log_actualizaciones_productos (ID_producto, Fecha_actualizacion)
    VALUES (:NEW.ID_producto, SYSDATE);
END;

CREATE OR REPLACE TRIGGER tr_after_insert_or_update_productos
AFTER INSERT OR UPDATE ON tb_productos
FOR EACH ROW
BEGIN
    IF :NEW.Unidades <> :OLD.Unidades OR :NEW.Precio <> :OLD.Precio THEN
        INSERT INTO notificaciones_productos (ID_producto, Mensaje)
        VALUES (:NEW.ID_producto, 'Se ha actualizado la información del producto.');
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_before_delete_productos
BEFORE DELETE ON tb_productos
FOR EACH ROW
BEGIN
    INSERT INTO registros_borrados_productos (ID_producto, Fecha_borrado)
    VALUES (:OLD.ID_producto, SYSDATE);
END;


--trigger materiales
CREATE OR REPLACE TRIGGER tr_after_update_materiales
AFTER UPDATE ON tb_materiales
FOR EACH ROW
BEGIN
    INSERT INTO log_actualizaciones_materiales (ID_material, Fecha_actualizacion)
    VALUES (:NEW.ID_material, SYSDATE);
END;

CREATE OR REPLACE TRIGGER tr_after_insert_or_update_materiales
AFTER INSERT OR UPDATE ON tb_materiales
FOR EACH ROW
BEGIN
    IF :NEW.unidadPrecio <> :OLD.unidadPrecio OR :NEW.unidades <> :OLD.unidades THEN
        DBMS_OUTPUT.PUT_LINE('Se ha actualizado la información del material.');
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_before_delete_materiales
BEFORE DELETE ON tb_materiales
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se está realizando un borrado en tb_materiales.');
END;




--triggers clientes
CREATE OR REPLACE TRIGGER tr_after_update_clientes
AFTER UPDATE ON tb_clientes
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se ha actualizado un cliente.');
END;

CREATE OR REPLACE TRIGGER tr_after_insert_or_update_clientes
AFTER INSERT OR UPDATE ON tb_clientes
FOR EACH ROW
BEGIN
    IF :NEW.telefono <> :OLD.telefono OR :NEW.correo <> :OLD.correo THEN
        DBMS_OUTPUT.PUT_LINE('Se ha actualizado la información del cliente.');
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_before_delete_clientes
BEFORE DELETE ON tb_clientes
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se está realizando un borrado en tb_clientes.');
    -- O realizar cualquier otra acción que desees
END;



--triggers empleado
CREATE OR REPLACE TRIGGER tr_after_update_empleados
AFTER UPDATE ON tb_empleados
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se ha actualizado un empleado.');
END;

CREATE OR REPLACE TRIGGER tr_after_insert_or_update_empleados
AFTER INSERT OR UPDATE ON tb_empleados
FOR EACH ROW
BEGIN
    IF :NEW.numero_ventas <> :OLD.numero_ventas THEN
        DBMS_OUTPUT.PUT_LINE('Se ha actualizado el número de ventas del empleado.');
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_before_delete_empleados
BEFORE DELETE ON tb_empleados
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se está realizando un borrado en tb_empleados.');
END;

--trigger cliente
CREATE OR REPLACE TRIGGER tr_cliente_insert
AFTER INSERT ON tb_clientes
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo cliente insertado. ID Cliente: ' || :NEW.ID_cliente ||
                         ', Nombre: ' || :NEW.nombre || ', Correo: ' || :NEW.correo);
END;

CREATE TABLE tabla_diccionario (
    table_name VARCHAR2(50),
    column_name VARCHAR2(50),
    nullable VARCHAR2(1),
    constraint_type VARCHAR2(50),
    comentarios VARCHAR2(100)
);


INSERT INTO tabla_diccionario (table_name, column_name, nullable, constraint_type, comentarios)
VALUES ('Clientes', 'ID_cliente', 'N', 'Primary Key', 'numero de identificacion de los cliemtes');

INSERT INTO tabla_diccionario (table_name, column_name, nullable, constraint_type, comentarios)
VALUES ('Clientes', 'telefono', 'Y', '', 'telefonod de los clientes');

INSERT INTO tabla_diccionario (table_name, column_name, nullable, constraint_type, comentarios)
VALUES ('Clientes', 'nombre', 'Y', '', 'nombre de los clientes');

INSERT INTO tabla_diccionario (table_name, column_name, nullable, constraint_type, comentarios)
VALUES ('Clientes', 'correo', 'Y', '', 'correo de contactode los clientes');

SELECT * FROM tabla_diccionario;

