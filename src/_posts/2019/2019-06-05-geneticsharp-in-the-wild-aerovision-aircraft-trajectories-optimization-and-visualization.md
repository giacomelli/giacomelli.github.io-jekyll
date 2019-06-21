---
published: true
layout: post
title: GeneticSharp in the Wild&colon; AeroVision - Aircraft Trajectories Optimization and Visualization
categories: Article
tags: geneticsharp geneticsharp-in-the-wild
---
I decided to start a [series of posts](/tags/geneticsharp-in-the-wild/) about some outstanding scientific papers and projects using [GeneticSharp](https://github.com/giacomelli/GeneticSharp).

For this first post the choose one is the `AeroVision - Aircraft Trajectories Optimization and Visualization`.

# Introduction
The main motivation of the authors about the AeroVision was:
*build program that represents an innovative and efficient way to
minimize and visualize aircraft noise along simulated and real flight routes. There are no existing programs that offer both optimization and visualization of aircraft noise.*

# Usage
*To optimize aircraft trajectories using a genetic algorithm, AeroVision uses the [GeneticSharp](https://github.com/giacomelli/geneticsharp) library, which is a fast, extensible, multi-platform and multithreading C# Genetic Algorithm library that simplifies the development of applications using Genetic Algorithms.*

*The library supports a number of selection methods, of which the most basic option (elite selection) is recommended. The mutation method used by AeroVision is crossover, which is a commonly used setting. The stop criteria can be a fixed number of generations, which can be specified by the user.* 

*Additionally, the user is free to define the number of chromosomes that are part of one population. The default population size is 70 chromosomes, each representing a possible trajectory in our case.*

# Results
*For trajectory optimization we were able to achieve a `performance improvement of 84%` by using a [multi-core and multi-threaded genetic algorithm](https://github.com/giacomelli/GeneticSharp/wiki/multithreading) based on [crossover operations](https://github.com/giacomelli/GeneticSharp/wiki/crossovers). This led to a major improvement on the workﬂow management and automation*

# Authors
Elvan Kula and Hans Schouten wrote the paper as requirements for their degree of Bachelor of Science in Computer Science. The Dr. Ir. N. Dintzner (TU Delft, supervisor), Dr. ir. S. Hartjes (Client) and Dr. ir. M. Larson (Bachelor Project Coordinator) are the thesis committee.

# Further reading
You can access the full paper directly on [TUDelft library repository](http://resolver.tudelft.nl/uuid:91c8261d-a5f2-414a-9b83-2e0d6ad5b37f).