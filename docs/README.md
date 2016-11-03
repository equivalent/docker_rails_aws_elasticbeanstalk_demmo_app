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

The difference is that Docker image consist of layers that are based on
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


## Inside VM

Now once 



