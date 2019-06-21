---
published: true
layout: post
title: GeneticSharp in the Wild&colon; Context-Sensitive Code Completion
categories: Article
tags: geneticsharp geneticsharp-in-the-wild
---
I decided to start a [series of posts](/tags/geneticsharp-in-the-wild/) about some outstanding scientific papers and projects using [GeneticSharp](https://github.com/giacomelli/GeneticSharp).

For this second post the choose one is the `Context-Sensitive Code
Completion: Improving Predictions with Genetic Algorithms`.

# Introduction
The main motivation of the author about this paper was:
*Current methods of training code completion systems can possibly be improved in order
to reduce prediction errors. This requires that the amount of information considered in a
pattern is optimized. The question raised is then: how should the training of predictive
models be focused in order to increase prediction quality?*
 
*This thesis will aim to answer the question: to what extent is it possible to improve predictions
of existing state-of-the-art code completion systems with a genetic algorithm?*


# Usage
*GeneticSharp is an open-source Genetic Algorithm library for C#, released under the MIT
license (Giacomelli). It has an extensible interface that allows for most, if not all, functionality
to be implemented from scratch via interfaces or leveraged by extending base classes. Classes
and interfaces also use the same terminology that has already been established, which makes
the translation from theory to implementation much more clear.*

# Results
*As a result of the new training scheme, the quality of predictions can be increased without
losing generalizability. Application of the new training scheme could possibly be applied
to any code completion systems that trains a predictive model, making it a candidate for
improving existing systems as well as in future research.*

{% screenshot gscc-vs-genecscc.png %}
{% caption results comparison between GCC and GeneCSCC (developed using GeneticSharp) %}

# Author
Marcus Ording wrote the paper for his degree project in Computer Engineering at KTH Royal Institute of Technology from Stockholm, Sweden.

# Further reading
You can access the full paper directly on [DiVA Portal](http://www.diva-portal.org/smash/get/diva2:1088591/FULLTEXT01.pdf).