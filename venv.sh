#!/bin/bash
ROOT=`dirname "${BASH_SOURCE[0]}"`
act="${ROOT}/system/venv/bin/activate"
mkdir -p ${ROOT}/system/venv

if [ ! -f "${act}" ]; then
    set -e
    pip install virtualenv
    virtualenv ${ROOT}/system/venv
    source ${act}
    ${ROOT}/upgrade-requirements.sh
    set +e
else
    source ${act}
fi

ARGS="$@"
if [ -n "${ARGS}" ]; then
    cd ${ROOT}
    exec $@
fi
