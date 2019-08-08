---
published: true
layout: post
title: Deploying a T4 Template with dotnet pack 
categories: Tutorial
tags: dotnet t4-template nuget
---
In this post I will show how to deploy a T4 Template to a target project using a NuGet package built with dotnet CLI pack command.
 
## Introduction

{% logo nuget.png default %}

Recently I had to distribute a T4 template inside a NuGet package, so developers who installed the NuGet package would get, in addition to the library assemblies, a T4 template to help generate some scaffold code.


Nowadays there are two main ways to build a NuGet package: creating a `.nuspec` file or defining the package properties directly inside your `.csproj`.

The project that I want to distributed via NuGet is a .NET Standard library, so I decided to use the the dotnet core way: define the package properties inside the `.csproj` file.
 
## Creating the NuGet project
We will create a sample project to use during the post. Open a command-line/terminal and type:

{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 create-sample-project.sh %}

Let's say that the T4 Template that we want to distribute is located inside a folder called `Templates` and the file is named `Scaffold.tt`.

Now open the `SampleNugetProject.csproj` in the Visual Studio and add a `T4 Template`:
{% screenshot add-t4-template.png %}
{% caption Add new item... %}

Our `Solution Explorer` should look like this:
{% screenshot t4-template-added-solution-explorer.png %}

## Creating a .targets
We need to create a `.targets` file, it will be used to copy the T4 Template from the NuGet package folder to the target project in the build process:

Create a file with the same name of your NuGet package project, but with the extensions `.targets`.

For our sample the file will be `SampleNugetProject.targets`:

{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 SampleNugetProject.targets %}

## Changing the .csproj 
In the project `.csproj` just add this `ItemGroup`:

{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 SampleNugetProject.csproj %}

## Building the NuGet package
Inside the folder where are our `.csproj` and `.targets` files, type:

{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 dotnet-pack.sh %}

This will create a file `bin\Debug\SampleNugetProject.1.0.0.nupkg`.

## Testing the NuGet package
Create a new .NET Core project to test the package:

{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 create-TargetTestProject.sh %}

Now, add the NuGet package to the target project.
{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 add-package.sh %}

> To test our NuGet package without publish it to a NuGet source, just use the `--source` option and point it to the `SampleNugetProject.1.0.0.nupkg` folder.

If we look to our `TargetTestProject` there is no `Scaffold.tt` file yet, this is because it will copied from NuGet package folder to the project structure during the build process.

Just build the target project and the `Scaffold.tt` will be copied.
{% gist 34f72d3e54b5ac658a924bbb0f1f7e72 dotnet-build.sh %}

## Conclusion
That's it, now we have created a NuGet package that copy a T4 Template to target project's structure.

You can expand this solution to copy other kind of files to the target project.

If you want to dig deeper into generating NuGet packages using dotnet-cli, starts with [Create a NuGet package using the dotnet CLI](https://docs.microsoft.com/en-us/nuget/create-packages/creating-a-package-dotnet-cli).

{% removegistlinks %}