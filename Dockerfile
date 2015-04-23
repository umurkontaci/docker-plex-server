FROM ubuntu:14.04

RUN apt-get update -qq 

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y install curl

ADD https://downloads.plex.tv/plex-media-server/0.9.11.17.986-269b82b/plexmediaserver_0.9.11.17.986-269b82b_amd64.deb /var/plex.deb

RUN DEBIAN_FRONTEND=noninteractive dpkg -i /var/plex.deb 2>/dev/null || true

RUN DEBIAN_FRONTEND=noninteractive apt-get install -f -qq -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y simpleproxy

COPY start.sh /start.sh

EXPOSE 32400 50000 
CMD ["/bin/sh", "start.sh"]

