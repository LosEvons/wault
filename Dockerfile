FROM golang
WORKDIR /app

COPY app/go.mod ./
RUN go mod download
COPY app/*.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-wault

CMD ["/docker-wault"]