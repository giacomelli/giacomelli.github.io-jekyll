---
published: true
layout: post
title: unitytips&colon; Expression body definition
categories: Article
tags: unity3d unitytips csharp
---
When you have a single line method, you can use [expression body definition](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/lambda-operator#expression-body-definition) do simplify and reduce the lines of code:

{% screenshot expression-body-definition-methods.gif %}

> Expression body definitions for methods and read-only properties are supported starting with C# 6. Expression body definitions for constructors, finalizers, property accessors, and indexers are supported starting with C# 7.0.

So you can use the expression body definition for other members, like properties:
{% screenshot expression-body-definition-properties.gif %}

