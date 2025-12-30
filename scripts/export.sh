#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
IMAGE="${DRAWIO_IMAGE:-jgraph/drawio-export}"
BIN="${DRAWIO_BIN:-/opt/drawio/drawio}"

mkdir -p "$ROOT_DIR/public"

docker run --rm \
  --user "$(id -u)":"$(id -g)" \
  -v "$ROOT_DIR":/data \
  "$IMAGE" \
  "$BIN" \
  --export \
  --format svg \
  --output /data/public/latest.svg \
  /data/src/latest.drawio
