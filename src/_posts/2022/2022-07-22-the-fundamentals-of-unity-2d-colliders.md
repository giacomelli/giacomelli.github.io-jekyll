---
published: true
layout: post
title: The Fundamentals of Unity 2D colliders
categories: Tutorial
tags: unity3d gamedev logrocket
---
In the first years of Unity, there wasn’t solid support for 2D game development inside the engine — for years, the right way to refer to it was "Unity 3D". Though it was possible to develop 2D games with Unity, without official engine support, it wasn’t a smooth process like it is nowadays.

{% logo Unity3d.png default %}

Around 2013, Unity started to support 2D game development with built-in components, like a 2D physics engine, Collider2D, Rigidbody2D, Vector2, Sprite, Tilemap, etc.

In this post, we’ll cover the common properties and behaviors of 2D colliders, which messages are sent to their GameObjects, how we can use them in our scripts, and how each collider setup interacts with others.

{% note I originally wrote this post as a guest writer for [LogRocket's blog](https://blog.logrocket.com/fundamentals-unity-2d-colliders/) %}

## Tutorial sections
{% icon manifest.png %}

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
{% icon config.png %}
First, we need to create our Unity project. For this tutorial, we’ll use the version 2021.3.4f1, which, at the moment I’m writing, is the newest LTS Unity version.

On the project templates list, choose 2D(core), give it a name, and click the Create project button. We’ll call ours `SampleScene`.
{% screenshot project-template.png %}

<br>
With the project started, create two folders called `Scripts` and `Physic Materials` inside the `Assets` folder. We’ll use them to keep our project organized during the tutorial.
{% screenshot folders.png %}

## What are colliders?
{% icon problem.png %}
Before we start using our Unity project, we need to take a little dive into the basic concepts of colliders.

Colliders are the way that Unity (and most of the available game engines, if not all) manages collisions between GameObjects. For the sake of this tutorial, we are only using the 2D colliders, but a lot of the rules mentioned below are applicable to 3D colliders, too.

In Unity, a 2D collider is a component that allows us to define a shape, where we want to receive notifications in our GameObject’s script whenever another GameObject (with another collider) collides with the first collider.

> [Unity doc tip](https://docs.unity3d.com/Manual/Collider2D.html): A collider is invisible, and does not need to be the exact same shape as the GameObject’s mesh. A rough approximation of the mesh is often more efficient and indistinguishable in gameplay.


Right now, Unity has eight built-in kinds of 2D colliders:

* BoxCollider2D
* CapsuleCollider2D
* CircleCollider2D
* CompositeCollider2D
* CustomCollider2D
* EdgeCollider2D
* PolygonCollider2D
* TilemapCollider2D
{% screenshot colliders-types.png %}


## Common properties and behaviors of colliders
Every 2D collider in Unity inherits from a common class called Collider2D. As a result, they share common properties. Below is a list of the most notable and widely-used ones:
{% screenshot common-properties.png %}

* Shape (Edit collider) — Each kind of 2D collider has a different shape, but most of them allow us to change some properties of their shapes, like the scale and distance of vertices
* Material — Defines the `PhysicsMaterial2D` that can be used by the collider to define things like friction and bounciness
* isTrigger — If it’s checked, the collider will behave as a trigger. When a collider is not marked as a trigger, the physics engine will generate a collision; when the collider hits another collider, it produces the expected behaviors based on the colliders’ setups, like moving them to opposite directions or stopping them. However, when a collider is marked as a trigger, the physics engine will simply detect when it enters the space of another and no collision will be created
* Used by Effector — Determines whether the collider will be used by an `Effector2D` attached to the GameObject.

> [Unity doc tip](https://docs.unity3d.com/Manual/Effectors2D.html): Effector2D components are used to direct the forces when colliders come into contact with each other

* Offset — As the collider will be attached to a GameObject, we can use this property to define an offset position relative to the GameObject


## Adding a 2D collider to a GameObject
In our Unity project, add a `Sprite (Square)` to the opened scene (`SampleScene`):
{% screenshot create-square.png %}

Select the `Sprite (Square)` GameObject and add a component called `BoxCollider2D`:
{% screenshot square.png %}

Now repeat the process, but add a `Sprite (Circle)` to the scene and add a `CircleCollider2D` component to it.
{% screenshot circle.png %}

Move the `Circle GameObject` a little on top of the `Square GameObject`:
{% screenshot move-circle.png %}

If we hit the Play button now, nothing will happen, even if we move the GameObjects inside the editor. No collision will happen.
{% screenshot moving-circle.gif %}

Why does nothing happen? Well, we need to talk about the `Rigidbody2D` component.


## What is a Rigidbody2D component?
A Rigidbody2D is a component used to tell Unity that it should put the GameObject under the control of the physics engine. In other words, GameObjects without a rigidbody do not exist for the physics engine.

If we just add a 2D collider to our GameObject, nothing will happen because the physics engine is not aware of it. If we want the physics engine to control our GameObject, we need to add a `Rigidbody2D` component to it.
{% screenshot rigidbody2d.png %}

This means that now our GameObject is affected by gravity via the `Gravity Scale` property, and can be controlled from scripts using forces.

We Just need to add a `Rigidbody2D` to each of the GameObjects that we’ve already created and hit the Play button:
{% screenshot ball-gravity.gif %}

With the `Rigidbody2D` components added to our GameObjects, the physics engine is aware of them and has started making the gravity act.

## Using PhysicsMaterial2D to add effects
In our sample, the two GameObjects are just falling, but what if we would like to have the `Square GameObject` stay in its position and the `Circle GameObject` hit it, before bouncing like a ball?

An easy way to achieve this is using `PhysicsMaterial2D`.

Let’s add that ball effect to our sample scene. First, on the Square GameObject, change the property `Body Type` of its `Rigidbody2D` to `Static`:
{% screenshot rigidbody2d-static.png %}

Create a new `PhysicsMaterial2D`, name it `Ball physics material`, and place it inside our `Physics Materials` folder:
{% screenshot create-physics-material.png %}

Change its `Bounciness` property to 1:
{% screenshot ball-physics.png %}

On the `Circle GameObject's Rigidbody2D`, change the `Material` property to use the `Ball physics material` that we’ve just created:
{% screenshot set-physics-material.png %}

Hit the `Play` button again. Now we should see this happen:
{% screenshot ball-boucing.gif %}


## Collision callbacks
{% icon programmer.png %}
When one collider interacts with another collider, Unity sends some messages (e.g., call a method on any `MonoBehavior` attached to the `GameObject`). In the case of a 2D collider, there are six available messages:

### When IsTrigger is not checked:
* `OnCollisionEnter2D`: called in the first frame when the collision starts
* `OnCollisionStay2D`: called in each frame while the collision is happening
* `OnCollsionExit2D`: called in the first frame when the collision ends


### When IsTrigger is checked:
* `OnTriggerEnter2D`: called in the first frame when the collision starts
* `OnTriggerStay2D`: called in each frame while the collision is happening
* `OnTriggerExit2D`: called in the first frame when the collision ends


`OnCollisionStay2D` and `OnTriggerStay2D` are called each frame until they reach Time To Sleep (if the GameObject is not moving anymore).

{% screenshot time-to-sleep.png %}
{% caption We can change this setting on Project Settings / Physics 2D %}

## Using collision callbacks on scripts
It’s time to write some code. Let’s create a script to log every time that our `Circle GameObject` hits the `Square GameObject` (`OnCollisionEnter2D`) to the console window. We’ll record how many frames they stay in contact (`OnCollisionStay2D`), and when they stop hitting each other (`OnCollsionExit2D`). We’ll also show what happens with and without a trigger

### Without a trigger
Inside our `Scripts` folder, create a script called `CollisionLogger` and add it to the `Circle GameObject`:
{% screenshot collision-logger.png %}

Open the `CollisionLogger` script on editor and type these methods:
{% gist 94b530c223d99f34d4fd6a0ab0702f51 CollisionLogger.cs %}

Hit the `Play` button, and we should see something like this in the Console window:
{% screenshot console-window-1.png %}

As we can see, `OnCollisionEnter2D` is called when the `Circle GameObject` hits the `Square GameObject`. `OnCollsionExit2D` is called when they aren’t hitting each other anymore, and `OnCollisionStay2D` has not been called because the two GameObjects are not keeping contact. To see `OnCollisionStay2D` being sent, just remove the `Ball physics material` from the `Circle GameObject's Rigidbody2D`:
{% screenshot remove-physical-material.png %}

Hit the `Play` button again and the output in our Console window should be:
{% screenshot console-window-2.png %}

Now we have one `OnCollisionEnter2D` and a lot of `OnCollisionStay2D` that will be called until the two GameObjects keep the contact or until Time To Sleep is reached.

Now, re-enable the `Ball physics material` on the `Circle GameObject's Rigidbody2D` and add the `CollisionLogger` to the `Square GameObject` too.

Hit `Play`, and the Console window should look like this:
{% screenshot console-window-3.png %}

As expected, the messages are called in all GameObjects involved in the collision.

### With a trigger
What about the `OnTrigger` method? Right now, none of our colliders are marked as a trigger (`IsTrigger`), which is why only `OnCollision` has been called.

Triggers are useful when we need to detect that a given GameObject has reached a point or another GameObject. Let’s say we want to be notified on `Square GameObject` every time that the `Circle GameObject` passes through it. We can add a collider with `IsTrigger` checked on it and we will receive the notification when the physics engine calls the `OnTriggerEnter2D` method.

To see a trigger in action, mark the `Square GameObject's collider` as a trigger:
{% screenshot istrigger.png %}


Play the scene, and we’ll see that `Circle GameObject` is passing through the `Square GameObject`:
{% screenshot passing-through.gif %}

This happens because the `Square GameObject` is a trigger now. The physics engine won’t generate the expected behavior when two objects collide, but will instead send the `OnTrigger` methods to the involved GameObjects.

If we look at the Console window, you’ll notice that it is empty because no `OnCollision` methods are called. To log the `OnTrigger` methods, open our `CollisionLogger` script and add these new methods:
{% gist 94b530c223d99f34d4fd6a0ab0702f51 trigger-methods.cs %}


Run the scene and we can see this log in the Console window:
{% screenshot console-window-4.png %}
{% screenshot console-window-5.png %}

Now only `OnTrigger` methods are called because there is a trigger involved in the collision.

An important thing to note is that all `OnCollision` and `OnTrigger` methods receive the parameter `Collision2D/Collider2D`. This parameter can hold information about the collision itself, such as:

* Which other GameObject collides with the current GameObject
* Which contact points are involved in the collision
* The relative linear velocity of the two colliding objects

If we don’t need to use this information in our script, we can declare the `OnCollision/OnTrigger` methods without the logging parameter.

## Collider interactions
{% icon component.png %}
You probably noticed in the last section that there is parity between the `OnCollision` and `OnTrigger` methods the physics engine calls on the GameObjects involved in the collision. Knowing when each kind of interaction raises each kind of message/method in the involved GameObjects can be a little tricky; despite this apparent similarity, there are some rules for interaction possibilities between different collider setups.

There are six different setups a collider can have that will differently affect how it interacts with other colliders. These setups can be done by a combination of the properties `IsTrigger` of the `Collider2D` and the property `Body Type` of the `Rigidbody2D` attached to the same GameObject. Below is a list of similar setups:

* Static Collider
    * IsTrigger: false
    * Body Type: Static

* Rigidbody Collider
    * IsTrigger: false
    * Body Type: Dynamic

* Kinematic Rigidbody Collider
    * IsTrigger: false
    * Body Type: Kinematic

* Static Trigger Collider
    * IsTrigger: true
    * Body Type: Static

* Rigidbody Trigger Collider
    * IsTrigger: true
    * Body Type: Dynamic

* Kinematic Rigidbody Trigger Collider
    * IsTrigger: true
    * Body Type: Kinematic

### How do these setups affect collider interactions?    
The answer to this question is in the table below, which I took from the [Unity documentation site](https://docs.unity3d.com/Manual/CollidersOverview.html). It shows us where the collisions happen and when the collision callbacks (the `OnCollision` and `OnTrigger` methods) are called.
{% screenshot collider-interactions-table.png %}
{% caption Source: [Unity docs](https://docs.unity3d.com/Manual/CollidersOverview.html) %}

Looking at the table, we can figure out things like:

* A Static collider only interacts with a Rigidbody collider
* A Rigidbody collider can interact with a Static collider, Rigidbody Collider, and Kinematic Rigidbody Collider
These tables can be very useful during game development, when we get stuck with some sort of collider interaction that we expected to happen but it doesn’t.

To help us to better understand the colliders’ interactions, now and when we face the kind of problem mentioned above, I created a sample where we can move the GameObjects through each of the six possible interaction setups, see how they interact with each other, and what callbacks messages are sent.

> Try it and move each collider setup to better understand what messages are sent for each interaction

{% webgl collider-interactions %}
{% caption [https://diegogiacomelli.com.br/apps/collider-interactions](https://diegogiacomelli.com.br/apps/collider-interactions) %}

## Physics2D settings
For the last part of this tutorial, I would like to mention the Physics2D settings.

These settings are not within the scope of this tutorial — talking about some of them could fill another whole tutorial — but I think it’s important to know that they exist, what their default values are, and that we can adjust them to the needs of our project.

You can access these settings via Project Settings > Physics 2D.
{% screenshot physics2d-settings.png %}

Settings like `Gravity` are pretty straightforward, but things like `Velocity Iterations` and `Position Iterations` can be a little obscure and can affect game behaviors a lot.

Most of these settings are changed when we need to achieve some kind of non-conventional physics behavior or performance improvement, but you should be aware that you’ll need to retest gameplay after each change you make to these settings to ensure that you haven’t broken anything.

The bottom line is: make sure to only change these settings after studying and understanding their impact.


## Source code and samples
* [Tutorial source code](https://github.com/giacomelli/the-fundamentals-of-unity-2d-collider-tutorial)
* [Online Collision Interactions sample](https://diegogiacomelli.com.br/apps/collider-interactions)

## Conclusion
{% icon conclusion.png %}
In this tutorial, we’ve explained the fundamentals of Unity 2D Colliders: what they are, what their common properties and behaviors are, how to add a `BoxCollider2D` and `CircleCollider2D` to a GameObject, what a `Rigidbody2D` is and how to use `PhysicsMaterial2D`, what the collision callbacks are and how to use them on our scripts, and, finally, the kinds of collider setups and how they interact.

{% iconscopyright %}
The sprites used on the WebGL sample are from [Kenney](http://kenney.nl).