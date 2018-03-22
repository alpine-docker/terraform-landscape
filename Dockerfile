FROM ruby:alpine

# Need docker build arg, such as --build-arg VERSION=0.1.17
ARG VERSION

RUN gem install terraform_landscape -v ${VERSION}

WORKDIR /apps

ENTRYPOINT ["landscape"]
CMD ["--help"]
