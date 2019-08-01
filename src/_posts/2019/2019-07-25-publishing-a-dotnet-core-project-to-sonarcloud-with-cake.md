---
published: true
layout: post
title: Publishing a .NET Core project to SonarCloud with Cake 
categories: Tutorial
tags: dotnet sonar cake
---
In this post I will show how to use [Cake](https://cakebuild.net/) to build and test a .NET Core project and then publish the results to [SonarCloud](https://sonarcloud.io).
 
## Introduction

{% logo cake.png default %}

***Cake** (C# Make) is a cross-platform build automation system with a C# DSL for tasks such as compiling code, copying files and folders, running unit tests, compressing files and building NuGet packages.*

***SonarCloud** is a cloud service offered by SonarSource and based on SonarQube. SonarQube is a widely adopted open source platform to inspect continuously the quality of source code and detect bugs, vulnerabilities and code smells.*

## Prerequisites
* **Cake**: install the `Cake` on your .NET Core project before start this tutorial. Follow this [Setting Up A New Project](https://cakebuild.net/docs/tutorials/setting-up-a-new-project).
* **SonarCloud**: create an account and add a project on [https://sonarcloud.io](https://sonarcloud.io). 

## Creating the build.cake
In project root folder, create a file called `build.cake`.


### Adding the tools and addin references
Add the lines below to the file:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v1.cake %}

{% note We'll use those tools and addins to create the complete .cake script. %}


### Setting the variables
Now we need to set some variables:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v2.cake %}


Where:
* **solutionDir**: is the subfolder where your solution source code is located.
* **sonarLogin**: Change the `[SONARCLOUD-USER-TOKEN]` for a token you can generate at the page [https://sonarcloud.io/account/security/](https://sonarcloud.io/account/security/).
* **branch**: if you are using git, then the `GitBranchCurrent(".").FriendlyName` will pass the right branch name to SonarCloud, otherwise you can set it manually.

If you are using `AppVeyor` you can use line bellow to allow discover the branch name locally and in the AppVeyor:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v3.cake %}

### Build task
The first task definitions will build our .NET Core project:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v4.cake %}

### Test task
Now we will define the task to run our tests:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v5.cake %}

This task use `Coverlet` to collect the code coverage. Install it on your test project using the `Coverlet` NuGet package:

```shell
install-package coverlet.msbuild
```

### Sonar tasks
The lasts tasks to define are responsible to scan the project and send the build and tests results to SonarCloud:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v6.cake %}

Where:

* **Key**: is your project key on SonarCloud. You can get it throw these steps on [SonarCloud](https://sonarcloud.io):
   * Select your project.
   * Open the menu `Administration / Update Key`
* **Organization**: is the name of your organization on SonarCloud. If your `projects` page is `https://sonarcloud.io/organizations/YOUR-ORGANIZATION/projects`, then your **Organization** value is `YOUR-ORGANIZATION`.
* **Exclusions**: here you can define the wildcards to excluse some files fron Sonar scan, like sample, docs and test files.

### Defining the tasks order
The last part of the `build.cake` file define the order that tasks will run:
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.v7.cake %}

## Running the build.cake
Now, every time you want to build, test and publish the results to SonarCloud you need to type this command on your project root folder:

MacOS:
```shell
./build.sh
```

Windows:

Open a `powershell` terminal:
```shell
.\build.ps1
```

When the build finish, you should see something like this:
{% screenshot cake-terminal.png %}
{% caption Cake build %}

Then open your project on [SonarCloud](https://sonarcloud.io/projects):
{% screenshot sonarcloud-dashboard.png %}
{% caption SonarCloud dashboard %}

That's it, now your project is ready to using cake to publish results to SonarCloud.
 
## Complete build.cake
{% gist 2ff83d13a8b970aacd4aa94b9182e7bb build.cake %}

## Extras
If you are using git, you can add this lines to your .gitignore file:

```
tools/**
!tools/packages.config
```