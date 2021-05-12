# Micro

This monorepo contains a simple microservices oriented solution for retrieving and encrypting a stock quote.

## Run

### Initialize Git submodules
To initialize Git submodules, the following command should be executed:
```
git submodule update --recursive --init
```

### Build Docker images and start docker compose
In order to run the solution, the port `3000` of the host machine should be available.
The following command will do everything is needed:
```
sh start.sh
```

After executing it, `docker ps` will show the following:
- A container called `stocks-api` that's exposing port `3000`.
- A container called `encrypter-api` that isn't exposing any port.

## Solution description
The solution has two three parts:

### Root
This solution consists of a `docker-compose.yml` that is responsible of starting the two services.

### Stocks API
This API consists of two endpoints:
- `GET` `/ping`: this endpoint is used as healthcheck by Docker Compose.
- `GET` `/quote?symbol={symbol}`: this endpoint receives a stock symbol and then gets a quote for that stock and encrypt it using the Encrypter API.

### Encrypter API
This API consists of two endpoints:
- GET `/ping`: this endpoint is used as healthcheck by Docker Compose.
- POST `/encrypt`: this endpoint receives a stock quote and encryptes it using AES-256.

## Most challenging part
In a real world scenario, the most challenging part of a solution like this would be managing the different services. Docker Compose just works for this non-production architecture, but it lacks of features like auto-scaling and circuit-breaker pattern.
I'd liked to implement this using `go-micro`, but given that I haven't worked in the past with it and I had almost no time to investigate, I decided to go with a well know approach.