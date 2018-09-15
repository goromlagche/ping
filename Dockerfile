FROM ruby:2.4.2-alpine3.6

RUN apk add --update --no-cache build-base curl

ENV APP_HOME /web
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN gem install bundler && bundle install --without development test --jobs 4 --retry 3

ADD . $APP_HOME/

RUN cp $APP_HOME/config/docker/database.yml $APP_HOME/config/database.yml;

CMD bundle exec rails s -b "0.0.0.0" -p 3000
