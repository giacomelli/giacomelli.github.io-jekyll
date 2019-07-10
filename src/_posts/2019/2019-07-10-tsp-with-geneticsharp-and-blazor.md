---
published: true
layout: post
title: TSP with GeneticSharp and Blazor  
categories: Tutorial
tags: geneticsharp blazor webassembly tsp dotnet
---
In this post I will show how to use GeneticSharp and Blazor to solve the TSP (Travelling salesman problem).
 
## Introduction

{% logo city.png default %}

According to Wikipedia The travelling salesman problem (TSP) asks the following question:_**"Given a list of cities and the distances between each pair of cities, what is the shortest possible route that visits each city and returns to the origin city?"**_

TSP is a classic sample to test some optimization techniques, as well it's fairly used to demonstrate how to implement a genetic algorithm. For these reasons I will use it to show you how to implement a basic genetic algorithm in Blazor using GeneticSharp.

{% note This post is a like a mirror of the [TSP with GeneticSharp an Unity3D](/tsp-with-GeneticSharp-and-Unity3d). It's using the same format to teach TSP and GeneticSharp, but instead of Unity3D, this one is teaching about Blazor. %}

You can see the final result of this tutorial on [http://diegogiacomelli/apps/geneticsharp-runner-blazorapp](/apps/geneticsharp-runner-blazorapp).

## Prerequisites
To better understand this tutorial, you need to have some experiences/knowledges in:

* Blazor (beginner)
* Genetic algorithms (beginner). 

We'll perform a very basic use of Blazor and everything you need to complete this tutorial will be explained or provided by the code samples, but if want to find out better what's happening under the hood, take a look on [Blazor Get Started page](https://docs.microsoft.com/en-us/aspnet/core/blazor/get-started?view=aspnetcore-3.0&viewFallbackFrom=aspnetcore-2.2&tabs=netcore-cli).

If you need an introduction to genetic algorithms, take a look at this tutorial {% post Function optimization with GeneticSharp %}.

## Creating the Blazor project
Open a terminal and type:

```shell
dotnet new -i Microsoft.AspNetCore.Blazor.Templates::3.0.0-preview6.19307.2
```
{% caption This will install the latest Blazor templates for .NET Core. %}

{% note This tutorial is based on Blazor `preview6`. If you are doing this tutorial using a newer Blazor version and have encountered some problem, leave a comment at the end of the post or contact me on [Twitter](https://twitter.com/ogiacomelli). %}

Now we'll create a scaffold Blazor app using the `blazor` template:

```shell
dotnet new blazor -o TspWithGeneticSharp
cd TspWithGeneticSharp
dotnet watch run
```

Wait for the message `Application started. Press Ctrl+C to shut down.` show up in terminal, then open the url [http://localhost:5000](http://localhost:5000) on your browser, you should see something like this:
{% screenshot blazor-scaffold-app.png %}

## Installing GeneticSharp
Open a new terminal in the same folder and type:

```shell
dotnet add package GeneticSharp
```
{% caption This will install the latest [GeneticSharp NuGet package](https://www.nuget.org/packages/GeneticSharp/) in your newly created Blazor app. %}

## Opening the project
I recommend to you use [Visual Studio Code](https://code.visualstudio.com/) to open the project. There is some cool VS Code extensions to work with Blazor.

In the same terminal where you added the GeneticSharp package, type:

```shell
code .
```
{% caption This will open the Blazor project with VS Code. %}

In the root folder of your Blazor project create a new subfolder called `Tsp`. We'll add all our C# classes inside this folder.

## Defining the TSP chromosome
{% icon route.png %}

The chromosome represents a solution of the problem we are trying to solve. In our case the TSP chromosome should represent _**"the shortest possible route that visits each city and returns to the origin city"**_.

To represent the cities route each gene of our chromosome will represent an index of a city in the route.

Create a file called `TspChromosome.cs`:
{% gist 9addc5182943ba25eb82201e30c76418 TspChromosome.cs %}

## Representing a city
The next step is define our genetic algorithm fitness function, but first we need to create a simple class to represent a city on a 2D space.

Create a file called `TspCity.cs`:
{% gist 9addc5182943ba25eb82201e30c76418 TspCity.cs %}

## The fitness function
Now we need to evaluate the `TspChromosome`.

Our fitness function will evaluate the chromosome fitness based on the total distance to reach all cities in the route represented by the chromosome. The shorter the distance, the better the chromosome.

Create a file called `TspFitness.cs`: {% gist 9addc5182943ba25eb82201e30c76418 TspFitness.cs %}

## Configuring the Genetic Algorithm
In this step we need to configure our genetic algorithm using the `TspChromosome`, `TspFitness` and some classic GA operators already built in GeneticSharp.

Create a file called `TspGA.cs`: {% gist 9addc5182943ba25eb82201e30c76418 TspGA.cs %}

{% note ### Why use Timer?
GeneticSharp can be used as single threading or multithreading to evaluate chromosomes with the fitness function, but WebAssembly (and Blazor) can use just the UI thread, in this scenario when we call `GeneticAlgorithm.Start` method it freezes the UI until the GA finish. 

To avoid this behavior, the solution is: run each generation of the GA inside a step in a `System.Threading.Timer` as you can see in the `TspGA.Run` method.

> APIs that aren't applicable inside of a web browser (for example, accessing the file system, opening a socket, and **threading**) throw a PlatformNotSupportedException.
([https://docs.microsoft.com/pt-br/aspnet/core/blazor/?view=aspnetcore-3.0](https://docs.microsoft.com/pt-br/aspnet/core/blazor/?view=aspnetcore-3.0)) %}

## Creating the Razor page
Inside the folder `Pages` create a file called `Tsp.razor`: {% gist c10fba01c090a89702818cd1c48a125f Tsp.v1.razor %}

As we need to interop with JavaScript to manipulate DOM, we will use some helper JS functions. Add the file `canvas-helper.js` inside the folder `wwwroot/js`:  {% gist 9addc5182943ba25eb82201e30c76418 canvas-helper.js %}

Open the file `index.html` and add the tag below inside the tag `head`:  {% gist c10fba01c090a89702818cd1c48a125f index.canvas-helper.html %}

{% note ### Why use IJSRuntime do access DOM?
It's awesome we can now use C# in the browser with Blazor. But unfortunately we can't do everything with it, yet. Currently, WebAssembly isn't able to directly access the DOM API, which means that Blazor isn't able to either.
([https://chrissainty.com/blazor-bites-javascript-interop/](https://chrissainty.com/blazor-bites-javascript-interop)) 

### WebAssembly roadmap
DOM integration is in the WebAssembly roadmap: [https://webassembly.org/docs/future-features/](https://webassembly.org/docs/future-features). %}

Check your terminal window where the command `dotnet watch run` is running, if there is no error in that window you can access the url [http://localhost:5000/tsp](http://localhost:5000/tsp).

Hit the `Run` button and take a look on the console window, you will see the distance to reach all cities getting smaller as the generations ran.

{% screenshot console-window.png %}

{% note This is not a tutorial about Blazor good pratices, so everything here is done in the simplest possible way to introduce how to use GenticSharp with Blazor.  I do not talk about things you should use when working with Blazor, such as separate logic from UI and use Blazor components. %}

## Drawing the cities
Now our GA is running inside the browser, but it need to display the cities route better.
We need to create a visual representation to the cities.

In the `Tsp.razor` add the method `DrawCitiesAsync`:

{% gist c10fba01c090a89702818cd1c48a125f DrawCitiesAsync.cs %}

Then call it from `OnAfterRenderAsync` method, after the `clearCanvas` call:
{% gist c10fba01c090a89702818cd1c48a125f DrawCitiesAsyncCall.cs %}

Reload the url [http://localhost:5000/tsp](http://localhost:5000/tsp).

Now you should see something like this:
{% screenshot draw-cities.gif %}


## Drawing the route
In the previous step we drawn the cities and we have the visual of the problem: the cities.

Now we need to draw the solution: the route represented by the best chromosome of each generation.

Add the following method to the `Tsp.razor`:
{% gist c10fba01c090a89702818cd1c48a125f DrawRouteAsync.cs %}

Then call it from `OnAfterRenderAsync` method, after the `DrawCitiesAsync` call:
{% gist c10fba01c090a89702818cd1c48a125f DrawRouteAsyncCall.cs %}

Reload the url [http://localhost:5000/tsp](http://localhost:5000/tsp) again, and hit the `Run` button, now you should see the route been optimizing as the generations are ran:
{% screenshot draw-route.gif %}


## Conclusion
With only 4 C# classes, 1 JS file and 1 Blazor page we built a pretty nice sample of genetic algorithms using Blazor with GeneticSharp. Now you can improve it with your own ideas or use some of mine ;):

* Maybe let user change the genetic algorithm operators (crossover, mutation, selection, etc)?
* Move the DrawCitiesAsync and DrawRouteAsync to [Blazor components](https://docs.microsoft.com/en-us/aspnet/core/blazor/components?view=aspnetcore-3.0) responsible to only draw them?

The full source code used in this post can be download or fork from this Gist: [https://gist.github.com/giacomelli/9addc5182943ba25eb82201e30c76418](https://gist.github.com/giacomelli/9addc5182943ba25eb82201e30c76418)

Let's evolve!

{% iconscopyright %}