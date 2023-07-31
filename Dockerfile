# Use the official .NET SDK image to build and run the application
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

# Set the working directory inside the container
WORKDIR /app

# Copy the .csproj and restore dependencies (this is done separately from the source code for caching)
COPY *.csproj ./
RUN dotnet restore

# Copy the entire solution and build the application
COPY . ./
RUN dotnet publish -c Release -o out

# Runtime image, using the same .NET SDK image to ensure the SDK is available for running the application
FROM mcr.microsoft.com/dotnet/sdk:5.0

# Set the working directory inside the container
WORKDIR /app

# Copy the built application from the build-env stage
COPY --from=build-env /app/out .

# Set the entry point for the container to the application executable
ENTRYPOINT ["dotnet", "HelloWorldJsonLogging.dll"]
