---
published: true
layout: post
title: A Sorting Layer Debugger for Unity
categories: Lab
tags: unity3d unitytips sorting-layers 2D editor-window gamedev open-source
---
While I was reading about [2D Sorting](https://docs.unity3d.com/Manual/2DSorting.html) and [Sorting Layers](https://docs.unity3d.com/Manual/class-TagManager.html#SortingLayers) on Unity Manual I came up with the idea of creating a custom editor window to see which sorting layer the sprites on the scene are using.

{% youtube e_WaZrGMPdM %}
{% caption In the video above you can see the Sorting Layer Debugger been used in the [Unity 2D Platformer](https://assetstore.unity.com/packages/essentials/tutorial-projects/2d-platformer-11228) sample project %}

## Setup
Just download the gist bellow to your Unity3D project and add it inside a `Editor` folder.

{% gist 141742c3175476f03ca2437c7b35fd88 SortingLayerDebugger.cs %}

## Usage
You can open the debugger window through the menu `Window / Sorting Layer Debugger`.

The debugger can be enabled in the edit or the play mode and it will list the Sorting Layers and the number of game objects using each layer. You can hide/show the game objects of each layer by clicking on its check box.

The name of Sorting Layer been used is showing in the top of each game object in the scene view.

{% screenshot SortingLayerDebugger.png %}
{% caption Scene view with Sorting Layer Debugger enabled %}