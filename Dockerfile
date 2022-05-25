FROM node:18-bullseye

ARG PUBLISHER_TAG

WORKDIR /ig

RUN \
    apt-get update \
    && apt-get install -y \
    openjdk-11-jre-headless \
    ruby-full build-essential \
    zlib1g-dev \
    jq \
    && rm -rf /var/lib/apt/lists/*

RUN test -n "$PUBLISHER_TAG" \
    && gem install bundler jekyll \
    && mkdir /app \
    && curl -L "https://github.com/HL7/fhir-ig-publisher/releases/download/$PUBLISHER_TAG/publisher.jar" -o /app/publisher.jar

COPY copy/* /app/

ENTRYPOINT [ "/app/entrypoint.sh"]
#ENTRYPOINT ls -la