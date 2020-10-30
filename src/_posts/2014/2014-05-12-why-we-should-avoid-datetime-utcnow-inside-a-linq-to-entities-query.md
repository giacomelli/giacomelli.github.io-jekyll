---
published: true
layout: post
title: "Why we should avoid DateTime.UtcNow inside a Linq to Entities query?"
categories: Article
tags: dotnet csharp linq-to-entities sql
---
Why we should avoid `DateTime.UtcNow` inside a `Linq to Entities` query?

Because we can get unexpected results!<br>
After read this tip, will be expected results 😉

## What is the diference between these two Linq queries?

#### Query 1
{% gist 9a3a88fac354f3af8294381b30552ade sample1.cs %}

#### Query 2
{% gist 9a3a88fac354f3af8294381b30552ade sample2.cs %}

#### SQL generated
The first one will generate a SQL with WHERE clause like this:
{% gist 9a3a88fac354f3af8294381b30552ade sample3.cs %}
Where `@p__linq__1` is the value of our filterDate variable.

The second one will generate this `WHERE` clause:
{% gist 9a3a88fac354f3af8294381b30552ade sample4.cs %}

## What is the problem?
{% icon problem.png %}
Imagine that we're using the second query inside some sync algorithm in our C# code, this algorithm is very sensitive about time, now imagine that the server where our C# code is running has a difference about seconds or minutes with the database server?

**YES, UNEXPECTED RESULTS!**

## Conclusion
{% icon conclusion.png %}
Linq to Entities is very smart and it is able to translate our `DateTime.Now` or `DateTime.UtcNow` to a matching command on database side.

{% note The important here is: we should remember that it can do this and we should use features like these with parsimony. %}

{% removegistlinks %}