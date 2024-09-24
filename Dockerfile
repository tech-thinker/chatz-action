FROM alpine:3.12

RUN apk add --no-cache git curl

RUN curl -sL https://github.com/tech-thinker/chatz/releases/download/v1.1.1/chatz-linux-amd64 -o chatz
RUN chmod +x chatz
RUN mv chatz /usr/bin/

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
