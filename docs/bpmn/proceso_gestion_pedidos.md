# Modelado de Procesos de Negocio (BPMN 2.0) - Sistema GastroControl

## Proceso: Gestion de Pedidos y Control Automatico de Stock

### Pool Externo: Cliente Gastronomico (Comensal / Local)
- Evento de Inicio: Realiza un pedido mediante la interfaz web o punto de venta.
- Flujo de Mensaje: Envia los datos del pedido hacia el sistema GastroControl.
- Evento de Fin: Recibe la confirmacion y estado del pedido (o aviso de demora/sin stock).

### Pool Interno: Sistema GastroControl / Operacion del Local
- Lane 1 - Sistema Automatizado (GastroControl Backend):
  1. Evento de Mensaje (Recepcion): Recibe la solicitud del pedido.
  2. Tarea de Servicio: Valida datos del cliente y disponibilidad de insumos en base de datos.
  3. Compuerta Exclusiva (Hay stock suficiente?):
     - Camino NO: Dispara alerta automatica de stock critico al area de Compras/Almacen y envia notificacion de demora/sin stock al cliente.
     - Camino SI: Descuenta automaticamente los insumos por receta en el inventario, registra el pedido en estado En Preparacion y notifica a Cocina.
- Lane 2 - Cocina / Produccion:
  1. Tarea de Usuario: Recibe la comanda en pantalla y elabora el pedido.
  2. Tarea de Usuario: Marca el pedido como Listo para despacho.
- Lane 3 - Despacho y Facturacion:
  1. Tarea de Servicio / Usuario: Emite el comprobante fiscal y asigna el envio.
  2. Evento de Fin: Envia confirmacion final al cliente y cierra el ciclo del pedido.
