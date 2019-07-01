---
published: true
layout: post
title: Starting an Unity3D project with GeneticSharp using dotnet new 
categories: Tutorial
tags: geneticsharp unity3d dotnet
---

In this post I will show how to use `dotnet new` command to start an Unity3D project with GeneticSharp.
 
## Introduction
Sometime ago I created a NuGet package called [GeneticSharp.Templates](/dotnet-new-templates-for-GeneticSharp), this package allows developers to install [GeneticSharp](https://github.com/giacomelli/GeneticSharp) templates using the dotnet new command.

{% logo GeneticSharp.png default %}

Among the availables templates in `GeneticSharp.Templates`, there is one specific to create an Unity3D project with GeneticSharp. Besides this, the project has a sample of Travelling Salesman Problem (TSP) using GeneticSharp and can be used as a scaffold to starting use genetic algorithms in your games.


## Usage
Create an Unity3D project using dotnet new is fast and simple, depending of your machine performance, you'll have the sample running in less than a minute.

Open a terminal/prompt and type:

```shell
dotnet new -i GeneticSharp.Templates
dotnet new GeneticSharpTspUnity3d -o GeneticSharpSample
```
{% caption The argument `-o` is the the output folder of the Unity3D project %}

Now you can open the `GeneticSharpSample` in Unity3D editor.
Open the `MainScene` scene and hit the play button, you should see something like this:
{% screenshot geneticsharp-ts-template.gif %}

## Conclusion
Thats it, now you can use this sample to understand how to use GeneticSharp in your game. 

If you want more details about the code and the sample itself, please, take a look on this tutorial {% post TSP with GeneticSharp and Unity3D %}.

> If you need an introduction to genetic algorithms, this tutorial could help you {% post Function optimization with GeneticSharp %}.


Let's evolve!