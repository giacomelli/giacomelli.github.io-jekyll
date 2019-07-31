---
published: true
layout: post
title: MoreWeb API - Good Pratices
categories: Article
tags: web-api
---

These days a cowork asked me what are the good pratices or what do I thought about wich status code a web api should return. When him asked this, I remember that I've follow some good pratices, most of them based on my emperical knowledge of years of development and consuming web apis. For this reason I wrote this post as a way to organize e stand for what are those good pratices that I follow. I hope it can be useful to someone.


# REST and RESTful
First of all, most important than restrict follow some guidance is build a software that really attend the requisites, is good write and has good performance, that said I always try to implement REST web apis, but exceptions exists and we need to work with them, so don't try to force some operation than will don't feet well on REST way.

Remember, REST is a style architecture and as all architecture you can (and most of time should) adapt for your project needs and capacities.


# Verbs and urls
Probably the most important rule about web api is respect the verbs meaning, this will really make the life of whom is consuming your web apis easer.

GET: to retrieve something.
POST: to create something.
PUT: to update something.
PATCH: to partial update something.
DELETE: to delete something

Then, combining with end-points, you get a really clear way to work:

| VERB | URL | behavior  | comments  |   |
|---|---|---|---|---|
| GET | /resource | Returns all resources  |   |   |
| GET | /resource/1  | Return the resource with id 1   |   |   |
| POST | /resource   | Create a bunch of resources  | Rarelly used   |   |
| POST | /resource/1   | ??? | Not used  |   |
| PUT | /resource   | ??? | Update a bunch of resources  | Rarelly used  |
| PATCH | /resource/1   | ??? | Partial update the resource with id 1  |   |
| PATCH | /resource   | ??? | Partial update a bunch of resources  | Rarelly used  |
| DELETE | /resource   | ??? | Delete all resources  | You probably do not want this one ;)  |
| DELETE | /resource/1   | ??? | Delete the resource with id 1  |   |

# Status code
I try to keep the range of returned status code small, the shortned one is just 3 status:

200: Ok.
400: A client error.
500: A server error.

Of course, you can extended this one, like use 201 (created) to return status for POST verbs, and 401 to no authorized request, but try to keep this list small, so will be easy to who consume your API take decisions about what to do with different status code.

Another good pratice is return a `ErrorCode` and a `ErrorMessage` on requests that result in 400 status code (client error), this way the client can react or display different informations to the end user. 
In most of case `400` status code are about some business logic rule that need to be respect to request perform sucessful, as for example:

* The client must have a valid PO box.
* You must select a delery method.


# Versioning
I saw a lot of developers using `v1` inside the code to "versioning" their web apis, I really dislike this method, I can understand that this is easy to deploy a new web api version to the same vitual application using this technique, but we need to agree that we dont do versioning in code, we do versioning in using some SCM, like Git, SVN and Mercurial, with everything else that correspond to our code, why should we do versioning inside the code in the case of web api?

The approacth that I use is create a new site/virtual application every time that I need to publish major versioning of my web api, so, in the code of the routes there is no `v1` or `v2`.

Let say I have a web api publish on `http://diegogiacomelli.com.br/sample-api/v1`, than I made same breaking changes to the public interface of the web api and need to publish another version in a separated url to no impact the users that still use the old `v1`? I will just create the new `v2` virtual application, and the urls will be:

* `http://diegogiacomelli.com.br/sample-api/v1`
* `http://diegogiacomelli.com.br/sample-api/v2`

> Note: avoid to publish the first version of your web api without the `v1` on the url. It's better that every client knows the exactly version of the web api they are using. If a client call `http://diegogiacomelli.com.br/sample-api` without the version suffix it should receive a error and not be redirect to latest web api version.


In a moment in future you will want to remove the support to the `v1` version, in that moment you could configure your virtual application to redirect (status code 301 or 302) to redirect to the next/latest version.

> Of course, it's a good pratice too have some public changelog about your web api versions releases.

# Describing
In the field of how to describe a web api REST I can cite `Swagger`. It is not a attempt to create a WSDL like to web api REST, but it is a good attempt to create an open standard for describing web apis REST.

Swagger is a specification and complete framework implementation for describing, producing, consuming, and visualizing RESTful web services.

I use Swagger a lot and really love it, mainly because Swagger UI that allow you generate a nice live console and documentation for your web api.

There are many implementations of Swagger for most of languages: C#, Java, Python, Ruby, etc.

If you are using ASP .NET Web API, there a some projects to auto generate the Swagger specification, like [Swashbuckle.AspNetCore](https://github.com/domaindrivendev/Swashbuckle.AspNetCore).

# Other convetions and good pratices

To keep our lifes as developers easier is good define some conventions of how our web api REST will behave, the best effort I know in this field is the very good Apigee - Web Api Design ebook. The e-book is not an attempt to create a bible or a mantra about how to design your api, but rather a collection of conventions observed in large web REST apis, like Twitter, Facebook, Linkedin, Google, etc.

> Most of the good pratices that I used, tested and mentioned in this post I learned from Apigee books.

# Further readings
* https://softwareengineering.stackexchange.com/questions/252294/why-is-there-no-wsdl-type-support-for-web-api/252330?noredirect=1#comment708841_252330
* https://pages.apigee.com/rs/apigee/images/api-design-ebook-2012-03.pdf
* https://cloud.google.com/files/apigee/apigee-web-api-design-the-missing-link-ebook.pdf
* https://stackoverflow.com/questions/389169/best-practices-for-api-versioning?rq=1