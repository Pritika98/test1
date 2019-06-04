FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

COPY ["simplecalc/simplecalc.csproj", "simplecalc/"] 
COPY ["UnitTestProject1/UnitTestProject1.csproj", "UnitTestProject1/"] 

COPY simplecalc/. ./simplecalc/
COPY UnitTestProject1/. ./UnitTestProject1/
WORKDIR /app/simplecalc
RUN dotnet build "simplecalc.csproj" -c Release -o /app 
RUN dotnet publish "simplecalc.csproj" -c Release -o
WORKDIR /app/UnitTestProject1
RUN dotnet build "UnitTestProject1.csproj" -c Release -o /app 
RUN dotnet publish "UnitTestProject1.csproj" -c Release -o

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/simplecalc/out ./
ENTRYPOINT ["dotnet", "simplecalc.dll"]
#ENTRYPOINT ["dotnet", "test"]
