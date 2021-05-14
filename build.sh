[ -n "$1" ] && VERSION=$1 || VERSION="2.13.9"
IMAGE_NAME="axldns/allure"
docker build --build-arg NODE_VERSION=$VERSION  -t "$IMAGE_NAME:latest" -t "$IMAGE_NAME:$VERSION" .
docker push $IMAGE_NAME --all-tags