FROM ruby:2.3.1

RUN gem install bundler

# java is needed (apparently) for rails asset compilation
#RUN apt-get update && apt-get install -y openjdk-7-jdk && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
#RUN apt-get update && apt-get install -y mysql-client postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Preinstall gems. This will ensure that Gem Cache wont drop on code change
WORKDIR /tmp
ADD ./puppies/Gemfile Gemfile
ADD ./puppies/Gemfile.lock Gemfile.lock
RUN (bundle check || bundle install)
# For praduction you want to do something like:
# RUN (bundle check || bundle install --without development test)

RUN mkdir /app
ADD ./puppies/ /app
WORKDIR /app
RUN (bundle check || bundle install)
# For praduction you want to do something like:
# RUN (bundle check || bundle install --without development test)

ADD ./docker/start_server.sh /usr/local/bin/
CMD bash /usr/local/bin/start_server.sh
