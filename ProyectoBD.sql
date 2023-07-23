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
