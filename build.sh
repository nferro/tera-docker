REPOSRC=https://gitlab.com/terafoundation/tera.git
LOCALREPO=tera

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone $REPOSRC $LOCALREPO
else
    cd $LOCALREPO
    git pull $REPOSRC
    cd ..
fi

docker build -f Dockerfile-alpine -t tera .