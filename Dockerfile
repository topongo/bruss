FROM rustlang/rust:nightly-slim AS base_stage

# get system ssl build dependencies
RUN apt-get update && apt-get -y install musl-tools

# setup alpine host
RUN rustup target add x86_64-unknown-linux-musl
ENV CARGO_BUILD_TARGET=x86_64-unknown-linux-musl
ENV CARGO_BUILD_FLAGS="--release"

# fetch and build dependencies
WORKDIR /app
COPY Cargo.toml .
COPY router/Cargo.toml router/Cargo.toml
COPY config/Cargo.toml config/Cargo.toml
COPY data/Cargo.toml data/Cargo.toml
COPY tt/Cargo.toml tt/Cargo.toml
COPY app/api/Cargo.toml app/api/Cargo.toml
RUN for i in router config data tt app/api; do mkdir -p $i/src && touch $i/src/lib.rs; done
RUN mkdir -p router/src/route router/src/fetch
RUN echo "fn main() {}" | tee router/src/route/main.rs > router/src/fetch/main.rs

RUN cargo build --release

# build tt
FROM base_stage AS tt_stage
COPY tt/src tt/src
RUN touch tt/src/lib.rs
RUN cargo build --release -p tt

# build data
FROM tt_stage AS data_stage
COPY data/src data/src
RUN touch data/src/lib.rs
RUN cargo build --release -p bruss_data

# build config
FROM data_stage AS config_stage
COPY config/src config/src
RUN touch config/src/lib.rs
RUN cargo build --release -p bruss_config


# build router
FROM config_stage AS router_stage
COPY router/src router/src
RUN touch router/src/fetch/main.rs router/src/route/main.rs router/src/lib.rs
RUN cargo build --release -p bruss_router

# build api
FROM config_stage AS api_stage
COPY app/api/src app/api/src
RUN touch app/api/src/main.rs
RUN cargo build --release -p bruss_api

# runner
FROM alpine AS runner
WORKDIR /app
COPY --from=router_stage /app/target/x86_64-unknown-linux-musl/release/bruss_route /app/target/x86_64-unknown-linux-musl/release/bruss_fetch /usr/bin/
COPY --from=api_stage /app/target/x86_64-unknown-linux-musl/release/bruss_api /usr/bin/bruss_api

