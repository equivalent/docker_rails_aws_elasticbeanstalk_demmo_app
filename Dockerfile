FROM ruby:2.3.1

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /box-bundle

# CMD sleep 9999


CMD (bundle check || bundle install) \
  && bundle exec rake db:migrate \
  && bundle exec puma -C /app/config/puma.rb
