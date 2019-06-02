#!/bin/bash

# create containers on server1
docker run -d --network matrixnet --ip 192.168.1.11 -e MAN_PORT='50511' -v /mnt/data/B11:/matrix/chaindata --name B11 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.12 -e MAN_PORT='50512' -v /mnt/data/B12:/matrix/chaindata --name B12 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.13 -e MAN_PORT='50513' -v /mnt/data/B13:/matrix/chaindata --name B13 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.14 -e MAN_PORT='50514' -v /mnt/data/B14:/matrix/chaindata --name B14 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.15 -e MAN_PORT='50515' -v /mnt/data/B15:/matrix/chaindata --name B15 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.16 -e MAN_PORT='50516' -v /mnt/data/B16:/matrix/chaindata --name B16 disarmm/matrix

# create containers on server2
docker run -d --network matrixnet --ip 192.168.1.21 -e MAN_PORT='50521' -v /mnt/data/B21:/matrix/chaindata --name B21 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.22 -e MAN_PORT='50522' -v /mnt/data/B22:/matrix/chaindata --name B22 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.23 -e MAN_PORT='50523' -v /mnt/data/B23:/matrix/chaindata --name B23 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.24 -e MAN_PORT='50524' -v /mnt/data/B24:/matrix/chaindata --name B24 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.25 -e MAN_PORT='50525' -v /mnt/data/B25:/matrix/chaindata --name B25 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.26 -e MAN_PORT='50526' -v /mnt/data/B26:/matrix/chaindata --name B26 disarmm/matrix

# create containers on server3
docker run -d --network matrixnet --ip 192.168.1.31 -e MAN_PORT='50531' -v /mnt/data/B31:/matrix/chaindata --name B31 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.32 -e MAN_PORT='50532' -v /mnt/data/B32:/matrix/chaindata --name B32 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.33 -e MAN_PORT='50533' -v /mnt/data/B33:/matrix/chaindata --name B33 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.34 -e MAN_PORT='50534' -v /mnt/data/B34:/matrix/chaindata --name B34 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.35 -e MAN_PORT='50535' -v /mnt/data/B35:/matrix/chaindata --name B35 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.36 -e MAN_PORT='50536' -v /mnt/data/B36:/matrix/chaindata --name B36 disarmm/matrix

# create containers on server4
docker run -d --network matrixnet --ip 192.168.1.41 -e MAN_PORT='50541' -v /mnt/data/B41:/matrix/chaindata --name B41 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.42 -e MAN_PORT='50542' -v /mnt/data/B42:/matrix/chaindata --name B42 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.43 -e MAN_PORT='50543' -v /mnt/data/B43:/matrix/chaindata --name B43 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.44 -e MAN_PORT='50544' -v /mnt/data/B44:/matrix/chaindata --name B44 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.45 -e MAN_PORT='50545' -v /mnt/data/B45:/matrix/chaindata --name B45 disarmm/matrix
docker run -d --network matrixnet --ip 192.168.1.46 -e MAN_PORT='50546' -v /mnt/data/B46:/matrix/chaindata --name B46 disarmm/matrix
