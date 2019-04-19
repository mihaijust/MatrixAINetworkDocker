MANWALLET="$(ls /go-matrix/chaindata/keystore/)"

if [ ! -d "/go-matrix/chaindata/keystore" ]; then
  cd /go-matrix && ./gman --datadir chaindata init MANGenesis.json
fi

cd /go-matrix && ./gman --datadir chaindata --networkid 1 --debug --verbosity 5 --manAddress $MANWALLET --entrust entrust.json --gcmode archive --outputinfo 1 --syncmode full
