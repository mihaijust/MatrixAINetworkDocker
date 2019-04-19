# Build Gman in a stock Go builder container #shang and yang
FROM golang:1.12-alpine 

RUN apk add --no-cache make gcc musl-dev linux-headers git

ADD . /go-matrix
RUN cd /go-matrix && make gman

# Pull Gman into a second stage deploy alpine container

RUN apk add --no-cache ca-certificates
RUN  ln -s  /go-matrix/nodeStartup.sh /usr/local/bin/nodeStart

EXPOSE 8341 8546 50505 50505/udp 30304/udp
CMD ["nodeStart"]
