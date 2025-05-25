#!/bin/bash
set -eu pipefail

GOPLS_GROUP=$(id -g)
GOPLS_USER=$(id -u)

sudo usermod -u $GOPLS_USER gopls \
    && sudo groupmod -g $GOPLS_GROUP gopls || true \
    && exec "gopls"
