# Build Gman in a stock Go builder container #shang and yang
FROM alpine:3.7

# Grab needed packages
RUN apk add --no-cache linux-headers git gnupg ca-certificates

# add script for starting gman
ADD . /matrix

# grab files from official matrix repo
RUN cd /matrix && wget https://github.com/MatrixAINetwork/GMAN_CLIENT/raw/master/MAINNET/5.17/linux/gman https://raw.githubusercontent.com/MatrixAINetwork/GMAN_CLIENT/master/MAINNET/5.17/MANGenesis.json https://raw.githubusercontent.com/MatrixAINetwork/GMAN_CLIENT/master/MAINNET/5.17/man.json

# Start node script that sets a random entrust password to start node
ENTRYPOINT ["/matrix/nodeConfig.sh"]

#To start your node, run "docker run -d --network matrixnet --ip <ip address> -e MAN_PORT='<modified 50505 port>' -v /path/to/host/chaindata:/matrix/chaindata --name <docker_name> matrix"
#The /path/to/host/chaindata directory should be a directory on the host system that contains your keystore folder, with your wallet inside it.
#The directory can be named whatever you'd like but it will get mounted as the container chaindata folder. The scripts will do the rest.
