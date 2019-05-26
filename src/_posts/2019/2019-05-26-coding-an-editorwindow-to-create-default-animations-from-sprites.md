---
published: true
layout: post
title: Coding an EditorWindow to create default animations from sprites
categories: Tutorial
tags: unity3d editor-window animation-clip animator-override-controller gamedev open-source
---
In this tutorial we will learn how to coding a [EditorWindow](https://docs.unity3d.com/Manual/editor-EditorWindows.html) that creates [Animation Clips](https://docs.unity3d.com/Manual/AnimationClips.html) and [Animator Override Controller](https://docs.unity3d.com/Manual/AnimatorOverrideController.html) from [Sprites](https://docs.unity3d.com/Manual/Sprites.html).

## Introduction
Create animation clips from sprites is quite a simple operation to perform on Unity:
{% video create-animation-clip-from-sprite.mp4 %}

But in many case you need to repeat this operation to create other animations to the same character, like clips for idle, walk up, walk down and walk horizontal animations.

When you need to this for only one character, there is no problem, but imagine you need to create the same 4 animation clip for dozens (maybe hundreds) of characters. Besides being a boring operation, you probably will make some mistake and creating some wrong clip. In cases like that, could be a good option create your own EditorWindow to automate those operations. 

## DefaultAnimationsEditorWindow
To start, lets see what Unity Manual says about [EditorWindow](https://docs.unity3d.com/Manual/editor-EditorWindows.html):

> You can create any number of custom windows in your app. These behave just like the Inspector, Scene or any other built-in ones. This is a great way to add a user interface to a sub-system for your game.
> 
> Making a custom Editor Window involves the following simple steps:
> * Create a script that derives from EditorWindow.
> * Use code to trigger the window to display itself.
> * Implement the GUI code for your tool.

During this tutorial we will create a class called DefaultAnimationsEditorWindow that derives from EditorWindow, we will add a menu item to Unity Editor to allow call our EditorWindow and we will implement the GUI for the window.

Furthermore, we will implement the code that allow us to create Animation Clips and Animation Override Controller from sprites.

The ideia behind DefaultAnimationsEditorWindow is that when you have a bunch o charecters using the same kind of animations, they used the same structure of sprite sheets, so you can create the animations based on the sprites indexes on spritesheet texture.
{% screenshot similar-spritesheets.png %}
{% caption similar spritesheets from Phantasy Star IV (Alys, Chaz and Demi). Sprites ripped by Ultimecia from [The Spriters Resource](https://www.spriters-resource.com/genesis_32x_scd/ps4) %}

Starting whith sprite to walk down and ending with last sprite of walk horizontal, we have 9 sprites and in all spritesheets the sprites index are the same:

{% screenshot alys-walking-spritesheet.png %}

* Idle: index 1
* Walk down: indexes 0, 1 and 2.
* Walk up: indexes 3, 4 and 5.
* Walk horizontal: indexes 6, 7 and 9.



## Starter project
{% logo project.png default %}

All the source code and assets for this tutorial are available on this GitHub repository: [https://github.com/giacomelli/unity-avatar-mask-and-animation-layers](https://github.com/giacomelli/unity-avatar-mask-and-animation-layers). To start this tutorial you need to fork, clone or download the repository.

```shell
git clone https://github.com/giacomelli/unity-avatar-mask-and-animation-layers.git
```

Open the folder `avatar-mask-starter` on Unity.
{% note This starter project has an initial setup and assets to allow us to focus in the learning about Avatar Masks and Animations Layers. %}

Open the scene `_Tutorial/Scenes/TutorialScene`. 

{% note If you see a popup called `TMP importer`, hit the `Import TPM Essentials` button to import the TextMesh Pro's assets. %}

Hit the `Play` button. You should see a screen like this:

{% screenshot starter-project.png %}
{% caption Starter project running: just HUD %}

## Creating the Animation Controller

Create a new `Animation Controller` (menu `Assets/Create/Animation Controller`) and open it:

{% screenshot animator-window-empty.png %}
{% caption Animator window showing the animation controller created %}

All animation layers, nodes and transitions for this tutorial will be created inside this animation controller.

In the hierarchy, select the SciFiWarriorHP and in the Animator component set the `Controller` property to our Animation Controller.

## Making the robot walk forward
To get something running right now, we will make the robot walk forward when the button `WALK / FORWARD` became checked.

In the Animator opening with our Animation Controller drag the animation clip `Idle_GunMiddle` from folder `SciFiWarrior/Animations`. Do the same with the clip `WalkForward_Shoot`.

Create a [transition](https://docs.unity3d.com/Manual/class-Transition.html) (right click on the node and  `Make transition`) from `Any state` to `WalkForward_Shoot` and create another transition from `WalkForward_Shoot` to `Idle_GunMiddle`.

Now we need to tell to the animation controller when it should activate the two transitions, for this we will create a bool [animation parameter](https://docs.unity3d.com/Manual/AnimationParameters.html) called `WalkForward`.
{% screenshot animation-parameter.png %}
{% caption WalkForward parameter created %}

We want to activate the transition from `Any state` to `WalkForward_Shoot` when `WalkForward` is true, so select this transition (click on the arrow connecting the state `Any State` to `WalkForward_Shoot`) and in the `Conditions` list on inspector add the `WalkForward` equals `true`:
{% screenshot walk-forward-condition.png %}
{% caption WalkForward condition defined %}

Click the `reset` to auto fit the exit and transition time:
{% screenshot reset-transition.png %}
{% caption reseting the transition settings %}

Repeat the same steps as above for the transition from `WalkForward_Shoot` to `Idle_GunMiddle`, but use `false` as the value for `WalkForward`.
{% screenshot animator-base-layer.png %}
{% caption animation base layer %}

Hit the `Play` button to test the animation states. When you click on `WALK / FORWARD` the robot starts to walk, when you click it again the robot stops to walk.


### Creating the upper body avatar mask
The animation for walk forward works pretty well, the robot walks forward while it's aiming the gun. This is the whole movement animated inside the `WalkForward_Shoot` clip. 

Now we want that robot walk forward without aiming the gun, instead of this, we want it keeps the gun in the middle as it does when `Idle_GunMiddle` is active. To get this done, first, we need to create an avatar mask to the upper body.

Create a new Avatar Mask (`Assets/Create/Avatar Mask`) called `UpperBody`. In the inspector, uncheck all lower body parties, as the image below:
{% screenshot upper-body-avatar-mask.png %}
{% caption only upper body %}

### Creating a upper body animation layer
With the UpperBody Avatar Mask created, we will need to create a new animation layer that will use the mask. Go to the animator window and create a new layer using the `+ button`:
{% screenshot upperbody-animation-layer.png %}
{% caption the new layer created with the mask %}

Change the `Weight` property to 1 and set the Mask to the UpperBody Avatar Mask. Keep the `Blending` as override.

Drag the animation clip `Idle_GunMiddle` from folder `SciFiWarrior/Animations` to the `UpperBody` layer.

{% screenshot upperbody-animation-layer-fsm.png %}
{% caption upper body animation layer %}

#### Testing the animations
Hit the `Play` button to test the animation states. When you click on `WALK / FORWARD` the robot starts to walk, but now it's not aiming the gun, instead it keeps the gun in the middle.

#### Why does this happen?
So, this is done by the UpperBody Animation Layer that we added to our animation controller, as it's mask was defined with our UpperBody Avatar Mask that only consider upper body parts of the humanoid, Unity overrides the base layer animation with the upper body part of the `Idle_GunMiddle`.

## Making the robot shoot
We will make the robot shoot when the button `SHOOT / SINGLE` became checked, this will help us to better understand how the Avatar Mask and Animation Layer works to override the animations from the base layer with the animations from UpperBody layer.

In the Animator Window with our Animation Controller opened, select the UpperBody layer and drag the animation clip `Shoot_single` from folder `SciFiWarrior/Animations`. 

Create a [transition](https://docs.unity3d.com/Manual/class-Transition.html) (right click on node and  `Make transition`) from `Any state` to `Shoot_single` and create another transition from `Shoot_single` to `Idle_GunMiddle`.

Now we need to tell to the animation controller when it should activate the two transitions, for this we will create a bool [animation parameter](https://docs.unity3d.com/Manual/AnimationParameters.html) called `ShootSingle`.

{% screenshot shoot-single-parameter.png %}
{% caption ShootSingle parameter created %}

We want to activate the transition from `Any state` to `Shoot_single` when `ShootSingle` is true, so select this transition (click on the arrow connecting the state `Any State` to `Shoot_single`) and in the `Conditions` list on inspector add the `ShootSingle` equals  `true`.

Click the `reset` to auto fit the exit and transition time.

Repeat the same steps as above for the transition from `ShootSingle` to `Idle_GunMiddle`, but use `false` as the value for `ShootSingle`.

Hit the `Play` button to test the animation states. When you click on `SHOOT / SINGLE` the robot shoot.

Now you can combine the two buttons `WALK / FORWARD` and `SHOOT / SINGLE` and see how the animations combine.

## Challenge
Do something is better to learn than just reading and following someone instructions because this I will challenge you to try to implement other actions:

{% screenshot challenge.png %}
{% caption the remaining actions to the challenge %} 	 	 
To implement these actions you need to do almost the same thing we did in this tutorial so far, just using another animation clips, transitions and parameters.

{% note The challenger items are the legs because you will need to create new Avatar Masks with the `Transform` option of the avatar configuration to get the right animation. New Animation Layers will be needed as well. %}

If you have any doubt how to implement any part of this challenge, feel free to ask on this post comments or [send me a message]({{ site.baseurl}}about).

## Solution
The whole source code and assets for this tutorial are available on: [https://github.com/giacomelli/unity-avatar-mask-and-animation-layers](https://github.com/giacomelli/unity-avatar-mask-and-animation-layers)

This repository has two main folders:

* **avatar-mask-starter**: the one you used to make this tutorial.
* **avatar-mask-complete**: the whole solution with all actions implemented. Use this one, in case you get stuck in any item on the challenge.

The video below shows the complete solution running:
{% youtube sl9EheTbmhE %}

## Conclusion
In this tutorial, we learn how to use Avatar Masks and Animation Layers to animate a robot with different masks and layers.
These techniques allowing us to use already existent animations and combine them.

{% iconscopyright %}