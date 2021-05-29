---
published: true
layout: post
title: unitytips&colon; Switch Expressions
categories: Article
tags: unity3d unitytips csharp csharp-8-new-features
---
Unity started to supporting C# 8.0 with version [2020.2 beta](https://unity3d.com/beta/2020.2b) and now we can start to use some [new features](/tags/csharp-8-new-features) like the [Switch Expression](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/switch-expression).

{% screenshot unitytips-switch-expressions.png %}

## Introduction
`Switch Expressions` can dramatically simplify and reduce the [LOC (Lines Of Code)](https://en.wikipedia.org/wiki/Source_lines_of_code) to make a `switch`.

> The switch expression provides for switch-like semantics in an expression context. It provides a concise syntax when the switch arms produce a value.

> Often, a switch statement produces a value in each of its case blocks. Switch expressions enable you to use more concise expression syntax. There are fewer repetitive case and break keywords, and fewer curly braces.


## Sample
### Classic switch
In the code below we have a classic `switch` statement:
{% gist da466c32c17301008cafc8a1bb65f13c classic.cs %}

### Switch expression
And we can `reduce 7 lines of code` of this simple switch statement using a `switch expression`:
{% gist da466c32c17301008cafc8a1bb65f13c switch-expression.cs %}

## Visual Studio tip
If you are using Visual Studio, there is a  `Quick action` (CTRL + .) to convert from a classic `switch` to a `switch expression`:
{% screenshot unitytips-switch-expressions.gif %}

