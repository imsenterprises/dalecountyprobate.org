#!/bin/bash
set -x
cd ..
export DOCKER_CLI_EXPERIMENTAL=enabled
docker run --privileged linuxkit/binfmt:v0.6
cp config.yaml config.orig.yaml
for THEME in ims-red ims-green
do
  sed -i 's/^theme: .\+$/theme: '$THEME'/' config.yaml 
  grep theme config.yaml
  docker build -t docker.serve-dns.com/ims/demo-county-site:${THEME}-amd64 --build-arg IMAGE=amd64/nginx .
  #docker build -t docker.serve-dns.com/ims/demo-county-site:${THEME}-arm32v7 --build-arg IMAGE=arm32v7/nginx .

  docker tag docker.serve-dns.com/ims/demo-county-site:${THEME}-amd64 docker.serve-dns.com/ims/demo-county-site:${THEME}
  docker push docker.serve-dns.com/ims/demo-county-site:${THEME}
  #docker push docker.serve-dns.com/ims/demo-county-site:${THEME}-arm32v7
  #docker manifest create --amend \
  #  docker.serve-dns.com/ims/demo-county-site:${THEME} \
  #  docker.serve-dns.com/ims/demo-county-site:${THEME}-amd64 \
  #  docker.serve-dns.com/ims/demo-county-site:${THEME}-arm32v7 \
  
  #docker manifest push docker.serve-dns.com/ims/demo-county-site:${THEME}
done
mv config.orig.yaml config.yaml
