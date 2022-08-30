FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["./academywebapp.csproj", "academywebapp/"]
RUN dotnet restore "academywebapp/academywebapp.csproj"
COPY . .
WORKDIR "/src/academywebapp"
RUN dotnet build "academywebapp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "academywebapp.csproj" -c Release -o /app/publish --self-contained

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "academywebapp.dll"]