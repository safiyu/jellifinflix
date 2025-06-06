# Jellyfinfix

This docker creates .ignore files in folders without videos that are maintained by media managers so that non-video/empty folders are ignored in the library.

A cron job runs every 6 hours by default which can be customized using CRON_STRING env variable. Also, environment variables for jellyfin api key and jellyfin server url must be passed to run jellyfin library refresh after every replace.

# Install 👩‍💻

# Docker Run
```
docker run -v <path/to/media>:/media:rw -e "CRON_STRING=*/10 * * * *" -e "JF_API_KEY=fdsfds3232344232434ss" -e "JF_URL=http://192.168.1.1:8096⁠" jellyfinfix:latest
```

# Docker Compose ⚡️
```
services:
  jellyfinfix:
    container_name: jellyfinfix
    image: safiyu/jellyfinfix:latest
    volumes:
      - /path/to/Videos:/media:rw
    environment:
      - CRON_STRING=* * * * *
      - TZ=Europe/Paris
      - JF_API_KEY=<jellyfin api key here>
      - JF_URL=<jellyfin url here>
    restart: always
    healthcheck:
      disable: false
```
## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
