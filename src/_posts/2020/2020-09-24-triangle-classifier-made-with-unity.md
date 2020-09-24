---
published: true
layout: post
title: Triangle Classifier Made With Unity
categories: Labs
tags: unity3d gamedev math webgl
---
These days were studying polygons and thought that would be cool build a triangle classifier to help people learn and teach about types of triangle.

## Types of triangle
{% icon project.png %}
Triangles can be classified [by lengths of sides and by internal angles](https://en.wikipedia.org/wiki/Triangle#Types_of_triangle).

### By lengths of sides
* [Equilateral](https://en.wikipedia.org/wiki/Equilateral_triangle): all three sides have the same length.
* [Isosceles](https://en.wikipedia.org/wiki/Isosceles_triangle): has two sides of equal length.
* Scalene: has all its sides of different lengths.

### By internal angles
* [Right](https://en.wikipedia.org/wiki/Right_triangle): has one of its interior angles measuring 90°.
* [Oblique](https://en.wikipedia.org/wiki/Oblique_triangle): do not have an angle measuring 90°.
* [Acute](https://en.wikipedia.org/wiki/Acute_triangle): with all interior angles measuring less than 90°.
* [Obtues](https://en.wikipedia.org/wiki/Obtuse_triangle): with one interior angle measuring more than 90°.

## Triangle Classifier
{% icon podium.png %}
Below you can use the Triangle Classifier that I made with Unity.

### Instructions
* You can move any of the 3 vertices (A, B, C) 
* The vertices positions can be changed too from the inputs on the top of the screen.
* Each time that any vertices are updated you can see the types of the triangle be updated in the top message.

{% webgl triangle-classifier %}

{% iconscopyright %}
The font and the vertice sprite used are from [Kenney](http://kenney.nl).