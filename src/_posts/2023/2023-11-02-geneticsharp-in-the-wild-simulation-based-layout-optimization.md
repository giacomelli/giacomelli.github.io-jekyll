---
published: true
layout: post
title: GeneticSharp in the Wild&colon; Simulation-based layout optimization for multi-station assembly lines
categories: Article
tags: geneticsharp geneticsharp-in-the-wild
---
I started a [series of posts](/tags/geneticsharp-in-the-wild/) about some outstanding scientific papers and projects using [GeneticSharp](https://github.com/giacomelli/GeneticSharp).

For this sixth post the choose one is the `Simulation-based layout optimization for multi-station assembly lines`.

## Introduction
*Presents a novel approach for the automated 3D-layout planning of multi-station assembly lines. The planning method is based on a comprehensive model of the used production resources, including their geometry, kinematic properties, and general characteristics. Different resource types can be included in the planning system. A genetic algorithm generates and optimizes possible layouts for a line.*
 
## Usage
*The optimization aims to minimize the line’s area and the costs for assembling the
line while simultaneously optimizing the resources’ positioning to perform their tasks. The line’s cycle time is considered as
a boundary condition. For the evaluation of different layout alternatives, a multi-body simulation is performed. A parameter
study is used to set the algorithm’s parameters. Afterward, the algorithm is applied to three increasingly complex examples
to validate and evaluate its functionality. The approach is promising for industrial applications as it allows the integration of
various resource types and individualization of the optimization function.*

{% screenshot examples-eval-positions.png %}
{% caption Examples for the evaluation of positions in the workspace of an LBR iiwa 7 robot %}

## Results
*The presented system is highly flexible and supports the positioning of multiple resource types.
It is also open to integrating more resource variants or customizing the fitness function to reflect the individual user’s
preferences accurately. The integration of more resource models and the modeling of more resource types would be the logical next step
to improve the system further.*

{% screenshot multi-station-assembly-lines.png %}
{% caption The final layout of the first three runs of the first example %}

## Authors
Daria Leiber, David Eickholt, Anh-Tu Vuong, and Gunther Reinhart wrote the paper for Department of Mechanical Engineering, Institute for Machine
Tools and Industrial Management, Technical University of Munich, Germany.

## Further reading
You can access the full paper directly at [Journal of Intelligent Manufacturing](https://link.springer.com/content/pdf/10.1007/s10845-021-01853-5.pdf).