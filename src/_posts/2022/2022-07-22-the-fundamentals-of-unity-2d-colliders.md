---
published: true
layout: post
title: The fundamentals of Unity 2D colliders
categories: Tutorial
tags: unity3d gamedev logrocket
---
In the first years of Unity, there wasn’t solid support for 2D game development inside the engine — for years, the right way to refer to it was "Unity 3D". Though it was possible to develop 2D games with Unity, without official engine support, it wasn’t a smooth process like it is nowadays.

Around 2013, Unity started to support 2D game development with inbuilt components, like a 2D physics engine, Collider2D, Rigidbody2D, Vector2, Sprite, Tilemap, etc.

In this post, we’ll cover the common properties and behaviors of 2D colliders, which messages are sent to their GameObjects, how we can use them in our scripts, and how each collider setup interacts with others.

## Tuorial sections
* Setting up our Unity project
* What are colliders?
* Common properties and behaviors of colliders
* Adding a 2D collider to a GameObject
* What is a Rigidbody2D component?
* Using PhysicsMaterial2D to add effects
* Collision callbacks
* Using collision callbacks on scripts
* Without a trigger
* With a trigger
* Collider interactions
* How do these setups affect collider interactions?
* Physics2D settings
* Source code and samples

## Prerequisites
The following prerequisites are required to follow along with this tutorial:

* Basic knowledge of Unity
* Previous experience writing C# scripts in Unity


## Setting up our Unity project
First, we need to create our Unity project. For this tutorial, we’ll use the version 2021.3.4f1, which, at the moment I’m writing, is the newest LTS Unity version.

On the project templates list, choose 2D(core), give it a name, and click the Create project button. We’ll call ours `SampleScene`.
{% screenshot project-template.png %}