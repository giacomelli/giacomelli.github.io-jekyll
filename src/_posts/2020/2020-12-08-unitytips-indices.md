---
published: true
layout: post
title: unitytips&colon; Tuple Patterns
categories: Article
tags: unity3d unitytips csharp csharp-8-new-features
---
Unity started to supporting C# 8.0 with version [2020.2 beta](https://unity3d.com/beta/2020.2b) and now we can start to use some [new features](/tags/csharp-8-new-features) like the [Indices]https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#indices-and-ranges).

{% screenshot unitytips-indices.gif %}

## Introduction
Indices provide a succinct syntax for accessing single elements in array/collection.

 Consider the array below: 
 {% gist ce61f91a53e1f1524905d93c5cac3301 Indices.cs %}
 * The 0 index is the same as sequence[0]. 
 * The ^0 index is the same as sequence[sequence.Length]. 
 

 > Note that sequence[^0] does throw an exception, just as sequence[sequence.Length] does. For any number n, the index ^n is the same as sequence.Length - n.

## Sample
In this sample MonoBehaviour, we will get the message to indicate the winner of the game rock, paper, scissors.
{% gist 1e0053b26f5a8ff307fe35a6fa83cfc5 TuplePatterns.cs %}
