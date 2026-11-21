# syntax=docker/dockerfile:1

# ---------- Build ----------
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Restaurar primero (cache de capas). Cuando pasemos a Clean Architecture
# se copiarán aquí los .csproj de cada capa (src/*/*.csproj) y la .sln.
COPY crmapi.csproj ./
RUN dotnet restore crmapi.csproj

COPY . .
RUN dotnet publish crmapi.csproj -c Release -o /app/publish --no-restore /p:UseAppHost=false

# ---------- Runtime ----------
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app

ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080

COPY --from=build /app/publish .

# Usuario sin privilegios incluido en las imágenes oficiales de .NET
USER app

ENTRYPOINT ["dotnet", "crmapi.dll"]
