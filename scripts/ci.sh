#!/bin/bash

set -x

# Yarn setup
npm uninstall -g yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
install-package yarn

ls -lah $SEMAPHORE_CACHE_DIR

yarn install

mkdir nested-project-1 && cp package.json yarn.lock nested-project-1/
cd nested-project-1 && yarn install --modules-folder $SEMAPHORE_CACHE_DIR/nested1-modules
cd -
