# jellifinflix
This docker creates .ignore files in empty folders so that empty folders are ignored in the library.
A cron job runs every 6 hours by default which can be customized using CRON_STRING env variable. Also you can pass jellyfin api key and jellyfin server url as environment variables to run jellyfin library refresh after every replace.

# Install
docker run -v <path/to/media>:/media:rw -e "CRON_STRING=*/10 * * * *" -e "JF_API_KEY=fdsfds3232344232434ss" -e "JF_URL=http://192.168.1.1:8096⁠" jellyfinfix:latest
