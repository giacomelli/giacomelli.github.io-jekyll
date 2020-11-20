---
published: true
layout: post
title: unitytips&colon; Property Patterns
categories: Article
tags: unity3d unitytips csharp csharp-8-new-features
---
Unity started to supporting C# 8.0 with version [2020.2 beta](https://unity3d.com/beta/2020.2b) and now we can start to use some [new features](/tags/csharp-8-new-features) like the [Property Pattern](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#property-patterns).

{% screenshot unitytips-property-patterns.gif %}

## Introduction
`Property Patterns` enables you to match on properties of the object examined in a [Switch Expressions](/unitytips-switch-expressions).

> The switch expression provides for switch-like semantics in an expression context. It provides a concise syntax when the switch arms produce a value.


## Sample
In this sample, we will calculate the damage that an NPC can cause taking into account if it is an enemy, and if it is armed.
{% gist 44acd57a97fdef861787037b96167a74 property-pattern.cs %}
