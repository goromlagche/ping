FROM ruby:2.4.2

RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev

ENV APP_HOME /web
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN gem install bundler && bundle install --without development test --jobs 4 --retry 3

ADD . $APP_HOME/


EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
