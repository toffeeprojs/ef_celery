FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /code

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        cargo

COPY uv.lock pyproject.toml ./
COPY src/common_lib src/common_lib
RUN uv sync --compile-bytecode --locked --no-install-project

RUN apk del .build-deps

COPY src src
RUN uv sync --locked
