# Plan de trabajo — CRM API

Desarrollo incremental. Referencias: [`AGENTS.md`](./AGENTS.md) (convenciones) · [`funcionalidades.md`](./funcionalidades.md) (catálogo completo).

**Definición de hecho (todas las fases):** `dotnet build` sin warnings · tests en verde · `docker compose up --build` OK · endpoints visibles en Scalar · `crmapi.http` actualizado · casillas marcadas.

---

## Fase 0 — Infraestructura ✅
- [x] Minimal API .NET 10, `AGENTS.md`, `Dockerfile`, `docker-compose.yml` (api + mysql 8.4), `.env`
- [x] OpenAPI + Scalar en `/scalar`

## Fase 1 — Esqueleto Clean Architecture
- [ ] `CrmApi.slnx` + `src/CrmApi.{Domain,Application,Infrastructure,Api}` + `tests/CrmApi.{UnitTests,IntegrationTests}`
- [ ] `Directory.Build.props` (net10.0, Nullable, TreatWarningsAsErrors) y `Directory.Packages.props`
- [ ] Domain: `Entity` base (`Guid Id` v7, `CreatedAt`, `UpdatedAt`, `IsDeleted`), `Result`/`Error`
- [ ] Application: `PagedRequest`/`PagedResult<T>`, validación, `AddApplication()`
- [ ] Api: `MapGroup("/api/v1")`, manejador global → `ProblemDetails`, `AddInfrastructure()`
- [ ] `/health` (API + MySQL) y healthcheck de `api` en compose; quitar `weatherforecast`
- [ ] `Dockerfile` adaptado a la nueva estructura

## Fase 2 — Persistencia
- [ ] Proveedor EF Core 10 para MySQL (decidir Pomelo vs Oracle)
- [ ] `CrmDbContext`, `IEntityTypeConfiguration<T>`, tablas `snake_case`
- [ ] Interceptor de auditoría (`CreatedAt`/`UpdatedAt`) y filtro global de soft delete
- [ ] Migraciones aplicadas al arrancar en Development
- [ ] Tests de integración con Testcontainers (MySQL)

## Fase 3 — Clientes `/api/v1/customers`
- [ ] `Customer`: tipo (Persona/Empresa), nombre/razón social, documento, email, teléfono, web, dirección, estado (Prospecto/Activo/Inactivo/Perdido), origen, notas
- [ ] `GET` listado paginado + búsqueda (nombre, email, documento) + filtros (estado, origen) + orden
- [ ] `GET /{id}` · `POST` · `PUT /{id}` · `PATCH /{id}/status` · `DELETE /{id}` (soft)
- [ ] Reglas: email y documento únicos, campos obligatorios por tipo
- [ ] `Tag` + `POST/DELETE /{id}/tags/{tag}`; filtro por etiqueta

## Fase 4 — Contactos `/api/v1/customers/{customerId}/contacts`
- [ ] `Contact`: nombre, cargo, rol (Decisor/Influenciador/Técnico/Compras), email, teléfono, `IsPrimary`
- [ ] CRUD completo; un solo contacto principal por cliente
- [ ] `GET /api/v1/contacts?search=` búsqueda transversal

## Fase 5 — Pipeline y oportunidades
- [ ] `Pipeline` + `PipelineStage` (nombre, orden, probabilidad, `IsWon`/`IsLost`); seed del pipeline por defecto
- [ ] `/api/v1/pipelines`: CRUD de pipelines y etapas, reordenar etapas
- [ ] `Opportunity`: cliente, contacto, título, monto, moneda, probabilidad, cierre estimado, etapa, estado (Abierta/Ganada/Perdida)
- [ ] `/api/v1/opportunities`: CRUD + filtros (etapa, estado, cliente, rango de fechas y montos)
- [ ] `POST /{id}/move` cambia etapa → registra `OpportunityStageHistory`
- [ ] `POST /{id}/win` · `POST /{id}/lose` (motivo obligatorio: `LossReason`)
- [ ] `GET /api/v1/pipelines/{id}/board` vista Kanban (oportunidades agrupadas por etapa + totales)
- [ ] `GET /api/v1/customers/{id}/opportunities`

