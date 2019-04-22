#!/bin/sh

if [ -f "/go-matrix/man.json" ]; then
  mv /go-matrix/man.json /go-matrix/chaindata/
fi

#This section creates your entrust.json file on the fly each time you start the container
#This requires that you mount a persistent volume from your host OS to the /go-matrix/chaindata directory
PASS="$(date +%s | sha256sum | base64 | head -c 4)pO1@"
echo $PASS > /go-matrix/gman.pass
echo $PASS >> /go-matrix/gman.pass
cat /go-matrix/gman.pass | /go-matrix/build/bin/gman --datadir /go-matrix/chaindata aes --aesin /go-matrix/chaindata/signAccount.json --aesout /go-matrix/entrust.json

MANWALLET="$(ls /go-matrix/chaindata/keystore/)"

if [ ! -d "/go-matrix/chaindata/gman" ]; then
  cd /go-matrix/build/bin && ./gman --datadir /go-matrix/chaindata init /go-matrix/MANGenesis.json
fi

cd /go-matrix/build/bin && cat /go-matrix/gman.pass | ./gman --datadir /go-matrix/chaindata --networkid 1 --debug --verbosity 5 --manAddress $MANWALLET --entrust /go-matrix/entrust.json --gcmode archive --outputinfo 1 --syncmode full
