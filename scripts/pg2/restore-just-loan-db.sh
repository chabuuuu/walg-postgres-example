#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../../"

docker compose stop postgres2
docker compose run --rm postgres2 sh -c 'rm -rf $PGDATA/*'
docker compose run --rm postgres2 sh -c '/wal-g backup-fetch -h; /wal-g backup-fetch $PGDATA LATEST --restore-only=loan_db; touch $PGDATA/recovery.signal'
docker compose up -d postgres2
