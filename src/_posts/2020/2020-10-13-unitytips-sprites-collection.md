---
published: true
layout: post
title: unitytips&colon; Sprites Collection
categories: Lab
tags: unity3d unitytips gamedev
---
Sometimes we have related sprites that can be used in a prefab, like sprites for the environment, props, and scenario. Would be cool if we can easily swap them directly on the prefab without need to find and set the sprite directly in the SpriteRenderer component? 

{% youtube TJ-Ou9YMFdA %}

## SpritesCollection component
I created this `SpritesCollection` component that allows us to define a collection of sprites to a prefab/GameObject and then easily swap between the sprites available.

### Source code
{% gist d5d7c720eb910d00a5a3e217b5f95fff SpritesCollection.cs %}
{% gistimporter %}

{% note I strongly recommend that you use the `Gist Importer` to import this gist to your project, but if want to import it manually, just access [the gist](https://gist.github.com/giacomelli/d5d7c720eb910d00a5a3e217b5f95fff) and add all .cs files to any folder on your Unity project, except the `SpritesCollectionEditor.cs`, this one should be added to an `Editor` folder. %}

