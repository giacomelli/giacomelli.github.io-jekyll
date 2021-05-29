---
published: true
layout: post
title: Azure Pipelines - Generating DB Script with SqlPackage.exe
categories: Article
tags: dotnet azure azure-pipelines database continuous-integration
---

Recently I needed to automate the generation of a database script deploy from a SQL Server Database Project on our Azure Pipelines continuous integration. Below I will describe the steps to achieve such thing.

{% logo azure-pipelines.png default %}

## Building the solution
A SQL Server Database Project has a solution (.sln) as any other kind of Visual Studio projects and we need to build it to generate our [DACPAC](https://docs.microsoft.com/en-us/sql/relational-databases/data-tier-applications/data-tier-applications?view=sql-server-ver15).

> A data-tier application (DAC) is a logical database management entity that defines all of the SQL Server objects - like tables, views, and instance objects, including logins - associated with a user's database. A DAC is a self-contained unit of SQL Server database deployment that enables data-tier developers and database administrators to package SQL Server objects into a portable artifact called a DAC package, also known as a DACPAC

{% gist 30d0b7c0a3e803cb71ce4b1680d2a584 solution-build.yml %}
> The variables used in the script portions are described in the `Complete azure-pipelines.yml` in the end of this post 

## Generating the .sql script
With our .dacpac file built, now we need to generate our .sql database script. To perform this operation we need the [sqlpackage.exe](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15), this command-line is available in some Azure Pipelines images, as `vs2017-win2016`, so you need to use it on your `azure-pipelines.yml` file:

{% gist 30d0b7c0a3e803cb71ce4b1680d2a584 image.yml %}

Add the `CmdLine` task below to generate the .sql database script:
{% gist 30d0b7c0a3e803cb71ce4b1680d2a584 db-script-generate.yml %}

## Publishing the .sql script
Now we need to publish the .sql file to the build artifacts:
{% gist 30d0b7c0a3e803cb71ce4b1680d2a584 db-script-publish.yml %}

## Complete azure-pipelines.yml
{% gist 30d0b7c0a3e803cb71ce4b1680d2a584 azure-pipelines.yml %}

## Extra points
In the approach described above the .sql files is not automatically applied to the database, so someone need to download, check and apply the file manually against the target database. If you want to apply the database script automatically you can change `CmdLine` task that generate the .sql file to update the target database using the [`action:publish` option of sqlpackage.exe](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15#publish-parameters-properties-and-sqlcmd-variables).


