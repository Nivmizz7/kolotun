#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

mkdir -p "$ROOT_DIR/public"

docker run --rm \
  --user "$(id -u)":"$(id -g)" \
  -v "$ROOT_DIR":/data \
  jgraph/drawio:latest \
  /opt/drawio/drawio-desktop \
  --export \
  --format svg \
  --output /data/public/latest.svg \
  /data/src/latest.drawio
