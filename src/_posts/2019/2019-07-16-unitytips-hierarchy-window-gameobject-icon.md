---
published: true
layout: post
title: unitytips&colon; Hierarchy Window GameObject Icon
categories: Lab
tags: unity3d unitytips gamedev hierarchy-window
---
You can show the game objects icons in hierarchy window using `EditorGUIUtility.ObjectContent`
{% youtube fwtQ51ybHpc %}

## Code
{% gist a73c947508ee0b32eef7c422620ec6b6 HierarchyWindowGameObjectIcon.cs %}
{% gistimporter %}

The icons used in the video are [Font Awesome](https://fontawesome.com/icons) icons and I used [fa2png.io](http://fa2png.io/) to convert them to .png.

{% note Remember that you need to save the above .cs inside any `Editor` folder %}