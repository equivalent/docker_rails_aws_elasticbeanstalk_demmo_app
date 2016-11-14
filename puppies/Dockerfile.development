FROM ruby:2.3.1

RUN gem install bundler

# Preinstall gems. This will ensure that Gem Cache wont drop on code change
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN (bundle check || bundle install)

RUN mkdir /app
ADD ./ /app
WORKDIR /app
RUN (bundle check || bundle install)

CMD bash script/start_server.sh
