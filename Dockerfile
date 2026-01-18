FROM alpine:latest

RUN apk add --no-cache \
    github-cli \
    tzdata \
    bash

COPY trigger-workflow.sh /usr/src/app/trigger-workflow.sh
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/trigger-workflow.sh /usr/src/app/entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]