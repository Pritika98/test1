FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base 
WORKDIR /app 
EXPOSE 80 
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build 
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
RUN dotnet publish "simplecalc.csproj" -c Release -o /app 
RUN dotnet publish "UnitTestProject1.csproj" -c Release -o /app 

FROM base AS final 
WORKDIR /app 
COPY --from=publish /app . 
ENTRYPOINT ["dotnet", "simplecalc.dll"]
