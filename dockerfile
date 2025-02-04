FROM alpine:3.14
LABEL maintainer="Safiyu <safiyucloud@gmail.com>"
VOLUME /media
RUN apk add --no-cache bash figlet
COPY . /app

ENV CRON_STRING="0 */6 * * *"

RUN chmod +x /app/entry.sh
RUN chmod +x /app/cron.sh
RUN chmod -R a+x /app/crontab

ENTRYPOINT ["sh","/app/cron.sh"]
