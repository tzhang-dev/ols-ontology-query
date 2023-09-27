FROM ruby:3.1.4

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

ENV OLS_DOCKER_ENV=True
COPY . .
RUN bundle install

ENTRYPOINT ["ruby", "main.rb"]