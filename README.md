# Golang Mux Demo

## Run locally

- Start postgres
- Prepare environment, fill DB parameters:

``` bash
$ cp env-sample .env
$ $EDITOR .env
$ source .env
```

- Run PostgreSQL container and create the databases or use docker-compose

 - Docker
``` bash
$ docker run --name postgres-db -p 5432:5432 -e POSTGRES_PASSWORD=${APP_DB_PASSWORD} -d postgres
$ echo "SELECT 'CREATE DATABASE ${APP_DB_NAME}' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '${APP_DB_NAME}')\gexec" | \
psql "user=${APP_DB_USERNAME} password=${APP_DB_PASSWORD} host=127.0.0.1 port=5432"
$ echo "SELECT 'CREATE DATABASE ${TEST_DB_NAME}' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '${TEST_DB_NAME}')\gexec" | \
psql "user=${TEST_DB_USERNAME} password=${TEST_DB_PASSWORD} host=127.0.0.1 port=5432"
```
 - Docker-compose
``` bash
$ docker-compose build
$ docker-compose up -d
```
- Build and run:

```bash
$ go get -u github.com/gorilla/mux github.com/lib/pq
$ go build -o go-mux-api.bin
$ ./go-mux-api.bin
```

Server is listening on localhost:8010

- GKE Setup

Create the regional IP for the LoadBalancer
``` bash
$ gcloud compute addresses create go-mux-api-ip --region us-west1
```

## Test

```bash
$ go test -v
=== RUN   TestEmptyTable
--- PASS: TestEmptyTable (0.01s)
=== RUN   TestGetNonExistentProduct
--- PASS: TestGetNonExistentProduct (0.00s)
=== RUN   TestCreateProduct
--- PASS: TestCreateProduct (0.01s)
=== RUN   TestGetProduct
--- PASS: TestGetProduct (0.01s)
=== RUN   TestUpdateProduct
--- PASS: TestUpdateProduct (0.01s)
=== RUN   TestDeleteProduct
--- PASS: TestDeleteProduct (0.01s)
PASS
ok      _/home/gustavo/GIT/gfnord/go-mux        0.051s
```

## License

The project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
