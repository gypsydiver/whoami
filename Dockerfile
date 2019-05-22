FROM golang:1.12.5-alpine3.9 AS binary
ADD . /app
WORKDIR /app
RUN apk update && apk add -U git \
    && go build -o http

FROM alpine:3.6
WORKDIR /app
ENV PORT 8000
EXPOSE 8000
COPY --from=binary /app/http /app
CMD ["/app/http"]
