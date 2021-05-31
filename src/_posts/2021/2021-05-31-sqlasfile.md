---
published: true
layout: post
title: SqlAsFile
categories: News
tags: dotnet database sql code-generator ado dapper
---

## Introduction
If you already worked in a project where the data access solution wore SQL commands, instead of some ORM solution, you probably saw some SQL commands inserted directly inside the C# code. I worked in projects with that approach too, but I saw a great **problem with that: We were treating a complete language (SQL) as just a string inside our C# code. No intellisense, code completation, syntax validation, format, etc.**

Sometime ago, with that problem in mind, I created a small library to help us to use SQL commands in our project at that time. As we were using [Dapper](https://github.com/DapperLib/Dapper) as our facilitator to access the SQL Server database, we needed write SQL commands as our daily base activities.

*That library, called SqlAsFile, helped us to write SQL commands in separated .sql files and use them inside the C# as typed string property of a static class (using T4 generator). This allowed us to write SQL with the whole help of IDE and with no chance to reference a invalid SQL file path.*

{% logo netcore.svg default %}

## Setup
* Install the SqlAsFile on your Data project (where your .sql files will be created) using the Nuget package or using the source code from GitHub: [https://github.com/giacomelli/sqlasfile](https://github.com/giacomelli/sqlasfile).
{% gist 4dda230a09941b6300468a71ee3812ab install-package.sh %}
* Copy the [SqlInfoGenerator.tt](https://github.com/giacomelli/SqlAsFile/blob/master/src/Sample.Data/SqlInfoGenerator.tt) to your Data project.
* Change the namespace of line bellow to the namespace of your Data project.
{% gist 4dda230a09941b6300468a71ee3812ab change-template.cs %}
* Add your .sql files inside any folder or subfolder of your Data project.
* The Build Action property of the .sql files should be changed to Embedded Resource.
* Run the `SqlInfoGenerator.tt` (right click, Run Custom Tool)


## Usage
Now you can access the content of your .sql files in a strongly typed way directly from your C# code:

{% gist 4dda230a09941b6300468a71ee3812ab usage.cs %}

{% screenshot SqlAsFile-sample.gif %}

## Tags
You can use some tags to tell to SqlAsFile's parser how to treat a portion of the file:

### test-args
Anything inside of these tags will be strip off of the SQL that you can access on C#.

This tag is useful when you want to test the .sql directly against the DB without need to define the arguments every time.
{% gist 4dda230a09941b6300468a71ee3812ab test-args.sql %}

### cte
Use this tag if you want to read the CTE of your file in the Cte property on C#.

{% gist 4dda230a09941b6300468a71ee3812ab cte.sql %}
{% removegistlinks %}