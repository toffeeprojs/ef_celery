FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /app

COPY requirements.txt .
RUN uv pip install --system --no-cache -r requirements.txt

COPY src .
