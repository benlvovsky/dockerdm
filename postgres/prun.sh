#docker run -p 5432:5432 --name postgres_ml -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d ml_postgresql:latest
docker exec -it -u postgres postgres_ml psql