## Fase 6 — Actividades y timeline
- [ ] `Activity`: tipo (Llamada/Reunión/Email/Tarea/Nota/Visita), asunto, descripción, vencimiento, completada, vínculo a cliente/contacto/oportunidad
- [ ] `/api/v1/activities`: CRUD + filtros (tipo, pendientes, vencidas, rango de fechas) + `POST /{id}/complete`
- [ ] `GET /api/v1/customers/{id}/timeline`: actividades + cambios de etapa + altas, en orden cronológico
- [ ] Oportunidades abiertas sin próxima actividad: `GET /api/v1/opportunities?withoutNextActivity=true`

## Fase 7 — Usuarios y seguridad
- [ ] `User` (nombre, email, hash de contraseña, rol, activo) y `Team`
- [ ] `/api/v1/auth`: `login`, `refresh` (JWT + refresh token), `me`
- [ ] `/api/v1/users`: CRUD (sólo Admin); seed de admin inicial por variables de entorno
- [ ] Roles Admin/Manager/Vendedor con políticas de autorización
- [ ] `OwnerId` en Customer/Opportunity/Activity; `AssignTo` y filtros "mis registros"
- [ ] Visibilidad: Vendedor ve lo suyo, Manager ve a su equipo, Admin ve todo
- [ ] Auditoría: `CreatedBy`/`UpdatedBy` desde el usuario autenticado

## Fase 8 — Reportes `/api/v1/reports`
- [ ] `sales-by-period?from&to&groupBy=month` (monto y cantidad de ganadas)
- [ ] `sales-by-owner` · `funnel` (conversión por etapa) · `forecast` (Σ monto × probabilidad por mes de cierre)
- [ ] `loss-reasons` · `activity-summary` (actividades por usuario y tipo)
- [ ] `GET /api/v1/dashboard`: KPIs resumidos (pipeline abierto, ganado del mes, tareas vencidas)

## Fase 9 — Leads `/api/v1/leads`
- [ ] `Lead`: nombre, empresa, email, teléfono, origen, estado (Nuevo/Contactado/Calificado/Descartado), responsable
- [ ] CRUD + filtros; `POST /{id}/qualify` · `POST /{id}/discard`
- [ ] `POST /{id}/convert` → crea Customer + Contact + Opportunity en una transacción
- [ ] Endpoint público de captura protegido con API key

## Fase 10 — Productos y cotizaciones
- [ ] `Product`: código, nombre, precio, impuesto, activo → `/api/v1/products`
- [ ] `OpportunityLine` (producto, cantidad, precio, descuento); el monto de la oportunidad se calcula con las líneas
- [ ] `Quote` desde oportunidad: número correlativo, estado (Borrador/Enviada/Aceptada/Rechazada), versiones

## Fase 11 — Operación y calidad
- [ ] Serilog estructurado + correlation id
- [ ] Rate limiting, CORS, compresión
- [ ] Importación/exportación CSV de clientes y contactos
- [ ] Notificaciones internas (asignaciones, tareas por vencer) + `BackgroundService` de recordatorios
- [ ] CI: build + tests + imagen Docker

## Backlog (sin fase)
Campos personalizados · detección/fusión de duplicados · adjuntos · webhooks · email/plantillas/campañas · tickets y SLA · reglas de automatización · metas/cuotas · multimoneda · multi-tenant · 2FA/SSO.

---

## Decisiones pendientes
| Tema | Opciones | Cuándo |
|---|---|---|
| Proveedor MySQL | Pomelo · `MySql.EntityFrameworkCore` | Fase 2 |
| Validación | FluentValidation · validación nativa .NET 10 | Fase 1 |
| Casos de uso | Servicios de aplicación · handlers CQRS sin MediatR | Fase 1 |
| Hash de contraseñas | `PasswordHasher<T>` de ASP.NET Identity · BCrypt | Fase 7 |
