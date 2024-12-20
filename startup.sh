#!/bin/zsh

set -e


if ! systemctl is-active docker; then
  sudo systemctl start docker
fi
docker compose -f app/db/docker-compose.yml up -d

if ! type cargo-watch > /dev/null; then 
  cargo install cargo-watch
fi

cargo watch \
  --watch tt \
  --watch data \
  --watch router \
  --watch config \
  --watch app/api \
  -x 'run -p bruss_api'

