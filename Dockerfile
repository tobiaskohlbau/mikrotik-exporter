FROM golang:1.11 AS build

WORKDIR /app
COPY . /app/
RUN CGO_ENABLED=0 go build

FROM alpine:3.6
 
EXPOSE 9436
 
COPY --from=build /app/mikrotik-exporter /
 
ENTRYPOINT ["/mikrotik-exporter"]
CMD ["-config-file", "/cfg/config.yml"]
