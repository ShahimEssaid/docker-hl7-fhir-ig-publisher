FROM sessaid/ig-publisher-base:latest

ARG PUBLISHER_TAG

WORKDIR /ig

RUN test -n "$PUBLISHER_TAG" \
    && gem install bundler jekyll \
    && mkdir /app \
    && curl -L "https://github.com/HL7/fhir-ig-publisher/releases/download/$PUBLISHER_TAG/publisher.jar" -o /app/publisher.jar

COPY copy/* /app/

ENTRYPOINT [ "/app/entrypoint.sh"]
