---
published: true
layout: post
title: unitytips&colon; Tuple Patterns
categories: Article
tags: unity3d unitytips csharp csharp-8-new-features
---
Unity started to supporting C# 8.0 with version [2020.2 beta](https://unity3d.com/beta/2020.2b) and now we can start to use some [new features](/tags/csharp-8-new-features) like the [Tuple Patterns](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#tuple-patterns).

{% screenshot unitytips-tuple-patterns.gif %}

## Introduction
Some algorithms depend on multiple inputs. Tuple patterns allow you to switch based on multiple values expressed as a [tuple](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/value-tuples).

> The tuples provides concise syntax to group multiple data elements in a lightweight data structure.

## Sample
In this sample, we will get the message to indicate the winner of the game rock, paper, scissors.
{% gist 1e0053b26f5a8ff307fe35a6fa83cfc5 tuple-pattern.cs %}
