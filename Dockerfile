FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS base 
WORKDIR /app 
EXPOSE 80 
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build 
WORKDIR /src 
COPY ["simplecalc/simplecalc.csproj", "simplecalc/"] 
COPY ["UnitTestProject1/UnitTestProject1.csproj", "UnitTestProject1/"] 
RUN dotnet restore "simplecalc/simplecalc.csproj" 
RUN dotnet restore "UnitTestProject1/UnitTestProject1.csproj" 
COPY . . 
RUN dotnet build "simplecalc/simplecalc.csproj" -c Release -o /app 
RUN dotnet build "UnitTestProject1/UnitTestProject1.csproj" -c Release -o /app 

RUN dotnet test "UnitTestProject1/UnitTestProject1.csproj" --logger "trx;LogFileName=simplecalc.trx" 

FROM build AS publish 
RUN dotnet publish -c Release -o /app

FROM base AS final 
WORKDIR /app 
COPY --from=publish /app . 
ENTRYPOINT ["dotnet", "simplecalc.dll"]
#ENTRYPOINT ["dotnet", "test", "--logger:trx"]
