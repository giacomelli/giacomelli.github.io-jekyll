---
published: true
layout: post
title: Creating dotnet new templates with samples 
categories: Tutorial
tags: dotnet
---
In this post I will show the needed steps and samples to create dotnet new templates.
 
## Introduction

{% logo netcore.svg default %}

Recently a friend asked me about the steps I follow to create dotnet new templates, while I was describing the steps to him I realized that information could be usefull to someone else or even to my future self.

Sometime ago I created some dotnet new templates for GeneticSharp: [dotnet new templates for GeneticSharp](http://diegogiacomelli.com.br/dotnet-new-templates-for-GeneticSharp/) and I will use that template as samples for the steps below.

## Nuget pack / dotnet pack
Nowadays there are two main ways to build a dotnet new template: creating a `.nuspec` file or defining the package properties directly inside your `.csproj`.

To GeneticSharp templates I used a `.nuspec`.
 
## Steps and samples
When I was trying to create the first templates I used this Microsoft documentation to learn about it: [Custom templates for dotnet new](https://docs.microsoft.com/en-us/dotnet/core/tools/custom-templates).

### Creating
* Create a `Templates` folder: [sample](https://github.com/giacomelli/GeneticSharp/tree/master/src/Templates)
* Define the templates in the `.csproj` or create a `.nuspec`: [sample](https://github.com/giacomelli/GeneticSharp/blob/master/src/Templates/GeneticSharp.Templates.nuspec)
* Create a `content` folder inside the `Templates` folder: [sample](https://github.com/giacomelli/GeneticSharp/tree/master/src/Templates/content)
* Create a subfolder inside `content` for each template and put your template project source code there: [sample](https://github.com/giacomelli/GeneticSharp/tree/master/src/Templates/content/ConsoleApp)
* For each template folder, create a subfolder `template.config` then create a `template.json` file: [sample](https://github.com/giacomelli/GeneticSharp/blob/master/src/Templates/content/ConsoleApp/.template.config/template.json)

{% note In this `.json` you should define things like template name (shortName) and what it's root namespace that will be replaced when a new project use this template (sourceName) %}

### Building and testing
* Now you can create the `.nupkg` with the `dotnet pack` or `nuget pack` 
* You can test your templates locally installing them directly from the `.nupkg` file: `dotnet new -i your_templates_file.nupkg` 
* Install the template: `dotnet new template_shortname -n new_project_namespace -o output_folder`

{% note Here a `.cmd` sample for last 3 steps: [sample](https://github.com/giacomelli/GeneticSharp/blob/master/tools/buildTemplatesNuget.cmd) %}

### Publishing
* If everything is right you can publish your `.nupkg` on [http://nuget.org]() or to your private NuGet feed: [sample](https://www.nuget.org/packages/GeneticSharp.Templates/)

# Conclusion
That's it, with just 9 steps you can create your own dotnet new template and jumpstart your next project setup.