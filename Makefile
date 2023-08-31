postgres:
	docker run --name postgres-sample-bank -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it postgres-sample-bank createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres-sample-bank dropdb simple_bank

migreateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" --verbose up

migreatedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" --verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migreateup migreatedown sqlc
