FROM node:current-alpine
MAINTAINER Hongcai Deng <admin@dhchouse.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
  && apk -U upgrade \
  && mkdir -p /usr/src/forsaken-mail \
  && mkdir /forsaken-mail

COPY . /usr/src/forsaken-mail

WORKDIR /usr/src/forsaken-mail

EXPOSE 25
EXPOSE 3000

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
CMD npm start
