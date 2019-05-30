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

## EditorWindow
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

Starting whith sprite to walk down and ending with last sprite of walk horizontal, we have 9 sprites and in all spritesheets the sprites indexes are the same:

{% screenshot alys-walking-spritesheet.png %}

* Idle: index 1
* Walk down: indexes 0, 1 and 2.
* Walk up: indexes 3, 4 and 5.
* Walk horizontal: indexes 6, 7 and 9.



## Starter project
{% logo project.png default %}

All the source code and assets for this tutorial are available on this GitHub repository: [https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites](https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites). To start the tutorial you need to fork, clone or download the repository.

```shell
git clone https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites.git
```

Open the folder `default-animations-editor-window-starter` on Unity.
{% note This starter project has an initial setup and assets to allow us to focus in the learning about how to code the EditorWindow. %}

Open the scene `_Tutorial/Scenes/TutorialScene`. 

Hit the `Play` button. You should see a screen like this:

{% video starter-project-play-mode.mp4 %}

## The editor window code organization

We will organize our DefaultAnimationsEditorWindow in 3 main classes:

* **DefaultAnimationsEditorWindow**: where you define the menu and GUI for our editor window.

* **DefaultAnimationsSettings**: this is our [ScriptableObject](https://docs.unity3d.com/Manual/class-ScriptableObject.html) to save our settings defined on DefaultAnimationsEditorWindow.

* **DefaultAnimationsUtility**: here we will implement the code used by our DefaultAnimationsEditorWindow to perform operation. Put the operation code in a separated class not bounded by the GUI allow us to use this operations in any other script. These way to work is similar what Unity it self use in some editor operations, like: [AnimationUtility](https://docs.unity3d.com/ScriptReference/AnimationUtility.html), [PrefabUtility](https://docs.unity3d.com/ScriptReference/PrefabUtility.html) and [SpriteUtility](https://docs.unity3d.com/ScriptReference/Sprites.SpriteUtility.html). 

{% note Besides the above classes, there are some other extension method classes on folder [Extensions](https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites/tree/master/default-animations-editor-window-complete/Assets/_Tutorial/Editor/DefaultAnimations/Extensions) that are self explanatory and I won't talk in details, but you can check them and read their code documentation to better understanding. %}

## DefaultAnimationsEditorWindow
In the code bellow we define the menu for the window through the method `ShowWindow` and the attribute `MenuItem`.
{% screenshot menu-item.png %}
{% caption Default Animations menu item %}

At the `OnEnable` we read the settings from our ScriptableObject DefaultAnimationsSettings.

The next 3 methods just draw the components to the editor window GUI.
{% screenshot editor-window-empty.png %}
{% caption editor window %}

{% github giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites/blob/master/default-animations-editor-window-complete/Assets/_Tutorial/Editor/DefaultAnimations/DefaultAnimationsEditorWindow.cs %}

## DefaultAnimationsSettings
There is few things to talk about this class, because it is just a ordinary ScriptableObject with a couple of properties that will be serialized and useb by the DefaultAnimationsUtility class, a singleton to make easier to access the settings, two methods to load/create the asset and a subclass to sprite mappings.

The most important code of this class is the property `SpriteIndexes` that figure out what are the sprite indexes from spritesheet that ClipToOverride is using.

{% note SpriteIndex will be used by DefaultAnimationsUtility.CreateAnimationClips to know what sprites shoud be used to create the new animations based on the DefaultAnimationsSettings.AnimationsMapping. %}

{% github giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites/blob/master/default-animations-editor-window-complete/Assets/_Tutorial/Editor/DefaultAnimations/DefaultAnimationsSettings.cs %}

## DefaultAnimationsUtility
In this class is where the heart of our editor window resides.

There are 2 important methods here: CreateAnimationClips and CreateAnimatorOverride.

### CreateAnimationClips
It terates through the `AnimationsMappings` defined in the editor window (saved on DefaultAnimationsSettings.AnimationsMapping), for each mapping it will call the method `CreateAnimationClip`.

The `CreateAnimationClip` creates a new `AnimationClip` (or load if already exists one with the same name), copying the frame rate and wrap mode from the `ClipToOverride` defined in the mapping. After, if wrap mode is a loop, it use the `AnimationUtility` to set the loop time to the clip settings (through the extension methods).

Now is the most tricky part of this class, we need to create a `EditorCurveBinding` for the sprite and get the `ObjectReferenceKeyframe` from the `ClipToOverride` and create new `ObjectReferenceKeyframe` to our new key frames (`AnimationClipExtensions`).

## CreateAnimatorOverride
In this method we create `AnimatorOverrideController` that will override each clip from the `DefaultAnimationsSettings.AnimatorController` by the ClipToOverride of each mapping defined on `DefaultAnimationsSettings.AnimationsMapping` (`AnimatorOverrideControllerExtensions`).

{% github giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites/blob/master/default-animations-editor-window-complete/Assets/_Tutorial/Editor/DefaultAnimations/DefaultAnimationsUtility.cs %}

## Setup
Copy [this whole Editor folder](https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites/tree/master/default-animations-editor-window-complete/Assets/_Tutorial/Editor) to your `Assets/_Tutorial` folder.

{% note this folder is available on your local clone of the repository inside the folder `default-animations-editor-window-complete/Assets/_Tutorial` %}

Delete the DefaultAnimationsSettings scritable object instance.

Open the editor window on menu `Windows / Default Animations` and configure it as showing in the video below:
{% youtube 5Hk8awWCtSs %}

## Using the DefaultAnimations
Drag all the spritesheets (textures) from folder `Assets/_Tutorial/Sprites` to the `Spritesheets` field and click on `Create animations` button:
{% youtube 49KKfR081Po %}

## Challenge
Try to change de editor window to allow more the one set of default animations. One way to this is creating another ScriptableObject to save the current selected `DefaultAnimationsSettings` asset.

If you have any doubt how to implement any part of this challenge, feel free to ask on this post comments or [send me a message]({{ site.baseurl}}about).

## Solution
The whole source code and assets for this tutorial are available on: [https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites](https://github.com/giacomelli/coding-an-editorwindow-to-create-default-animations-from-sprites)

This repository has two main folders:

* **adefault-animations-editor-window-starter*: the one you used to make this tutorial.
* **default-animations-editor-window-complete**: the whole solution with all scripts and assets implemented. Use this one, in case you get stuck in any item on the challenge.

## Conclusion
In this tutorial, we learn how to coding a custom editor window to create a set of default animation clips and animator override controler.

{% iconscopyright %}