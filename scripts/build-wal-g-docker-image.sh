#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker build ./docker-image/wal-g/ -t stephaneklein/wal-g:v3.0.3-alpine3.11.5
