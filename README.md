# AWS ElasticBeanstalk Ruby on Rails Docker

In this Article/Talk we are going to demonstrate how to set up existing
Rails project wrapped in Docker container under AWS ElasticBeanstalk.

[AWS Elastic Beanstalk]() (further referenced as EB)
is product  from Amazon Web Services that provides easy to set up load
balanced enviroment of EC2 instances, with some basic preconfigured
metrics (Cloudwatch) and easy to configure autoscaling setups.

> Think about it as a wizard (next next next) setup that results to




## Dummy project

As you can see the Docker related file are in root path of this
directory, while the Rails application `puppies` is in own directory.
The reason for this is to demonstrate the clear separation of "Docker"
related files and the Rails project. Normaly I would leave the
`Dockerfile` and `docker-compose.yml` in same directory as the
Rails/Rack project.


 








# steps


```
gem install bundler rails

rails new puppies --skip-test --skip-action-mailer

rake db:create
```
