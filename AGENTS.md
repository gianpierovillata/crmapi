# AGENTS.md

Guía para agentes de IA (y personas) que trabajen en este repositorio.

## Proyecto

**CRM API**: backend de un CRM (clientes, contactos, oportunidades/seguimiento de ventas, actividades).
El desarrollo es **incremental** y sigue el roadmap de [`plan.md`](./plan.md). Antes de empezar una tarea,
revisa `plan.md`, trabaja sólo en la fase/tarea indicada y marca las casillas al terminar.

## Stack (no negociable salvo acuerdo explícito)

- **.NET 10** / C# (versión por defecto del SDK), `Nullable` y `ImplicitUsings` habilitados.
- **ASP.NET Core Minimal APIs** — nunca controladores MVC.
- **Clean Architecture**.
- **MySQL 8.4** como base de datos, accedida con **EF Core**.
- Todo se ejecuta con **Docker** y **docker-compose**.

## Arquitectura (objetivo)

```
src/
  CrmApi.Domain/          # Entidades, value objects, enums, eventos, interfaces de dominio. Sin dependencias externas.
  CrmApi.Application/     # Casos de uso, DTOs, validaciones, interfaces (repositorios, servicios). Depende sólo de Domain.
  CrmApi.Infrastructure/  # EF Core + MySQL, repositorios, migraciones, servicios externos. Depende de Application.
  CrmApi.Api/             # Minimal API: endpoints, DI, middleware, OpenAPI. Composition root.
tests/
  CrmApi.UnitTests/
  CrmApi.IntegrationTests/
```

Regla de dependencias: `Api → Application → Domain` y `Infrastructure → Application → Domain`.
`Api` referencia `Infrastructure` sólo para registrar DI. **Domain y Application nunca referencian EF Core ni ASP.NET.**

## Convenciones

- Endpoints agrupados por feature con `MapGroup` en clases estáticas (`ClientEndpoints.MapClientEndpoints(this IEndpointRouteBuilder)`),
  rutas bajo `/api/v1/...`, en plural y kebab-case.
- Usar `TypedResults` y `Results<Ok<T>, NotFound, ...>` para tipado de respuestas y OpenAPI.
- Errores con `ProblemDetails` (RFC 7807) mediante un manejador global de excepciones.
- Nunca exponer entidades de dominio en la API: usar DTOs / records de request/response.
- Validación de entrada en Application (FluentValidation o validación nativa, según se decida en `plan.md`).
- Métodos asíncronos con sufijo `Async` y propagación de `CancellationToken`.
- Configuración por variables de entorno (`ConnectionStrings__DefaultConnection`, etc.). **No** secretos en `appsettings*.json` ni en el repo.
- Nombres de código en inglés; documentación y comentarios pueden ir en español.
- Tablas en `snake_case` plural; IDs `Guid` (o `Ulid`) generados en la aplicación; campos de auditoría `CreatedAt` / `UpdatedAt` en UTC.

## Comandos

```bash
cp .env.example .env              # primera vez
docker compose up -d --build      # levantar API + MySQL
docker compose logs -f api        # logs de la API
docker compose down               # parar (añade -v para borrar los datos de MySQL)
dotnet build                      # compilar en local
dotnet test                       # tests (cuando existan)
```

- API: http://localhost:8080 (en Development: UI de Scalar en `/scalar`, documento OpenAPI en `/openapi/v1.json`).
- Peticiones de ejemplo en `crmapi.http` (mantenerlo actualizado al añadir endpoints).
- MySQL: `localhost:3306`, credenciales en `.env`.

## Reglas de trabajo para agentes

1. Cambios pequeños y enfocados en la tarea actual de `plan.md`; no adelantar fases sin pedirlo.
2. Tras cada cambio: `dotnet build` sin warnings nuevos y, si existen, `dotnet test` en verde.
3. Si se añade un proyecto o se mueve un `.csproj`, actualizar el `Dockerfile` (capa de restore) y comprobar `docker compose build`.
4. Migraciones de EF Core con nombres descriptivos; nunca editar una migración ya aplicada.
5. No hacer commits ni push salvo que se pida explícitamente.
6. Actualizar este archivo si cambian convenciones, y `plan.md` al completar tareas.
