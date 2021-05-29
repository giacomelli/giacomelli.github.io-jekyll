---
published: true
layout: post
title: GeneticSharp 2.6.0 - Blazor template
categories: News
tags: geneticsharp dotnet release blazor
---
The **[GeneticSharp 2.6.0](https://github.com/giacomelli/GeneticSharp)** is out.

## Blazor template
Now we have 4 `dotnet new` templates, besides the `GeneticSharpConsoleApp`, `GeneticSharpTspConsoleApp` and `GeneticSharpTspUnity3d` already existent, a new template for a Blazor client app was added: `GeneticSharpTspBlazorApp`:

```
dotnet new -i GeneticSharp.Templates
dotnet new GeneticSharpTspBlazorApp -o TspBlazorApp
cd TspBlazorApp
dotnet run
```

{% logo GeneticSharp.png default %}

{% screenshot geneticsharp-blazor-template.gif %}

If you want to know more about how to use GeneticSharp with Blazor, take a look in this tutorial [TSP with GeneticSharp and Blazor](http://diegogiacomelli.com.br/tsp-with-geneticsharp-and-blazor/).
 
## New papers and projects using GeneticSharp
Four papers and one project were added to the list:

* [Design of a warehouse order picking policy using genetic algorithm (paper)](https://github.com/giacomelli/GeneticSharp/blob/master/docs/mentioning-GeneticSharp/Design-of-a-warehouse-order-picking-policy-using-genetic-algorithm.pdf)
* [Fabrication of Adiabatic Quantum-Flux-Parametron Integrated Circuits Using an Automatic Placement Tool Based on Genetic Algorithms (paper)](https://ieeexplore.ieee.org/document/8643945)
* [Modelling and Simulation Analysis of Goal-Oriented Business Process (paper)](https://github.com/giacomelli/GeneticSharp/blob/master/docs/mentioning-GeneticSharp/Modelling-and-Simulation-Analysis-of-Goal-Oriented-Business-Process.pdf)
* [Optimization by genetic algorithm of lattices structures for the media generation in additive manufacturing (paper)](https://github.com/giacomelli/GeneticSharp/blob/master/docs/mentioning-GeneticSharp/Optimisation-par-algorithme-genetique-de-structures-lattices.pdf)
* [TrussOptimization (project)](https://trussoptimizationweb.herokuapp.com)

## How to install the new version
### .NET Standard 2.0 
Only GeneticSharp:

```shell
install-package GeneticSharp
```

GeneticSharp and extensions (TSP, AutoConfig, Bitmap equality, Equality equation, Equation solver, Function builder, etc):

```shell
install-package GeneticSharp.Extensions
```
### Unity3D
You should use the [UnityNuGet](https://github.com/xoofx/UnityNuGet) to install GeneticSharp directly from NuGet.

Or you can use the latest GeneticSharp.unitypackage available on our [release page](https://github.com/giacomelli/GeneticSharp/releases).


Let's evolve!