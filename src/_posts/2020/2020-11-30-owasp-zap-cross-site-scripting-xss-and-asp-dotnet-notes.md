---
published: true
layout: post
title: OWASP ZAP Cross Site Scripting (XSS) and ASP .NET&colon; Notes
categories: Tutorial
tags: aspdotnet dotnet security owasp
---
In this post, I wrote some notes of my experience trying to understand the alerts about the [Cross Site Scripting (XSS)](https://owasp.org/www-community/attacks/xss/) attack while running [OWASP ZAP](https://www.zaproxy.org/) against an ASP .NET project.

{% logo owasp.svg default %}

## OWASP ZAP
OWASP ZAP (short for Zed Attack Proxy) is an open-source web application security scanner. It is intended to be used by both those new to application security as well as professional penetration testers.
{% screenshot owasp-zap-main-screen.png %}
{% caption More at [https://owasp.org/www-project-zap/](https://owasp.org/www-project-zap/) %}

## Cross Site Scripting Weakness (Reflected in JSON Response)
{% screenshot owasp-zap-path-traversal-alert.png %}

As the [Cross Site Scripting (XSS) alert documentation](https://owasp.org/www-community/attacks/xss/) explains:
> Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.

The most common way to use this kind of attack in ASP .NET applications is trying to download some configuration files, like the `web.config` file, from the server file system. By default, the IIS handlers will not allow download this kind of file.

## Validating user input
{% icon programmer.png %}
It is good practice (mandatory in fact) to validate user input, especially on routes/actions where there is some kind of access to the file system.

OWASP ZAP docs say:
> Validate the user’s input by only accepting known good – do not sanitize the data

### ModelState.IsValid
An easy way to perform a basic user input validation is to use the ModelState.IsValid, this property will always be false if any data sent by the client has an invalid or unexpected value. This is a good way to only accepted the expected type for model properties.

> Model state represents errors that come from two subsystems: model binding and model validation. Errors that originate from model binding are generally data conversion errors. For example, an "x" is entered in an integer field. Model validation occurs after model binding and reports errors where data doesn't conform to business rules. For example, a 0 is entered in a field that expects a rating between 1 and 5.


A way that you can extend and either improve the validation is using the [Validation attributes](https://docs.microsoft.com/en-us/aspnet/core/mvc/models/validation?view=aspnetcore-3.1#validation-attributes), like CreditCard, Compare, EmailAddress, Phone, Range, RegularExpression, Required, StringLength, Url, and Remote,

### ValidateModelAttribute
You can even use a custom `ActionFilterAttribute` to validate all your action models like the MS official documentation suggest: [Model Validation in ASP.NET Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/formats-and-model-binding/model-validation-in-aspnet-web-api#handling-validation-errors).

{% gist 8ebd55525bc250095e95db2eb5712aca ValidateModelAttribute.cs %}

And use it on WebApiConfig:
{% gist 8ebd55525bc250095e95db2eb5712aca WebApiConfig.cs %}

Does not matter if you will use Validation attributes or another validation way, the important thing here is `you should always validate the user input before use it`.

## Check all file system handling actions
{% icon telescope.png %}
If you have any action on your API that lets the user define a file system path, be sure to validate if it not passing strings like `../` or `..\`. If you not validate inputs like this, you can allow an attacker to navigate on your app file system, even the host machine file system.

OWASP ZAP docs say:
> Ensure the user cannot supply all parts of the path – surround it with your path code


## False Positives
{% icon problem.png %}
OWASP ZAP can report some false positives, especially for routes that have an argument with the same name of the action: `https://localhost:8080/api/tests/test1?kind=test1`

This happens because OWASP ZAP tries to use action name in all arguments in an attempt to see if can access a different resource or file.

In my case, all reports like this were false positives.

You can change the risk alert to `False Positive` for each URL in the context alert filters:
{% screenshot owasp-zap-alert-false-positive.png %}

{%note Remember: only mark an alert as false positive after had to validate that URL action code and you are certain that is a false positive %}


## Conclusion
{% icon conclusion.png %}
In most cases ASP .NET Web APIs/Apps are not exposed to a Path Traversal attack, but a poor user input validation in file system handling action can easily expose the whole API/APP.

These are the basic rules of OWASP ZAP documents:

### How to identify if you are vulnerable
* Be sure you understand how the underlying operating system will process filenames handed off to it.
* Don’t store sensitive configuration files inside the web root
* For Windows IIS servers, the web root should not be on the system disk, to prevent recursive traversal back to system directories.

### How to protect yourself
* Prefer working without user input when using file system calls
* Use indexes rather than actual portions of file names when templating or using language files (ie value 5 from the user submission = Czechoslovakian, rather than expecting the user to return “Czechoslovakian”)
* Ensure the user cannot supply all parts of the path – surround it with your path code
* Validate the user’s input by only accepting known good – do not sanitize the data
* Use chrooted jails and code access policies to restrict where the files can be obtained or saved to
* If forced to use user input for file operations, normalize the input before using in file io API’s, such as normalize().


{% iconscopyright %}