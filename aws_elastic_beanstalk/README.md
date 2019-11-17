# EB CLI



I recommend  to create a new AWS EB application via Web interface as
described in this article: http://www.eq8.eu/blogs/34-set-up-aws-elastic-beanstalk
and only then use this app

http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html


## Install


Since 2019 the instalation process of AWS EB CLI has changed ([source](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html))
In ordrer to install the CLI you need to clone and run this repo: https://github.com/aws/aws-elastic-beanstalk-cli-setup



###  config

```
eb init   # set up your login and region
          # Go to AWS Identity and Access Management (IAM) product and
          # create a new user => that will generete credentials (secret
          # ID and key)

```

`eb init` will generate file in `~/.aws/config` with your AWS credentials and
will generate `.elasticbeanstalk/config.yml` in this folder. The content
will be similar to this:

```
branch-defaults:
  default:
    environment: puppiesDemo-env
environment-defaults:
  puppiesDemo-env:
    branch: null
    repository: null
global:
  application_name: puppies-demo
  default_ec2_keyname: puppies
  default_platform: 64bit Amazon Linux 2016.09 v2.2.0 running
Multi-container Docker
    1.11.2 (Generic)
  default_region: eu-west-1
  profile: eb-cli
  sc: null
```

### Usage

In all examples I expect that you've `cd` to the folder where  this README.md file
is located.

```sh
cd docker_rails_aws_elasticbeanstalk_demmo_app/aws_elastic_beanstalk/
```

##### Deployment

```sh
eb deploy
```

##### Status and events

```sh
eb status
eb event
```

##### SSH to the server

Given you have the Puppies.pem in your `~/.ssh/` folder

```sh
eb ssh
```



--------------

# Old instructions


### how to install (old not working)

* http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html
* http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html

```
# pip is python package manager

pip install --upgrade --user awsebcli   # install eb cli
```
