# Funcionalidades de un CRM

Catálogo de todo lo que puede hacer un CRM, para decidir qué construimos y en qué orden.
La columna **Prioridad** indica cuándo tiene sentido abordarlo:

- **MVP**: imprescindible para que el CRM sea útil.
- **Media**: aporta mucho valor una vez que el núcleo funciona.
- **Avanzada**: para un CRM maduro o necesidades específicas.

La columna **Fase** remite a [`plan.md`](./plan.md) (— = todavía no planificado).

---

## 1. Gestión de clientes (cuentas)

El núcleo del CRM: a quién le vendemos.

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Alta, edición y baja de clientes | Personas físicas o empresas, con datos básicos | MVP | 3 |
| Datos de contacto | Email, teléfonos, web, redes sociales | MVP | 3 |
| Datos fiscales | Documento/RUC/NIF, razón social, dirección de facturación | MVP | 3 |
| Direcciones múltiples | Facturación, envío, sucursales | Media | — |
| Estado del cliente | Lead, prospecto, cliente activo, inactivo, perdido | MVP | 3 |
| Clasificación | Sector, tamaño, origen (web, referido, feria…), segmento | Media | — |
| Etiquetas (tags) | Clasificación libre y flexible | Media | 3 |
| Responsable asignado | Vendedor dueño de la cuenta | Media | 7 |
| Jerarquía de empresas | Empresa matriz y filiales | Avanzada | — |
| Búsqueda y filtros | Por nombre, email, documento, estado, etiqueta, responsable | MVP | 3 |
| Detección de duplicados | Avisar o fusionar clientes repetidos | Media | — |
| Campos personalizados | Que cada negocio defina sus propios campos | Avanzada | — |
| Notas | Comentarios libres sobre el cliente | MVP | 3 |
| Archivos adjuntos | Contratos, documentos, imágenes | Media | — |
| Importación / exportación | CSV o Excel | Media | 11 |
| Soft delete y papelera | Recuperar registros borrados | MVP | 2 |

## 2. Contactos

Las personas con las que hablamos dentro de cada cliente.

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Contactos por cliente | Varias personas por empresa | MVP | 4 |
| Cargo y rol | Decisor, influenciador, técnico, compras | Media | 4 |
| Contacto principal | Marcar el interlocutor por defecto | MVP | 4 |
| Preferencias de comunicación | Canal preferido, horario, idioma | Avanzada | — |
| Consentimientos | Aceptación de comunicaciones (protección de datos) | Media | — |
| Fechas relevantes | Cumpleaños, aniversarios | Avanzada | — |

## 3. Leads (prospección)

Personas o empresas interesadas que todavía no son clientes.

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Captura de leads | Alta manual o por API (formulario web, landing) | Media | 9 |
| Origen del lead | Campaña, canal, referido | Media | 9 |
| Calificación | Estado: nuevo, contactado, calificado, descartado | Media | 9 |
| Lead scoring | Puntuación automática según datos y comportamiento | Avanzada | — |
| Conversión | Convertir un lead en cliente + contacto + oportunidad | Media | 9 |
| Asignación automática | Reparto por zona, turno rotativo o carga de trabajo | Avanzada | — |

## 4. Seguimiento de ventas (oportunidades y pipeline)

El corazón comercial: qué se está vendiendo y en qué punto está.

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Oportunidades | Cliente, título, monto, moneda, fecha estimada de cierre | MVP | 5 |
| Pipeline con etapas | Prospecto → Calificado → Propuesta → Negociación → Ganado/Perdido | MVP | 5 |
| Etapas configurables | Cada empresa define sus etapas y su orden | Media | 5 |
| Varios pipelines | Por ejemplo, ventas nuevas y renovaciones | Avanzada | 5 |
| Probabilidad de cierre | Por etapa o manual | MVP | 5 |
| Historial de etapas | Quién movió la oportunidad, cuándo y desde dónde | MVP | 5 |
| Ganar / perder con motivo | Motivo de pérdida (precio, competencia, tiempo…) | MVP | 5 |
| Competidores | Con quién competimos en cada oportunidad | Avanzada | — |
| Vista Kanban | Oportunidades agrupadas por etapa (la API da los datos) | Media | 5 |
| Productos en la oportunidad | Líneas con producto, cantidad, precio y descuento | Media | 10 |
| Oportunidades estancadas | Alertas cuando no hay avance en X días | Media | — |

## 5. Actividades y seguimiento

Todo lo que el equipo hace con cada cliente.

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Tipos de actividad | Llamada, reunión, email, tarea, nota, visita | MVP | 6 |
| Vínculos | Asociar a cliente, contacto y/u oportunidad | MVP | 6 |
| Fecha de vencimiento y estado | Pendiente, completada, vencida | MVP | 6 |
| Asignación | Responsable de la actividad | Media | 7 |
| Recordatorios | Aviso antes del vencimiento | Media | 6 |
| Agenda / calendario | Actividades por día, semana o mes | Media | — |
| Timeline del cliente | Historial cronológico de todo lo ocurrido | MVP | 6 |
| Próxima acción | Cada oportunidad abierta debería tener una tarea siguiente | Media | 6 |
| Actividades recurrentes | Por ejemplo, llamada de seguimiento mensual | Avanzada | — |

