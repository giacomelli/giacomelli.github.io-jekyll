---
published: false
layout: post
title: Drawing a Maurer Rose With Unity
categories: Tutorial
tags: unity3d gamedev math curves
---
In this tutorial we will learn how to draw a [Maurer Rose](https://en.wikipedia.org/wiki/Maurer_rose) with a [LineRenderer](https://docs.unity3d.com/ScriptReference/LineRenderer.html) in Unity.

## Introduction
Recently, I was watching a [Daniel Shiffman's](https://twitter.com/shiffman) video about Maurer Rose in that inspired me to try it on Unity.

Now you should be thinking "What hell is a Maurer Rose?", well, I did not know too until watch [that video](https://youtu.be/4uU9lZ-HSqA).

Let see what Wikipedia say about:

> A Maurer rose of the rose r = sin(nθ) consists of the 360 lines successively connecting the above 361 points. Thus a Maurer rose is a polygonal curve with vertices on a rose.

The following gif shows the evolution of a Maurer rose (n = 2, d = 29°) from 1 point to 361 points.
{% screenshot maurer-rose-sample.gif %}

# Definition
{% icon project.png %}

A Maurer Rose is always defined by two input parameters: `n` and `d`.

* The `n` represents the number of petals. The rose has n petals if n is odd, and 2n petals if n is even (look to the gif above, n = 2, then 4 petals).
* The `d` represents the angle in degrees for each line.

> Let r = sin(nθ) be a rose in the polar coordinate system, where n is a positive integer. 
> 
> We then take 361 points on the rose:
> (sin(nk), k) (k = 0, d, 2d, 3d, ..., 360d),
> where d is a positive integer and the angles are in degrees, not radians.

This definitions talk about [polar coordinate system](https://en.wikipedia.org/wiki/Polar_coordinate_system). The more importante thing to know about it is this: `each point on a plane is determined by a distance from a reference point and an angle from a reference direction`. So, if you want to draw a line from a point, we need take that point, a angle and distance to calculate the second point.

# The formula
{% icon math.png %}

The basic formula is: `r = sin(nθ)` and we need to apply it to 361 points, where:

`r = sin(n * (d * point))`

In C# the code is something like this:

```csharp
for (int i = 0; i < 361; i++)
{
    k = i * (D * Mathf.PI / 180f);
    r = Mathf.Sin(N * k);
    x = _r * Mathf.Cos(_k);
    y = _r * Mathf.Sin(_k);    
}
```
We calculate the angle for each point, then we get the `r` and find the `x` and `y` for second point on polar coordiante system.

{% note The `Mathf.PI / 180f` is to convert from degrees to radians to work properly with Mathf functions. %}


# MaurerRoseLineRenderer
Now the complete code for a MonoBehaviour that take the formula we see in the previous section and combine it with a LineRenderer to draw the Maurer Rose.

{% gist f4aba5c5d7cbeb396ca784dff150e194 %}
{% gistimporter %}

# Using the MaurerRoseLineRenderer

To use it, just create a new GameObject and add the `MaurerRoseLineRenderer` component to it.

If you just hit play, you will see something like this:
{% screenshot maurer-rose-first-try.png %}

<br>
Go to the LineRenderer component and change the line width to `0.03`, then hit play again.
{% screenshot maurer-rose-second-try.png %}

# Testing new inputs
{% icon programmer.png %}

If you change the values of `N` and `D` of the component in the inspector, you will see a new Maurer Rose been drawing.

The image below show the result of 6 different inputs (the same inputs used on [Wikipedia](https://en.wikipedia.org/wiki/Maurer_rose)):
{% screenshot maurer-roses.png %}

# Going beyond
{% icon beyond.png %}

Now that you understand what is a Maurer Rose and how to code it inside Unity you can try do some crazy things with it, like animate the input values or the number of points, or still using it to build a particle system.

Below I show my realtime try on this matter:
<iframe src="/apps/MaurerRose/index.html"></iframe>

## Conclusion
In this tutorial we learm how to draw a Maurer Rose with a LineRenderer.
This simple formula show how math can be used explore creativity and beauty.

{% iconscopyright %}
<i>The font used on the WebGL sample is from [Kenney](http://kenney.nl).