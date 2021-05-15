[ -n "$1" ] && VERSION=$1 || VERSION="12.22.1"
IMAGE_NAME="axldns/selenode"
docker build --build-arg NODE_VERSION=$VERSION  -t "$IMAGE_NAME:latest" -t "$IMAGE_NAME:$VERSION" .
docker push $IMAGE_NAME --all-tags