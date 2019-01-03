FROM ruby:alpine

# Need docker build arg, such as --build-arg VERSION=0.1.17
ARG VERSION

RUN apk add --update --virtual alpine-sdk && \
    gem install terraform_landscape -v ${VERSION} && \
    apk del alpine-sdk && \
    rm -f /var/cache/apk/*

WORKDIR /apps

ENTRYPOINT ["landscape"]
CMD ["--help"]
