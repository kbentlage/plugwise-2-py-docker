#/bin/bash
docker buildx build --platform linux/amd64 -t kbentlage/plugwise-2-py-amd64:latest --load .
docker buildx build --platform linux/arm64 -t kbentlage/plugwise-2-py-arm64:latest --load .

docker push kbentlage/plugwise-2-py-amd64:latest
docker push kbentlage/plugwise-2-py-arm64:latest

docker manifest create kbentlage/plugwise-2-py:latest kbentlage/plugwise-2-py-amd64:latest kbentlage/plugwise-2-py-arm64:latest --amend
docker manifest push kbentlage/plugwise-2-py:latest