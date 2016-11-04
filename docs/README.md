## Outline


In terms of structure of this talk,  I first want to talk about philosophy of Docker
deployments, then philosophy of how Amazon Web Services look at
infrastructure in terms of their products,
then some theory of what is ElasticBeanstalk and how to use it.
And at the very end I'll show you some real examples.

## Example Application

In this talk we will be describing deployment of an example application
in which we will have our "cool Ruby on Rails" application.
Of course we need some background processing worker. This can be either
Resque, Background  Job  or Sidekiq.

As for the primary relational data storage we will use PostgreSQL. For
data cache and background worker primary data store we will use Redis.
And we will use Nginx for some web-server/app-server proxy heavy lifting.


## Clasic Approach

Now the clasic approch would be to set up and configure all these
technologies on your laptop and then  setup the technologies on
Server either manually or using  Puppet or Chef or Capistrano (or whatever).

Then once all this is done we will just deploy the code to this server.

## Docker Approach

Now with the Docker Approach you would wrap every individual technology
into "Docker image" that is shipable with all it's configuration and content.

I don't want to go into too much depth of how
Docker really works, there are already many better talks explaining that. In
brief you can think about Docker image as you would about virtual machine image,
meaning it's entire stack from Operating System layer till the
technology you are using.

Amongs other, the main difference is that Docker image consist of layers that are based on
ordered root fylesystem changes and those layers can be cached.
Therfore you only deploy the top layers that has been changed.

For example in our Ruby on Rails web image, if I make a code change maybe
only 1 or 2 layers are changed. If I update a gem and bundler needs to
run. it will be more layers. Even more layes if I change ruby version
and so on.

Another nice thing is that you can share lot of the bottom layers
between different images.

But the point is you are not transfering 1GB image but only few
Megabytes, depening on layer change size.


In order to actually use your Images in production server, the main
approach is that you build your images in your laptop, you test if
everything work, you push them to so-called "Docker Regigistry" and you tell your
server to pull those images.
Now again the nice thing is that your server will pull only those layers
that were changed.

If you think "hmm this kinda resamble how Capistrano local git -,
Github - server git deployment works" then you are getting the point.

There is also a different approach that you don't build your docker
images in your laptop, but rather cloud solutions will build docker
image each time you push a code change to Github, and maybe even deploy those to your server.
But these solutions are outside the scope of this talk.

But the core idea is that Docker image is in the  Registry and Server pulls those images.


## Linking Docker Containers

Now once you've deployed your docker images you want to lunch them.

Runtime instances of Docker image is called "Docker Container" that's
why I'll be refering about these boxes as "containers" rather than
"images"

You want to lunch your instances so that relevant containers
are linked  to each other.

You can achive this bu using direct `docker run` options:

```
docker run -d --name puppies_web --link db:db puppies_rails
```

...but in reality this command gets too long.

Better way is to use `docker-composer` which will basically achive the
same by loading configuration from YAML   file.

The "linking" will end up setting your `/etc/hosts` with the host
reference, so all you will have to do in your application is tell it
that you want to connect to host "db" or host "redis"

In reality there is more then just `link`. You need to set environment
variables, mount volumes and so on. But this is the basic principal.


## Inside VM

So on your server or VM you will end up with fully linked containers.

But one thing lot of developers missed out is that you can split out
different containers to different VMs.

 Let say you extract your
Relational Database container to one VM, your Redis container to another
VM and your keep one VM to the core Application containers.

Even more if you discover that your Application VM is runnig out of
memory or you want introduce more Threads for puma server you can
extract your worker out to own VM too.


# AWS approach

Now we finally getting to the part were we start talking about AWS and
AWS Elastic Beanstalk

# AWS approach to infrastructure

First we need to understand how AWS look at your infrastructure
problems. AWS been on the market for quite some time, they introduced
many products and solutions for pretty much any problem you may have.

I'll just mention some that will be needed for this talk.

I think pretty much everyone worked with S3 at least everyone who was
trying to upload images on a Heroku application.

EC2 is prety much their product for provisioning VMs

ELB is a loadbalancer product, so basically when you need to distribute
load between multiple EC2 instances

RDS is their Relational Database Solution, so you can run your Postgres
database and they will take care of snapshots and recovery 

ElasticCache is similar thing like RDS but for Redis or Memcache
clusters

and CloudWatch is for monitoring of resources

