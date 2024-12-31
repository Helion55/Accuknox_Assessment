FROM alpine:latest
RUN apk add --no-cache bash

RUN apk update && \
    apk add --no-cache fortune netcat-openbsd perl perl-utils

RUN wget -O- https://github.com/tnalpgge/rank-amateur-cowsay/archive/master.tar.gz | tar zx && \
    cd rank-amateur-cowsay-master && \
    ./install.sh /usr/local

WORKDIR /app

COPY Wisecow-App/wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["Wisecow-App/wisecow.sh"]
