FROM node:20-bookworm

RUN \
    apt-get update \
    && apt-get install -y \
    openjdk-17-jre-headless \
    ruby \
    ruby-dev \
    build-essential \
    zlib1g-dev \
    jq \
    && gem install --no-document bundler jekyll \
    && rm -rf /var/lib/apt/lists/* \
