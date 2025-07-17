FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /app

COPY uv.lock pyproject.toml ./
COPY src/common_lib src/common_lib
RUN uv sync --compile-bytecode --locked --no-install-project

COPY src src
RUN uv sync --locked