## 6. Productos, cotizaciones y facturación

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Catálogo de productos y servicios | Código, nombre, precio, impuesto, activo/inactivo | Media | 10 |
| Listas de precios | Precios distintos por segmento o moneda | Avanzada | — |
| Cotizaciones / presupuestos | Generar una propuesta desde una oportunidad | Media | 10 |
| Versiones de la cotización | Histórico de propuestas enviadas | Avanzada | — |
| Generación de PDF | Documento listo para enviar al cliente | Avanzada | — |
| Pedidos y ventas cerradas | Registrar la venta efectiva | Avanzada | — |
| Facturación / integración contable | Facturas o integración con un ERP | Avanzada | — |
| Multimoneda | Montos en distintas monedas con tipo de cambio | Avanzada | — |

## 7. Usuarios, equipos y seguridad

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Usuarios | Alta, baja, activación | MVP | 7 |
| Autenticación | Login con JWT y refresh tokens | MVP | 7 |
| Roles | Admin, Manager, Vendedor | MVP | 7 |
| Permisos por propiedad | Cada vendedor ve lo suyo y el manager ve a su equipo | Media | 7 |
| Equipos | Agrupar vendedores bajo un manager | Media | — |
| Auditoría | Quién creó o modificó cada registro y cuándo | Media | 2 |
| Recuperación de contraseña | Por email | Media | — |
| 2FA / SSO | Doble factor, login con Google o Microsoft | Avanzada | — |
| Multi-tenant | Varias empresas usando el mismo CRM con datos aislados | Avanzada | — |

## 8. Reportes y dashboard

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Ventas por período | Ganadas por mes, trimestre o año | Media | 8 |
| Ventas por vendedor | Ranking y cumplimiento | Media | 8 |
| Embudo de conversión | Cuántas oportunidades pasan de etapa a etapa | Media | 8 |
| Forecast | Previsión ponderada: monto × probabilidad | Media | 8 |
| Motivos de pérdida | Por qué perdemos ventas | Media | 8 |
| Ciclo de venta | Tiempo medio hasta el cierre | Avanzada | 8 |
| Actividad del equipo | Llamadas y reuniones por vendedor | Media | 8 |
| Metas / cuotas | Objetivo por vendedor y período y su avance | Avanzada | — |
| Exportación de reportes | CSV, Excel | Avanzada | — |

## 9. Comunicación y marketing

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Envío de emails desde el CRM | Con plantillas | Avanzada | — |
| Registro de emails | Asociar emails enviados y recibidos al cliente | Avanzada | — |
| Plantillas | Emails o mensajes reutilizables | Avanzada | — |
| Campañas | Envíos masivos a segmentos | Avanzada | — |
| Segmentación | Listas dinámicas por filtros | Avanzada | — |
| WhatsApp / SMS | Integración con mensajería | Avanzada | — |
| Seguimiento de aperturas y clics | Métricas de campañas | Avanzada | — |

## 10. Atención al cliente (postventa)

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Tickets / casos | Incidencias o solicitudes del cliente | Avanzada | — |
| Estados y prioridades | Abierto, en curso, resuelto; prioridad baja, media o alta | Avanzada | — |
| SLA | Tiempos máximos de respuesta | Avanzada | — |
| Base de conocimiento | Respuestas frecuentes | Avanzada | — |
| Encuestas de satisfacción | NPS / CSAT | Avanzada | — |

## 11. Automatización

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| Notificaciones | Al usuario cuando le asignan algo o algo vence | Media | 11 |
| Reglas automáticas | "Si la oportunidad pasa a Propuesta, crear tarea de seguimiento" | Avanzada | — |
| Workflows | Secuencias de pasos configurables | Avanzada | — |
| Tareas programadas | Recordatorios y limpieza en segundo plano | Media | 11 |

## 12. Integraciones y plataforma

| Funcionalidad | Descripción | Prioridad | Fase |
|---|---|---|---|
| API REST documentada | OpenAPI + Scalar | MVP | 0 ✅ |
| Paginación, ordenación y filtros estándar | En todos los listados | MVP | 3 |
| Versionado de API | `/api/v1`, `/api/v2` | MVP | 1 |
| Webhooks | Avisar a sistemas externos de eventos (cliente creado, venta ganada) | Avanzada | — |
| API keys | Acceso de sistemas externos sin usuario | Avanzada | — |
| Calendario externo | Google Calendar / Outlook | Avanzada | — |
| Búsqueda global | Un buscador sobre clientes, contactos y oportunidades | Media | — |
| Rate limiting, CORS, logs | Operación segura | Media | 11 |
| Health checks y monitoreo | Estado de la API y de la BD | MVP | 1 |

---

## Resumen: qué construir primero (MVP)

1. **Clientes** con búsqueda, estado y notas.
2. **Contactos** por cliente.
3. **Oportunidades** con pipeline, etapas, probabilidad, historial y ganar/perder.
4. **Actividades** vinculadas, con vencimiento y timeline del cliente.
5. **Usuarios y roles** con JWT.
6. **Reportes básicos**: ventas por período, embudo y forecast.

Con esto se cubre el ciclo completo: **captar → seguir → vender → medir**.
El resto (leads, cotizaciones, marketing, soporte, automatización) se puede añadir en fases posteriores
sin romper la arquitectura, gracias a la separación por capas.
