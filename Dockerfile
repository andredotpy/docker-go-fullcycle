FROM golang:latest AS builder
WORKDIR /go/app/
COPY main.go .
RUN go build ./main.go

FROM scratch
WORKDIR /app/
COPY --from=builder /go/app/main .
ENTRYPOINT [ "./main" ]