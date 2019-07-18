---
published: true
layout: post
title: GeneticSharp in the Wild&colon; Design of a Warehouse Order Picking Policy
categories: Article
tags: geneticsharp geneticsharp-in-the-wild
---
I started a [series of posts](/tags/geneticsharp-in-the-wild/) about some outstanding scientific papers and projects using [GeneticSharp](https://github.com/giacomelli/GeneticSharp).

For this fourth post the choose one is the `Design of a Warehouse Order Picking Policy - Using Genetic Algorithm`.

# Introduction
The main motivation of the author about this paper was:
*improving order-picking process is considered which is an essential
operation critically impacting warehouse and supply chain performance.*
 
*The study is composed of two phases: In the first phase, the
shortest path between each pair of items is determined in a pick list leading to the
second phase of determining the sequence of all items to be picked. A
mathematical model is utilized to find the shortest path between each item pair in
a pick list.*

 
# Usage
*A genetic algorithm based approach is developed to decide the picking
sequence of all items in an order list, given the shortest distance between each pair
of items. The performance of the proposed algorithms is compared to popular
heuristics used for multi-block warehouses, namely: S-Shape and Largest Gap.*

Ahmet Can Saner, the paper author made [great contributions to GeneticSharp](http://diegogiacomelli.com.br/GeneticSharp-v1.2.0-sequence-mutations/), that him developed during his master degree, like: Displacement Mutation, Insertion Mutation and Partial Shuffle Mutation (PSM).


# Results
* *For 25-item pick lists, all of the proposed
GA algorithms are superior to S-Shape and Largest Gap heuristics, in terms of travelled
distance. GA with order crossover operator, inversion mutation operator provides the best
results in terms of average travelled distance* 
* *For 50-item pick lists, all of the proposed GA
algorithms are superior to S-Shape, in terms of travelled distance. But when compared to
Largest Gap heuristic, only GA algorithms with inversion mutation operator performs
better than Largest Gap, in terms of travelled distance.*
* *For 100-
item pick lists, only GA algorithms with inversion mutation operator performs better than
both S-Shape and Largest Gap heuristics, in terms of travelled distance. GA with order
crossover operator, inversion mutation operator setting performs the best in terms of
average travelled distance for pick lists of size 100.*

# Author
Ahmet Can Saner, with Dr. Zehra
Düzgi supervision, wrote the paper for his master degree at Istanbul Bilgi University.

# Further reading
You can access the full paper directly on [Istanbul Bilgi University library](http://openaccess.bilgi.edu.tr:8080/xmlui/bitstream/handle/11411/1310/Design%20of%20a%20warehouse%20order%20picking%20policy%20using%20genetic%20algorithm.pdf?sequence=1&isAllowed=y).