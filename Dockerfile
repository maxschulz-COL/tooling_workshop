FROM python:3.12-slim-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Download the installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer with a specific version (0.6.9) then remove it
RUN sh /uv-installer.sh --version 0.6.9 && rm /uv-installer.sh

# Set up a working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Create a non-root user
RUN useradd -m -s /bin/bash appuser
USER appuser

# Add .local/bin to PATH for the non-root user
ENV PATH="/home/appuser/.local/bin:/root/.local/bin:${PATH}"

CMD ["bash"] 