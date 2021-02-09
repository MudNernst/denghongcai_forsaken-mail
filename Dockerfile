FROM node:latest
MAINTAINER Hongcai Deng <admin@dhchouse.com>

RUN mkdir -p /usr/src/forsaken-mail \
  && mkdir /forsaken-mail

COPY . /usr/src/forsaken-mail

WORKDIR /usr/src/forsaken-mail

EXPOSE 25
EXPOSE 3000

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
CMD npm start
