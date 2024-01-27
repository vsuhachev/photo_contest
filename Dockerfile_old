FROM ruby:2.3-alpine

MAINTAINER Vasiliy Sukhachev <vsuhachev@yandex.ru>

RUN set -ex \
    \
    && apk add --no-cache --virtual .ruby-rundeps \
        postgresql-client \
        imagemagick \
        tzdata \
        file

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY Gemfile /opt/app/
COPY Gemfile.lock /opt/app/

RUN set -ex \
    \
    && apk add --no-cache --virtual .ruby-builddeps \
        postgresql-dev \
        ruby-dev \
        build-base \
    \
    && bundle install --without test development assets \
    && rm /usr/local/bundle/cache/*.gem \
    \
    && apk del .ruby-builddeps


COPY . /opt/app

EXPOSE 3000

VOLUME ["/opt/app/public/uploads"]

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

ENV RAILS_ENV=production PORT=3000

CMD ["bin/rails", "server"]
