-- Diccionario de Datos Inicial - Sistema GastroControl (DevCraft Solutions)

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY,
    razon_social VARCHAR(150) NOT NULL,
    cuit VARCHAR(20) NOT NULL,
    estado_cuenta BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pedido (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    fecha_emision VARCHAR(40) NOT NULL,
    estado_pedido VARCHAR(40) NOT NULL,
    monto_total FLOAT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE insumo (
    id_insumo INTEGER PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    stock_actual FLOAT NOT NULL,
    stock_minimo FLOAT NOT NULL
);
