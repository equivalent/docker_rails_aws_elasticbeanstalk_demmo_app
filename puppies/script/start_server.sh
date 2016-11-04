# sleep 999999   # if you need to debug the container before starting server uncomment this line

if [ "$CONTAINER_ROLE" == "bg_worker" ]
then
  bundle exec sidekiq
elif [ "$CONTAINER_ROLE" == "app_server" ]
then
   bundle exec rake db:migrate && bundle exec puma -C /app/config/puma.rb
else
  echo "Error: unknown CONTAINER_ROLE"
  exit 125
fi
