FROM ruby:2.7-bullseye

ARG PUBLISHER_TAG

WORKDIR /ig

RUN apt-get update \
    && apt-get install -y \
    openjdk-11-jre-headless \
    ruby-full build-essential zlib1g-dev jq \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler jekyll

RUN test -n "$PUBLISHER_TAG"

RUN mkdir /app && curl -L "https://github.com/HL7/fhir-ig-publisher/releases/download/$PUBLISHER_TAG/publisher.jar" -o /app/publisher.jar

ENTRYPOINT ["java", "-jar", "/app/publisher.jar"]
#ENTRYPOINT ls -la