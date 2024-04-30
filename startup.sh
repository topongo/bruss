#!/bin/zsh

set -e


if ! systemctl is-active docker; then
  sudo systemctl start docker
fi
docker compose -f app/db/docker-compose.yml up -d
cargo run -p bruss_api


