FROM node:18-bullseye

RUN \
    apt-get update \
    && apt-get install -y \
    openjdk-11-jre-headless \
    ruby-full build-essential \
    zlib1g-dev \
    jq \
    && gem install bundler jekyll \
    && rm -rf /var/lib/apt/lists/*

