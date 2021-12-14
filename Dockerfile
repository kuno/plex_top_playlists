FROM fnndsc/ubuntu-python3:ubuntu20.04-python3.8.10
ARG PLEX_TOKEN=test
ENV PLEX_TOKEN $PLEX_TOKEN
WORKDIR /app
COPY . .
RUN apt-get update && apt-get -y install build-essential libxml2-dev libxslt1-dev
RUN pip3 install -r requirements.txt
RUN cp settings.ini.example settings.ini
RUN sed -i -e "s/PLEX_TOKEN/${PLEX_TOKEN}/g" settings.ini
RUN chmod +x plex_playlist_update.py
CMD ["./plex_playlist_update.py","run"]
