# selenode
Docker image: ubuntu bionic, java, node, nvm, npm, chrome, selenium

Image ready to dockerize your automated browser testing with nodejs

## Example usage - bundling

```
# Dockerfile
FROM: axldns/selenode
COPY your-app .

# /bin/bash
docker build -t your-image .
docker run -dit --entrypoint=/bin/bash your-image
docker exec your-image selenium-standalone start
docker exec your-image node your-app
```

## Example usage - mount

```
PATH_TO_YOUR_APP="$(pwd)"
MOUNT_DIR=/opt/app
 docker run -dit --name selenode \
    --mount type=bind,source="$PATH_TO_YOUR_APP",target="$MOUNT_DIR" axldns/selenode
  docker exec selenode selenium-standalone start
  docker exec selenode node "$MOUNT_DIR/example.js"
```