---
published: true
layout: post
title: Google Mobile Ads GetClientFactory exception
categories: Article
tags: unity3d gamedev android google-mobile-ads
---
{% logo Unity3d.png default %}

## The problem
{% icon problem.png %}
If you're experiencing this error when trying to initialize Google Mobile Ads Unity Plugin on an Android device:
{% gist 5a0d001b36432bf7807f08d8f525f1d7 problem.sh %}

It is quite possible that you are facing problems with the linker.

## Solution
{% icon solution.png %}
Open your `Assets/link.xml` file and add the lines below:
{% gist 5a0d001b36432bf7807f08d8f525f1d7 solution.xml %}

## Conclusion
{% icon conclusion.png %}
There are probably other causes for this error, but in my case, when using Unity 6000.0.23f1 with [Google Mobile Ads Unity Plugin](https://developers.google.com/admob/unity/quick-start) 10.4.2, this was the solution.
{% iconscopyright %}