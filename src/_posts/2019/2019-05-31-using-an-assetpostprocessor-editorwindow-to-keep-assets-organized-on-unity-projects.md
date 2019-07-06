---
published: true
layout: post
title: Using an AssetPostprocessor + EditorWindow to keep assets organized on Unity projects
categories: Lab
tags: unity3d editor-window asset-post-processor gamedev open-source
---
I created an AssetPostProcessor and an EditorWindow to validate if assets are in the right folder and help the Unity projects to keep organized.

## Introduction
There are many ways to structure folders in a Unity project, but most common ones are cited by the Unity Learn tutorial: [Large Project Organisation](https://unity3d.com/pt/learn/tutorials/topics/tips/large-project-organisation):

> To keep the project easy to navigate, avoid placing files in the root Assets folder. Use subfolders. How you organize those subfolders is generally decided by your projects but the two main ways to do it are:
>
>**A folder for each type of asset and subfolders in them per objects**, zones (For example Assets/Materials, Assets/Prefabs, with subfolders Assets/Material/Level1 or Assets/Prefabs/Enemies)
>
>**A folder per objects or zones** (Such as Assets/Level1/Enemies/Archer, Assets/Shared/UI, Assets/Forest/Trees) with all assets related to those in the folders (Assets/Forest/Trees/BigTree.fbx, Assets/Forest/Trees/Tree.mat, Assets/Forest/Trees/Tree_Bark.jpg). 

With big teams or even with the small ones is easy that some assets will be placed in wrong folders. To help to identify and keep those projects folders organized I coded a couple of editor scripts that I called `Folder organizer`.

{% note Another advantage of keeping assets organized in their proper folders is that you can [apply defaults presets to assets by folder](https://docs.unity3d.com/Manual/DefaultPresetsByFolder.html). %}

# Setup
To setup the `Folder organizer` just download this [gist](https://gist.github.com/giacomelli/2d561e29beadab641a4f8b56954f53f7) and unzip it on an `Editor` folder inside your Unity project. 
{% gistimporter %}

## Using
You can open the window through the menu `Window / Folder organizer`.

Just configure the folders to ignore, if should run the validation every time an asset is imported and defined a regular expression to find the assets and what is the expected folder.

In the video below you can see in more details how to use the `Folder organizer` to validate if your assets are in the right folders:
{% youtube GU6jWl6MpdM %}

