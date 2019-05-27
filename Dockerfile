# Build Gman in a stock Go builder container #shang and yang
FROM debian:latest

# install needed packages
RUN apt-get update && apt-get install -y procps wget net-tools cron && rm -rf /var/lib/apt/lists/*

# add script for starting gman from repo
ADD . /matrix

# grab files from official matrix repo and set execute permissions
RUN cd /matrix && wget https://github.com/MatrixAINetwork/GMAN_CLIENT/raw/master/MAINNET/5.17/linux/gman https://raw.githubusercontent.com/MatrixAINetwork/GMAN_CLIENT/master/MAINNET/5.17/MANGenesis.json https://raw.githubusercontent.com/MatrixAINetwork/GMAN_CLIENT/master/MAINNET/5.17/man.json && chmod a+x gman


# Start node script that sets a random entrust password to start node
ENTRYPOINT ["/matrix/nodeConfig.sh"]

#To start your node, run "docker run -d --network matrixnet --ip <ip address> -e MAN_PORT='<modified 50505 port>' -v /path/to/host/chaindata:/matrix/chaindata --name <docker_name> matrix"
#The /path/to/host/chaindata directory should be a directory on the host system that contains your keystore folder, with your wallet inside it.
#The directory can be named whatever you'd like but it will get mounted as the container chaindata folder. The scripts will do the rest.
