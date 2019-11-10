The function of the reposity
---
The repo is a tool for debuging the distributed performance of cosmos-sdk(gaia). Use this tool you can deploy your private
network more easily. The repo is made by docker and docker-compose, later you would need to install these if you don't 
have. BTW, cosmos-sdk(or gaia) will be simply referenced as cosmos below.
###1. Initiate your environment
First you need to initiate your master node which will become a validator or key node in your private network, you can
operate as [official guide](https://github.com/cosmos/gaia/blob/master/docs/deploy-testnet.md). If you did above operation
correctly, you should have key node in your private networking, but **set your chain id as testing**, because below operation
need it.
###2. Prepare distributed node
Second you need to prepare distributed nodes, and these nodes' configuration will be generate as
