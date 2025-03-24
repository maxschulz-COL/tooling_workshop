FROM python:3.12-slim-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy UV binaries from the official image with specific version
COPY --from=ghcr.io/astral-sh/uv:0.6.9 /uv /uvx /bin/

# Set up a working directory
WORKDIR /workspaces/tooling_workshop

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

CMD ["bash"] 