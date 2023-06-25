FROM golang:1.20-alpine as builder

ARG DELVE_VERSION=latest
ENV GOPROXY=https://goproxy.cn,direct

RUN go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}


FROM alpine:latest

COPY --from=builder /go/bin /bin
