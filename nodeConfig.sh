#!/bin/sh
#This is used to detect first time run and moves a file
if [ -f "/matrix/man.json" ]; then
  mv /matrix/man.json /matrix/chaindata/
fi

#This section creates your entrust.json file on the fly each time you start the container
#This requires that you mount a persistent volume from your host OS to the container's /matrix/chaindata directory
#You must have a signAccount.json file in your mounted chaindata directory
PASS="$(date +%s | sha256sum | base64 | head -c 4)pO1@"
echo $PASS > /matrix/gman.pass
echo $PASS >> /matrix/gman.pass
cat /matrix/gman.pass | /matrix/gman --datadir /matrix/chaindata aes --aesin /matrix/chaindata/signAccount.json --aesout /matrix/entrust.json

#This also detects if this is a first run and intializes the genisis block
if [ ! -d "/matrix/chaindata/gman" ]; then
  cd /matrix/ && ./gman --datadir /matrix/chaindata init /matrix/MANGenesis.json
fi

#Move picstore directory into chaindata on first run if it doesn't exist
if [ ! -d "/matrix/chaindata/picstore" ]; then
	mv /matrix/picstore /matrix/chaindata/
fi

# This reads your wallet address and assigns to to the variable
MAN_WALLET="$(ls /matrix/chaindata/keystore/)"

#link TrieData to persistent mount
ln -sf /matrix/chaindata/snapdir/TrieData1405031 /matrix/snapdir/TrieData1405031

# detect if this is the first time running and use snapshot if needed
if [ ! -f "/matrix/chaindata/firstRun" ]; then
	echo "First run detected, using snapshot" && touch /matrix/chaindata/firstRun && cd /matrix/ && cat /matrix/gman.pass | ./gman --datadir /matrix/chaindata --networkid 1 --debug --verbosity 1 --port $MAN_PORT --manAddress $MAN_WALLET --entrust /matrix/entrust.json --gcmode archive --outputinfo 1 --syncmode full --loadsnapfile "TrieData1405031"
else
	echo "Snapshot NOT loaded/used" && cd /matrix/ && cat /matrix/gman.pass | ./gman --datadir /matrix/chaindata --networkid 1 --debug --verbosity 1 --port $MAN_PORT --manAddress $MAN_WALLET --entrust /matrix/entrust.json --gcmode archive --outputinfo 1 --syncmode full
fi
