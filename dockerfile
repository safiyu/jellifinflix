# syntax=docker/dockerfile:1
# check=skip=SecretsUsedInArgOrEnv

FROM alpine:3.21
LABEL maintainer="Safiyu <safiyucloud@gmail.com>"
VOLUME /media
RUN apk add --no-cache bash figlet curl
COPY . /app

ENV CRON_STRING="0 */6 * * *"
ENV JF_API_KEY=
ENV JF_URL=

RUN chmod +x /app/entry.sh
RUN chmod +x /app/cron.sh
RUN chmod -R a+x /app/crontab

ENTRYPOINT ["sh","/app/cron.sh"]
