FROM alpine:latest
RUN apk add --no-cache wget unzip
COPY localto.sh /app/localto.sh
RUN chmod +x /app/localto.sh
WORKDIR /app
CMD ["/app/localto.sh"]
