FROM golang:1.16 as builder
WORKDIR /go/src/github.com/grid-dev/simple-go-helloworld
COPY . .
RUN go mod download
RUN env GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -o main .

FROM alpine:3.13.6
EXPOSE 80
COPY --from=builder //go/src/github.com/grid-dev/simple-go-helloworld/main /bin
CMD main