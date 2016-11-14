# AWS ElasticBeanstalk Ruby on Rails Docker

Pre-built application (puppies app) Docker images:

* https://hub.docker.com/r/equivalent/eb-demo-rails/
* https://hub.docker.com/r/equivalent/eb-demo-nginx/

### Running production application locally

Production version of `docker-composer.yml` is located in root folder.

All you need to:

1.  [install Docker](https://docs.docker.com/engine/installation/) and [docker-composer](https://docs.docker.com/compose/install/)
2. `$ git clone git@github.com:equivalent/docker_rails_aws_elasticbeanstalk_demmo_app.git` and `$ cd docker_rails_aws_elasticbeanstalk_demmo_app`
3. `$ docker-composer up` or `$ sudo docker-composer up`

### Running production application on AWS Elastic Beanstalk

Elastic Beanstalk's `Dockerrun.aws.json` is located in `./aws_elastic_beanstalk`. In that
folder is seprate [README.md](https://github.com/equivalent/docker_rails_aws_elasticbeanstalk_demmo_app/blob/master/aws_elastic_beanstalk/README.md) file containing useful
information on AWS ELastic Beanstalk CLI

Steps to lunch "puppies" demo application in AWS Elastic Beanstalk:

1. Configure new Docker based AWS Beanstalk Enviroment, PostgreSQL RDS, Redis Elastic Cache and
   ensure the Security Groups are set in a way that endpoints can
   communicate to each other. In order to achieve this you can follow
   steps in this article: http://www.eq8.eu/blogs/34-set-up-aws-elastic-beanstalk
2. `$ git clone git@github.com:equivalent/docker_rails_aws_elasticbeanstalk_demmo_app.git` and `$ cd docker_rails_aws_elasticbeanstalk_demmo_app`

Web interface deployment:

3. Once in the configured EB environment, from web interface Click "Upload" and chose 
   `./aws_elastic_beanstalk/Dockerrun.aws.json`.

CLI deployment:

3. [Install](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html) and set-up
   EB CLI. You can find my instructions on EB CLI [here](https://github.com/equivalent/docker_rails_aws_elasticbeanstalk_demmo_app/blob/master/aws_elastic_beanstalk/README.md)
4. `$ cd ./aws_elastic_beanstalk` and `$ eb deploy`


## Other Resources

how to install docker

* https://docs.docker.com/engine/installation/linux/ubuntulinux/



##### How the Ruby on Rails application was generated

```bash
mkdir docker_rails_aws_elasticbeanstalk_demo_app
cd docker_rails_aws_elasticbeanstalk_demo_app

gem install bundler rails

rails new puppies --skip-test --skip-action-mailer

rake db:create
rake db:seed
```
