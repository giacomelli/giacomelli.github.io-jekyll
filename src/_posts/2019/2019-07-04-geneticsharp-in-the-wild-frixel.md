---
published: true
layout: post
title: GeneticSharp in the Wild&colon; Frixel
categories: Article
tags: geneticsharp geneticsharp-in-the-wild
---
I started a [series of posts](/tags/geneticsharp-in-the-wild/) about some outstanding scientific papers and projects using [GeneticSharp](https://github.com/giacomelli/GeneticSharp).

For this third post the choose one is the `Frixel: 2D framing / pixel structural optimization`.

# Introduction

Frixel is a plugin for [Rhinoceros 6](https://rhino3d.com), a 3D computer graphics and computer-aided design (CAD) application.

*A finite element analysis program that’s so easy a 5 year old could use it.* 

*Provided only a closed curve representing a building massing and location for core, Frixel generates a 2 dimensional grid and runs structural analysis on it.* 

*You can tweak grid size, gravitation magnitude and lateral wind force to see how your design perfoms under different conditions. Additionally, it can run structural topology optimization to improve its mechanical performance by adding bracing in appropriate places.* 

{% logo geneticsharp-frixel-ui.gif %}

# Usage
GeneticSharp was used to design the [structural chromosomes](https://github.com/EmilPoulsen/Frixel/blob/7a80a96e2793fd3f4e32bcf01ba6ca13fcc6a06a/Frixel.Optimizer/Optimization/StructuralChromosome.cs) and [fitness function](https://github.com/EmilPoulsen/Frixel/blob/7a80a96e2793fd3f4e32bcf01ba6ca13fcc6a06a/Frixel.Optimizer/Optimization/StructuralFitness.cs) to allow framing / pixel structural optimization through the [Frixel optimizer](https://github.com/EmilPoulsen/Frixel/blob/7a80a96e2793fd3f4e32bcf01ba6ca13fcc6a06a/Frixel.Optimizer/Optimization/FrixelOptimizer.cs).

{% screenshot geneticsharp-frixel-optimization.gif %}

# Functionality
According to the developers, these are the features of Frixel:

* A power-up for architect-engineer collaboration.
* A great way to test and guide options in early stage design.
* Fast. You can quickly get an understanding of structural behavior.
* Topology optimization for minimal displacement.
* Platform agnostic

# Authors
The project was developed from scratch under 24 intense hours at the beyondAEC Hackathon July 2018, in Boston MA by [Leland Jobson](https://github.com/lelandjobson) and [Emil Poulsen](https://github.com/EmilPoulsen).

# Further reading
You can access the project repository at: [https://github.com/EmilPoulsen/Frixel](https://github.com/EmilPoulsen/Frixel).