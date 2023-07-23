---triggers y funciones 

-- Triggers
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio
BEFORE INSERT OR UPDATE ON tb_productos
FOR EACH ROW
BEGIN
  IF :new.nom_producto IS NULL OR :new.precio IS NULL OR :new.ID_categoria IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permiten campos vacíos en tb_productos');
  END IF;
END;

CREATE OR REPLACE TRIGGER trigger_registro_tablas
AFTER INSERT OR UPDATE OR DELETE ON tb_clientes
FOR EACH ROW
BEGIN
  INSERT INTO tb_auditoria (ID_auditoria, tabla_afectada, accion, fecha)
  VALUES (ID_auditoria_seq.NEXTVAL, 'tb_clientes', 
          CASE
            WHEN INSERTING THEN 'INSERCIÓN'
            WHEN UPDATING THEN 'ACTUALIZACIÓN'
            WHEN DELETING THEN 'ELIMINACIÓN'
          END, 
          SYSDATE);
END;

------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_registro_tablas
AFTER INSERT OR UPDATE OR DELETE ON tb_proveedores
FOR EACH ROW
BEGIN
  INSERT INTO tb_auditoria (ID_auditoria, tabla_afectada, accion, fecha)
  VALUES (ID_auditoria_seq.NEXTVAL, 'tb_proveedores', 
          CASE
            WHEN INSERTING THEN 'INSERCIÓN'
            WHEN UPDATING THEN 'ACTUALIZACIÓN'
            WHEN DELETING THEN 'ELIMINACIÓN'
          END, 
          SYSDATE);
END;

-- Nota: (Repetir el bloque para las demás tablas: tb_materiales, tb_categorias, tb_empleado, tb_factura, detalles_factura, tb_facturas.)

---------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_generar_factura
AFTER INSERT ON detalles_factura
FOR EACH ROW
BEGIN
  INSERT INTO tb_factura (ID_factura, ID_cliente, ID_empleado, correo, fecha)
  VALUES (A16.NEXTVAL, :new.ID_cliente, :new.ID_empleado, 'factura@example.com', SYSDATE);
END;


----Trigger de auditoría para todas las tablas
----nota:(nuevamente tendre que  repetir el bloque para las demás tablas: tb_proveedores, tb_productos, tb_materiales, tb_categorias, tb_empleado, tb_factura, detalles_factura, tb_facturas.)

CREATE OR REPLACE TRIGGER trigger_auditoria_general
AFTER INSERT OR UPDATE OR DELETE ON tb_clientes
FOR EACH ROW
BEGIN
  INSERT INTO tb_auditoria (ID_auditoria, tabla_afectada, accion, fecha)
  VALUES (ID_auditoria_seq.NEXTVAL, 'tb_clientes', 
          CASE
            WHEN INSERTING THEN 'INSERCIÓN'
            WHEN UPDATING THEN 'ACTUALIZACIÓN'
            WHEN DELETING THEN 'ELIMINACIÓN'
          END, 
          SYSDATE);
END;

------------------------------------------------------


-- Creación de funciones
-- Funciones

CREATE OR REPLACE FUNCTION calcular_descuento(precio INT, descuento INT) RETURN INT AS
BEGIN
  RETURN precio - (precio * descuento / 100);
END;


---------------------    

CREATE OR REPLACE FUNCTION obtener_proveedor_mas_caro RETURN VARCHAR2 AS
  v_proveedor VARCHAR2(100);
BEGIN
  SELECT nombre_p INTO v_proveedor
  FROM tb_proveedores
  ORDER BY numero DESC
  FETCH FIRST ROW ONLY;
  RETURN v_proveedor;
END;


----------------------
    
CREATE OR REPLACE FUNCTION obtener_proveedor_mas_barato RETURN VARCHAR2 AS
  v_proveedor VARCHAR2(100);
BEGIN
  SELECT nombre_p INTO v_proveedor
  FROM tb_proveedores
  ORDER BY numero ASC
  FETCH FIRST ROW ONLY;
  RETURN v_proveedor;
END;


--------------------
    
CREATE OR REPLACE FUNCTION verificar_inventario(ID_producto INT) RETURN INT AS
  v_stock INT;
BEGIN
  
  RETURN 0; --valor ejemplo
END;



---------------------------------------------------------------------------------------
----------------TRIGGER COMPRABDOS DE QUE SE CREAN CORRECTAMENTE-----------------------

-- Trigger1
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio
BEFORE INSERT OR UPDATE ON tb_productos
FOR EACH ROW
BEGIN
  IF :new.nom_producto IS NULL OR :new.precio IS NULL OR :new.ID_categoria IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permiten campos vacíos en tb_productos');
  END IF;
END;



-- Trigger2
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_proveedores
BEFORE INSERT OR UPDATE ON tb_proveedores
FOR EACH ROW
BEGIN
  IF :new.nombre_p IS NULL OR :new.numero IS NULL OR :new.correo IS NULL THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se permiten campos vacíos en tb_proveedores');
  END IF;
END;

-- Trigger3
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_materiales
BEFORE INSERT OR UPDATE ON tb_materiales
FOR EACH ROW
BEGIN
  IF :new.unidadPrecio IS NULL OR :new.ID_proveedor IS NULL OR :new.unidades IS NULL OR :new.descripcion IS NULL THEN
    RAISE_APPLICATION_ERROR(-20003, 'No se permiten campos vacíos en tb_materiales');
  END IF;
END;

-- Trigger4
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_categorias
BEFORE INSERT OR UPDATE ON tb_categorias
FOR EACH ROW
BEGIN
  IF :new.nombre_categoria IS NULL THEN
    RAISE_APPLICATION_ERROR(-20004, 'No se permite campo vacío en tb_categorias');
  END IF;
END;

-- Trigger5
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_empleados
BEFORE INSERT OR UPDATE ON tb_empleados
FOR EACH ROW
BEGIN
  IF :new.nombre IS NULL OR :new.apellido IS NULL OR :new.ID_puesto IS NULL OR :new.fecha_nacimiento IS NULL OR :new.numero_ventas IS NULL THEN
    RAISE_APPLICATION_ERROR(-20005, 'No se permiten campos vacíos en tb_empleados');
  END IF;
END;

-- Trigger6
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_factura
BEFORE INSERT OR UPDATE ON tb_factura
FOR EACH ROW
BEGIN
  IF :new.ID_cliente IS NULL OR :new.ID_empleado IS NULL OR :new.correo IS NULL OR :new.fecha IS NULL THEN
    RAISE_APPLICATION_ERROR(-20006, 'No se permiten campos vacíos en tb_factura');
  END IF;
END;

-- Trigger7
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_detalles_factura
BEFORE INSERT OR UPDATE ON detalles_factura
FOR EACH ROW
BEGIN
  IF :new.ID_factura IS NULL OR :new.ID_producto IS NULL OR :new.cantidad IS NULL THEN
    RAISE_APPLICATION_ERROR(-20007, 'No se permiten campos vacíos en detalles_factura');
  END IF;
END;

-- Trigger8
CREATE OR REPLACE TRIGGER trigger_alerta_campo_vacio_tb_facturas
BEFORE INSERT OR UPDATE ON tb_facturas
FOR EACH ROW
BEGIN
  IF :new.ID_cliente IS NULL OR :new.ID_empleado IS NULL OR :new.correo IS NULL OR :new.fecha IS NULL THEN
    RAISE_APPLICATION_ERROR(-20008, 'No se permiten campos vacíos en tb_facturas');
  END IF;
END;
