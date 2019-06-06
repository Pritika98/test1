FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# copy everything to container
COPY *.* ./

WORKDIR /app/simplecalc
RUN dotnet publish -c Release -o out

#FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS runtime
#WORKDIR /app
#COPY --from=build /app/simplecalc/out ./
#ENTRYPOINT ["dotnet", "simplecalc.dll"]

FROM build AS testrunner
WORKDIR /app/UnitTestProject1
#COPY UnitTestProject1/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]
