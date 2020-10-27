---
published: true
layout: post
title: Gamedev Utility Belt&colon; Unity Native Share Plugin
categories: Article
tags: unity3d open-source gamedev mobile android gamedev-utility-belt
---
I decided to start a [series of posts](/tags/gamedev-utility-belt/) about some game development resources that are part of my gamedev utility belt and that helps me on my game projects.

For this first post the choose one is the **[Unity Native Share Plugin](https://github.com/yasirkula/UnityNativeShare)** by [Süleyman Yasir KULA](https://twitter.com/yasirkula) that I used on my latest mobile game [Puzzimals](http://diegogiacomelli.com.br/games/puzzimals).

{% logo gamedev-utility-belt.png default %}
 
## Introduction
Unity Native Share Plugin is:
> A Unity plugin to natively share files (images, videos, documents, etc.) and/or plain text on Android & iOS.

When you use this plugin on the Android and iOS project you will be able to invoke the native share of the target operating system.
For example, here is the result when I used it on Android:
{% screenshot unity-native-share-plugin-puzzimals-sample.jpg %}

## Installation
You can follow the instructions on the plugin GitHub repository: [https://github.com/yasirkula/UnityNativeShare](https://github.com/yasirkula/UnityNativeShare#installation) to install it:

* Using .unitypackage
* Cloning the repository
* Via Asset Store
* Via Package Manager 
* Using the OpenUPM

## Usage
The plugin is quite simple to be used, there is an [example code on its repository](https://github.com/yasirkula/UnityNativeShare#example-code) that show how you can use it with few lines of code.

Some time ago I made the gist below that uses the `Unity Native Share Plugin` to add a social share component to any game object:
{% gist c03ec79fa0f0def94726f4b6914b4769 SocialShare.cs %}
{% gistimporter %}
