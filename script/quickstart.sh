#!/bin/bash
# quickstart - auto generate gaia init env in specific direction

if [ $# -lt 1 ]; then
  echo "Usage: ./quickstart.sh <genesis_dir>"
  echo "  <genesis_dir> is initial chain document direction"
  echo "  Need GOPATH be set to find gaiad & gaiacli"
  exit 1
fi

set -eux

export GENESIS_DIR=`cd $1; pwd`
export GAIAPP_DIR=${GOPATH}/bin
export GAIA_DIR="./repo"
if [ ! -d ${GAIA_DIR} ]; then
      mkdir -p ${GAIA_DIR}
fi
export APP_DIR="./docker/app"
if [ ! -d ${APP_DIR} ]; then
      mkdir -p ${APP_DIR}
fi

cp -r ${GENESIS_DIR} ${GAIA_DIR}/QS_GENESIS
cp ${GAIAPP_DIR}/gaiad ${GAIAPP_DIR}/gaiacli ${APP_DIR}
