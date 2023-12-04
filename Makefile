docker.build:
	docker build --tag docker-wault .

docker.run:
	docker run -p 8080:8080 docker-wault

docker.all: docker.build docker.run

docker.stop:
	docker stop docker-wault

go.run:
	go run app/main.go