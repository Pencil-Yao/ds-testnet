#!/bin/bash
# autogen - auto generate gaia init env in specific direction

if [ $# -lt 2 ]; then
  echo "Usage: ./autogen.sh <node_number> <gaiad_home> <mode>"
  echo "    <mode> - one of 'create', 'recover'"
  echo "        - 'create' <DIR> duplicate the tendermint validator private keys to <DIR> direction"
  echo "        - 'recover' <DIR> recover the tendermint validator private keys from <>DIR direction"
  echo "        - 'delete' delete repo file fold"
  exit 1
fi

set -eux

export NODE_NUM=$1
export GAIAD=`cd $2; pwd`
export MODE="none"
if [ $# -eq 3 ]; then
    export MODE=$3
    export DIR="./validator_pri"
    if [ ! -d ${DIR} ]; then
        mkdir -p ${DIR}
    fi
fi

int=0
export GAIA_DIC="./repo"
while((${int}<(${NODE_NUM})))
do
    echo "build ${int}-th gaia-env"
    if [ ! -d ${GAIA_DIC} ]; then
        mkdir -p ${GAIA_DIC}
    fi

    gaiad init --overwrite --chain-id=testing $(hostname) --home ${GAIA_DIC}/GAIA_ENV${int}
    cp ${GAIAD}/config/genesis.json ${GAIA_DIC}/GAIA_ENV${int}/config/

    if [ "${MODE}" == "create" ]; then
        cp ${GAIA_DIC}/GAIA_ENV${int}/config/priv_validator_key.json ${DIR}/VALIDATOR_PRIVKEY${int}
    fi

    if [ "${MODE}" == "recover" ]; then
        cp ${DIR}/VALIDATOR_PRIVKEY${int} ${GAIA_DIC}/GAIA_ENV${int}/config/priv_validator_key.json
    fi

    int=`expr ${int} + 1`
done