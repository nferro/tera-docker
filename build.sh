#!/bin/bash

REPOSRC=https://gitlab.com/terafoundation/tera2.git
LOCALREPO=tera

if [ ! -d $LOCALREPO ]
then
    git clone $REPOSRC $LOCALREPO
else
    cd $LOCALREPO
    git pull $REPOSRC
    cd ..
fi

docker build -f Dockerfile -t tera . 