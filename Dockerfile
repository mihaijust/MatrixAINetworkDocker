# Build Gman in a stock Go builder container #shang and yang
FROM golang:1.12-alpine 

RUN apk add --no-cache make gcc musl-dev linux-headers git gnupg

ADD . /go-matrix
RUN cd /go-matrix && make gman

# Pull Gman into a second stage deploy alpine container

RUN apk add --no-cache ca-certificates

EXPOSE 8341 8546 50505 50505/udp 30304/udp
ENTRYPOINT ["/go-matrix/nodeConfig.sh"]
