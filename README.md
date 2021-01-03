# serviceDB

## Local setup

```bash
docker network create -d bridge net
docker run -d --name pg-image-metadata -e POSTGRES_USER=dbuser -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=image-metadata --network=net -p 5432:5432 postgres:13
docker build . -f Dockerfile_with_maven_build -t servicesdb
docker run --network=net servicesdb
```
