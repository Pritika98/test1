FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app
COPY *.* ./

#WORKDIR /app/simplecalc
#RUN dotnet publish -c Release -o out

WORKDIR /app/UnitTestProject1
#RUN dotnet publish -c Release -o out
RUN dotnet publish UnitTestProject1/UnitTestProject1.csproj

#FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS runtime
#WORKDIR /app
#COPY --from=build /app/simplecalc/out ./
#ENTRYPOINT ["dotnet", "simplecalc.dll"]

FROM build AS testrunner
WORKDIR /app/test
COPY UnitTestProject1/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]
