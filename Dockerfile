FROM golang:latest AS builder
ADD . /exercise01
WORKDIR /exercise01
RUN cd cmd/geekshubs-library && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .



FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /exercise01 ./
RUN chmod +x ./main
ENTRYPOINT ["./main"]
EXPOSE 8080