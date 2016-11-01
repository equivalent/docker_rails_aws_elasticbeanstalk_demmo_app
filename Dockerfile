FROM ruby:2.3.1

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

# CMD sleep 9999

CMD (bundle check || bundle install) \
  && bundle exec rake db:migrate \
  && bundle exec puma -C /app/config/puma.rb
