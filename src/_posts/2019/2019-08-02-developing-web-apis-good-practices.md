---
published: true
layout: post
title: Developing Web APIs - Good Practices
categories: Article
tags: web-api good-pratices
---

Some days ago a coworker asked me what I thought about wich status code a web api should return and if there are some good pratices to follow. When he asked this, I remembered that I've followed some good pratices, most of them based on my emperical knowledge of years of development and consuming web apis. For this reason I wrote this post as a way to organize and document what are those good pratices that I follow. Maybe it can be useful to someone.

The list below is not intended to be right and definitive, there is no silver bullet, but just things that I learned and tested in more of a decade working with web apis. Things that worked for me and my projects can easily not work for you and your projects, because context is other  and challenges too. 

Besides, if you disagree with some of this points, please let a comment in the end of the post, we could learn more with it! 

{% logo webapi.png default %}

# REST or not RESTful?
First of all, build a software that really attend the requisites, that has good code quality and has good performance is more important than follow someone's guidance, with this said I always try to implement REST web apis, but exceptions exists and we need to work with them, so don't try to force some operation than will don't fit well on REST way.

Remember, REST is a style architecture and as every architecture, you can (and most of time should) adapt it for your project needs and capacities.


# Verbs and URLs
Probably the most important rule about web api is to respect the meaning of verbs, this will really make the life easer for those whom are consuming your web api.

* `GET`: to retrieve something.
* `POST`: to create something.
* `PUT`: to complete update something.
* `PATCH`: to partially update something.
* `DELETE`: to delete something

Then, combining with URLs, you get a really clear way to work:

* `GET` 
  * /resource  : returns all resources.
  * /resource/1: returns the resource with id 1.
  
* `POST`
  * /resource: creates a bunch of resources  (rarelly used).
  * /resource/1: Not used.

* `PUT`
  * /resource: complete updates a bunch of resources (rarelly used).
  * /resource/1: complete updates the resource with id 1.

* `PATCH` 
  * /resource: partial updates a bunch of resources (rarelly used).
  * /resource/1: partial updates the resource with id 1.

* `DELETE` 
  * /resource: deletes all resources (rarelly used, mostly never).
  * /resource/1: delete the resource with id 1.

# Status code
I try to keep the range of returned status code small, the smallest one has only 3 status:

* `200`: succesful request.
* `400`: a client error.
* `500` : a server error.

Of course, you can extend this one, like use `201 (created)` to return status for POST verbs, and `401` to unauthorized requests, but try to keep this list small, so it will be easy to who consume your API take decisions about what to do with different status code.

Another good pratice is return an `error code` and an `error message` in the `json` of requests that result in `400` status code (client error), this way the client can react or display different informations to the end user. 
In most cases, `400` status code are about some business logic rule that need to be respect to result in a sucessful request, so provide some information to client can help it to understand what is wrong in the request.


# Versioning
I see a lot of developers using `v1` inside the code to "versioning" their web apis, I really dislike this method, I can understand it is easy to deploy a new web api version to the same virtual application using this technique, but we need to agree that we do versioning using some SCM, like Git, SVN and Mercurial with everything else that correspond to our code, why should we do versioning inside the code in the case of web api?

In most of case your web api will have only one version, especially when you are developing a `SPA` app and it is the only client of your web api.

> Versioning of APIs is a controversial topic—you will find a lot of contradictory guidance on the internet.
> The pattern that is most commonly practiced is probably the one with a version identifier in a path
segment of URLs. Since there is little consensus on versioning, simply offering our opinions on the topic may not be very helpful, but we offer two thoughts:
> 1. Doing nothing at all for API versioning is an intelligent approach that is getting more attention
> 2. Links and version identifiers in URLs make awkward bedfellows
{% caption [Web API Design: The Missing Link](https://cloud.google.com/files/apigee/apigee-web-api-design-the-missing-link-ebook.pdf) %}

## My web api really need versions
In this case, the approach that I use is create a new site/virtual application every time that I need to publish a major version of my web api, so, in the code of the routes there is no `v1`, `v2` and so on.

Let say I have a web api publish on `http://diegogiacomelli.com.br/sample-api/v1`, than I made some breaking changes to the public interface of the web api and need to publish another version in a separated url to avoid any impact to the users that still use the old `v1`. I will just create the new `v2` virtual application, and the urls will be:

* `http://diegogiacomelli.com.br/sample-api/v1`
* `http://diegogiacomelli.com.br/sample-api/v2`


In a moment in future you will want to remove the support to the `v1` version, in that moment you could configure your virtual application to redirect (status code `301` or `302`) to the next/latest version.

> Of course, it's a good pratice too have some public changelog about your web api versions releases to notify the clients developers.

# Describing
In the field of how to describe a web api REST I can cite `Swagger`. It is not a attempt to create a WSDL like to web api REST, but it is a good attempt to create an open standard for describing web apis REST.

Swagger is a specification and complete framework implementation for describing, producing, consuming, and visualizing RESTful web services.

I use Swagger a lot and really love it, mainly because Swagger UI that allow you generate a nice live console and documentation for your web api.

There are many implementations of Swagger for most of languages: C#, Java, Python, Ruby, etc.

If you are using ASP .NET Web API, there a some projects to auto generate the Swagger specification, like [Swashbuckle.AspNetCore](https://github.com/domaindrivendev/Swashbuckle.AspNetCore).

> Swagger is very popular nowadays, but if you never see it in action, take a look on [Marvel API](https://developer.marvel.com/docs) that use Swagger and Swagger UI.

# Other conventions and good pratices
To keep our lifes as developers easier is good to define some conventions of how our web api REST will behave, the best effort I know in this field are the very good **Apigee e-books**. The e-books are not an attempt to create a bible or a mantra about how to design your api, but rather a collection of conventions observed in large web REST apis, like Twitter, Facebook, Linkedin, Google, etc.

> Most of the good pratices that I used, tested and mentioned in this post I learned from my experience and Apigee books.

# Conclusion
I probably forgot some learnings that I still use in my web apis developing, maybe because it's so common to perform it that I even do not notice them, but the ones cited above I think are the most remarkable.

# Further readings
I really recommend you to read the books bellow, they have detailed a lot of good practices about how do develop good web apis and can help you to design yours.

* [Web API Design](https://pages.apigee.com/rs/apigee/images/api-design-ebook-2012-03.pdf)
> The success of an API design is measured by how quickly developers can get
up to speed and start enjoying success using your API.

* [Web API Design: The Missing Link](https://cloud.google.com/files/apigee/apigee-web-api-design-the-missing-link-ebook.pdf)
> When you design any interface, you should try to put yourself in the shoes of the user

{% iconscopyright %}