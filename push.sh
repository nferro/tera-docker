# get version - this is weak but works for now
TERAVERSION=$(sed -nE 's/global\.UPDATE_CODE_VERSION_NUM\s*=\s*(.*);/\1/p' tera/Source/core/constant.js)

docker tag tera:latest nunoferro/tera:0.$TERAVERSION
docker push nunoferro/tera:0.$TERAVERSION