# CRM API

API REST para un CRM (clientes, contactos, seguimiento de ventas, actividades y reportes), construida con **.NET 10 Minimal APIs**, **Clean Architecture** y **MySQL**, todo dockerizado.

> 🚧 Proyecto en desarrollo incremental. Estado actual: **Fase 0 — infraestructura**. Ver [`plan.md`](./plan.md).

## Stack

| | |
|---|---|
| Runtime | .NET 10 / ASP.NET Core Minimal APIs |
| Arquitectura | Clean Architecture (Domain · Application · Infrastructure · Api) |
| Base de datos | MySQL 8.4 + EF Core |
| Documentación | OpenAPI + [Scalar](https://scalar.com) |
| Contenedores | Docker + Docker Compose |

## Requisitos

- [Docker](https://docs.docker.com/get-docker/) con Docker Compose
- [.NET 10 SDK](https://dotnet.microsoft.com/download) (sólo para desarrollar fuera de Docker)

## Puesta en marcha

```bash
git clone <url-del-repo> crmapi
cd crmapi
cp .env.example .env          # ajustar credenciales si se desea
docker compose up -d --build
```

| Servicio | URL |
|---|---|
| API | http://localhost:8080 |
| Scalar (probar endpoints) | http://localhost:8080/scalar |
| OpenAPI JSON | http://localhost:8080/openapi/v1.json |
| MySQL | `localhost:3306` (credenciales en `.env`) |

Scalar y OpenAPI sólo están disponibles con `ASPNETCORE_ENVIRONMENT=Development`.

### Comandos útiles

```bash
docker compose logs -f api    # logs de la API
docker compose ps             # estado de los contenedores
docker compose down           # detener
docker compose down -v        # detener y borrar los datos de MySQL
```

### Sin Docker

```bash
dotnet run                    # http://localhost:5235
```

Requiere un MySQL accesible y la variable `ConnectionStrings__DefaultConnection`.

## Configuración

Variables en `.env` (plantilla en [`.env.example`](./.env.example)):

| Variable | Descripción | Por defecto |
|---|---|---|
| `MYSQL_ROOT_PASSWORD` | Contraseña de root de MySQL | — |
| `MYSQL_DATABASE` | Nombre de la base de datos | `crmdb` |
| `MYSQL_USER` / `MYSQL_PASSWORD` | Usuario de la aplicación | `crm_user` |
| `MYSQL_PORT` | Puerto expuesto de MySQL | `3306` |
| `API_PORT` | Puerto expuesto de la API | `8080` |
| `ASPNETCORE_ENVIRONMENT` | Entorno de ASP.NET Core | `Development` |

`.env` no se versiona; nunca subas credenciales reales.

## Documentación del proyecto

- [`plan.md`](./plan.md) — plan de trabajo por fases
- [`funcionalidades.md`](./funcionalidades.md) — catálogo de funcionalidades del CRM y prioridades
- [`AGENTS.md`](./AGENTS.md) — arquitectura, convenciones y reglas para contribuir (personas y agentes de IA)

## Roadmap

- [x] Fase 0 — Infraestructura (Docker, MySQL, OpenAPI/Scalar)
- [ ] Fase 1 — Estructura Clean Architecture
- [ ] Fase 2 — Persistencia con EF Core
- [ ] Fase 3 — Clientes
- [ ] Fase 4 — Contactos
- [ ] Fase 5 — Pipeline y oportunidades
- [ ] Fase 6 — Actividades y timeline
- [ ] Fase 7 — Usuarios y seguridad
- [ ] Fase 8 — Reportes
- [ ] Fase 9 — Leads
- [ ] Fase 10 — Productos y cotizaciones
- [ ] Fase 11 — Operación y calidad
