---
published: true
layout: post
title: Dapper and the NVARCHAR(4000) arguments 
categories: Lab
tags: dotnet dapper sql
---
Performing a profiler in the queries sended to the database you can see that in some cases Dapper is sending the string arguments as `NVARCHAR (4000)`.

## Introduction
This happen because Dapper cannot infer what is the exactly type and length of the table column on database.

The downside of the `NVARCHAR (4000)` in arguments is that the database can choose a bad execution plan for the query.

{% logo stack-exchange.svg default %}

## Solution
To avoid this you can pass the type of the argument to Dapper:

{% gist 57f1f930ddd894eb8ab54fffed453842 dapper.sample1.cs %}

To make this solution easier to use I made two extension methods `ToVarChar` and `ToNVarChar`:

{% gist 57f1f930ddd894eb8ab54fffed453842 dapper.sample2.cs %}

## Extension methods
{% gist 57f1f930ddd894eb8ab54fffed453842 DapperArgumentExtensions.cs %}