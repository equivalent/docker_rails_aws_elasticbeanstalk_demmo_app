# AWS ElasticBeanstalk Ruby on Rails Docker

This is a Demo application related to the talk
[AWS Elastic Beanstalk & Docker for Rails developers](http://www.eq8.eu/talks/2-aws-elastic-beanstalk-and-docker-for-rails-developers)

**>>>>[Talk Video](https://www.youtube.com/watch?v=xhEyUYTuSQw)<<<<**

Pre-built application (puppies app) Docker images:

* https://hub.docker.com/r/equivalent/eb-demo-rails/
* https://hub.docker.com/r/equivalent/eb-demo-nginx/

## Usage

Clone this repo and `cd` into it:

```sh
$ git clone git@github.com:equivalent/docker_rails_aws_elasticbeanstalk_demmo_app.git
$ cd docker_rails_aws_elasticbeanstalk_demmo_app
```

Once the application is running and is successfully connected to DB be sure to
run `rake db:seed` inside the container. You can leart out how to run commands
inside Docker container [here](https://github.com/equivalent/docker_rails_aws_elasticbeanstalk_demmo_app#how-to-debug-app-in-docker-containers).

### Running production application locally

Production version of `docker-compose.yml` is located in the root folder of
this git repo.

to run in **production** mode, all you need to do:

1.  [install Docker](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install/)
2. `$ docker-compose up` or `$ sudo docker-compose up`

##### Running application locally (development mode)

`docker-compose -f docker-compose-development.yml up`

### Running production application on AWS Elastic Beanstalk

Elastic Beanstalk's `Dockerrun.aws.json` is located in `./aws_elastic_beanstalk`.

 In that folder is separate [README.md](https://github.com/equivalent/docker_rails_aws_elasticbeanstalk_demmo_app/blob/master/aws_elastic_beanstalk/README.md) file containing useful information on AWS Elastic Beanstalk CLI

##### Steps to lunch "puppies" demo application in AWS Elastic Beanstalk:

**Step 1:** Configure new Docker based AWS Beanstalk Enviroment, PostgreSQL RDS, Redis Elastic Cache and
ensure the Security Groups are set in a way that endpoints can
communicate to each other. In order to achieve this you can follow
steps in this article: http://www.eq8.eu/blogs/34-set-up-aws-elastic-beanstalk

###### Web interface deployment:

**Step 2:**: Once in the configured EB environment, from web interface Click "Upload" and chose 
`./aws_elastic_beanstalk/Dockerrun.aws.json`.

###### CLI deployment:

**Step 2:**: [Install](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)
and [configure](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html)
EB CLI. You can find my instructions on EB CLI [here](https://github.com/equivalent/docker_rails_aws_elasticbeanstalk_demmo_app/blob/master/aws_elastic_beanstalk/README.md)

**Step 3:** `$ cd ./aws_elastic_beanstalk` and `$ eb deploy`

## Nginx proxy container

Nginx image source code located in `./nginx` folder.


## How lunch stuff / debug app inside the Docker containers

From host machine you can lunch:

```sh
bash docker/puppiesbash.sh    # enter bash in the puppies_web container
bash docker/puppiesconsole.sh # enter rails console in the puppies_web container
bash docker/puppiespry.sh     # pry debugger - where you introduce `binding.pry`

bash docker/nginxbash.sh      # enter bash in the proxy container
```

Or manually type:

```sh
docker ps
docker exec -it xxIdOfAContainerxx  bash
```

## How to Build Docker image and how to push a change to Docker registry

```sh
docker-compose build
docker-compose push
```

## Other Resources

##### Articles

* http://www.eq8.eu/blogs/25-common-aws-elastic-beanstalk-docker-issues-and-solutions

##### How the Ruby on Rails application was generated

```bash
mkdir docker_rails_aws_elasticbeanstalk_demo_app
cd docker_rails_aws_elasticbeanstalk_demo_app

gem install bundler rails

rails new puppies --skip-test --skip-action-mailer

rake db:create
rake db:seed
```
