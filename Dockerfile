FROM golang
WORKDIR /app

COPY src/go.mod src/go.sum ./
RUN go mod download
COPY src/*.go ./
COPY templates/*.html ./templates/

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-wault

ENV PORT=8080
EXPOSE 8080

CMD ["/docker-wault"]