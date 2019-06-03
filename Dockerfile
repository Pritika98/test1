FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY simplecalc/*.csproj ./simplecalc/

# copy everything else and build app
COPY simplecalc/. ./simplecalc/
WORKDIR /app/simplecalc
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/simplecalc/out ./
#ENTRYPOINT ["dotnet", "simplecalc.dll"]
ENTRYPOINT ["dotnet", "test"]
