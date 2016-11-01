threads_count = ENV.fetch("MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

bind "unix:///var/run/puppies-puma-app.sock?umask=0000"

stdout_redirect "/var/log/puppies-puma.stdout.log", "/var/log/puppies-puma.stderr.log", true

environment ENV.fetch("RAILS_ENV") { "development" }

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
