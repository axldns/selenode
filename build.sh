[ -n "$1" ] && VERSION=$1 || VERSION="14.17.6"
IMAGE_NAME="axldns/selenode"
docker build --build-arg NODE_VERSION=$VERSION -t "$IMAGE_NAME:$VERSION" .
docker push $IMAGE_NAME --all-tags