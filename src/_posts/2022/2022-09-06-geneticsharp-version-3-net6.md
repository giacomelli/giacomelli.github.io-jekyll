---
published: true
layout: post
title: GeneticSharp v3.0.0 - .NET 6
categories: News
tags: geneticsharp dotnet release
---
I've just released the [GeneticSharp version 3.0.0](https://github.com/giacomelli/GeneticSharp/releases/tag/3.0.0).

{% logo GeneticSharp.png default %}

# .NET 6
With version 3.0.0, GeneticSharp now supports .NET 6.

# Performance improvements
The performance of many operations has been improved just for use .NET 6:
### Chromosomes
![image](https://user-images.githubusercontent.com/177389/188523382-2d21529d-a6ee-4823-843a-1964795124eb.png)

### Crossovers
![image](https://user-images.githubusercontent.com/177389/188523420-c7d93a6b-658c-46fd-a4f6-e8da2bd533fe.png)

### Task executors
![image](https://user-images.githubusercontent.com/177389/188523543-b233bb3b-7b97-4ffc-9871-e3120d634607.png)

### Mutations
![image](https://user-images.githubusercontent.com/177389/188523591-943ca265-2880-4a0c-ac25-0b4e93f38bd8.png)

### Randomizations
![image](https://user-images.githubusercontent.com/177389/188523654-593c9b6f-d50c-4cd1-b2bd-588307a10efa.png)

### Reinsertions
![image](https://user-images.githubusercontent.com/177389/188523733-b7b955d5-502d-4ed3-ba2a-28bb161bbea5.png)

### Selections
![image](https://user-images.githubusercontent.com/177389/188523701-c920686d-a1fa-42f6-8d21-73ae3deb55c1.png)

### Terminations
![image](https://user-images.githubusercontent.com/177389/188523717-a2c648c4-cfc8-4b2e-9074-7b18eb92ef32.png)

More about performance: [https://github.com/giacomelli/GeneticSharp/wiki/Performance](https://github.com/giacomelli/GeneticSharp/wiki/Performance).

# Streamlining namespaces
To avoid the necessity to write many `using` statements to write a basic genetic algorithm with GeneticSharp:
```csharp
using GeneticSharp.Domain;
using GeneticSharp.Domain.Crossovers;
using GeneticSharp.Domain.Mutations;
using GeneticSharp.Domain.Populations;
using GeneticSharp.Domain.Selections;
using GeneticSharp.Domain.Terminations;
using GeneticSharp.Infrastructure.Framework.Threading;
```

The namespaces needed to use GeneticSharp have been simplified to just two:
```csharp
using GeneticSharp;
```

and this one if you want to use the extensions:
```csharp
using GeneticSharp.Extensions;
```


# Installing

### .NET 6
Only GeneticSharp:

```shell
install-package GeneticSharp
```
GeneticSharp and extensions (TSP, AutoConfig, Bitmap equality, Equality equation, Equation solver, Function builder, etc):

```shell
install-package GeneticSharp.Extensions
```
### Unity3D
> For Unity you should used the version 2.6.0, because Unity, at moment I'm writing, only support .NET Standard 2.1: [https://docs.unity3d.com/Manual/dotnetProfileSupport.html](https://docs.unity3d.com/Manual/dotnetProfileSupport.html).

You should use the [UnityNuGet](https://github.com/xoofx/UnityNuGet) to install GeneticSharp directly from NuGet.

Or you can use the latest GeneticSharp.unitypackage available in the `Assets` section of this release.

### .NET Standard 2.0 and .NET Framework 4.6.2 
To install previous version that support .NET Standard 2.0 and .NET Framework 4.6.2:

```shell
install-package GeneticSharp -Version 2.6.0
```

### Mono and .NET Framework 3.5
To install previous version that support .NET Framework 3.5:

```shell
install-package GeneticSharp -Version 1.2.0
```

More about installing/setup: [https://github.com/giacomelli/GeneticSharp/wiki/Setup](https://github.com/giacomelli/GeneticSharp/wiki/Setup).