FROM node:20-bookworm

RUN \
    apt-get update \
    && apt-get install -y \
    openjdk-17-jre-headless \
    ruby-full build-essential \
    zlib1g-dev \
    jq \
    && gem install bundler jekyll \
    && rm -rf /var/lib/apt/lists/* \



