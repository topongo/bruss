#!/bin/zsh

set -e

sudo systemctl start docker
docker compose -f app/db/docker-compose.yml up -d
cargo run -p bruss_api


