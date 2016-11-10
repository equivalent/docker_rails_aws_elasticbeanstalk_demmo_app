
$ git clone git@github.com:equivalent/docker_rails_aws_elasticbeanstalk_demmo_app.git
$ cd docker_rails_aws_elasticbeanstalk_demmo_app/

$ docker-composer build
$ docker-composer push

$ cd aws_elastic_beanstalk
$ ls Dockerrun.aws.json  README.md

# $ eb init   # login + initialize EB env
$ eb deploy

$ eb status
$ eb events

$ eb ssh
