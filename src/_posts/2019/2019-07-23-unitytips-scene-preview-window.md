---
published: true
layout: post
title: unitytips&colon; Scene Preview Window
categories: Lab
tags: unity3d unitytips gamedev editor-window
---
I created this window that extends the Unity 3D editor so you can preview the scenes by selecting them in the project window.
{% youtube eh8nqfDCUVo %}

# Usage
As can be seen from the video above the extension can be used in two ways after adding the `Scene Preview` window to the editor (via the` Window / Scene Preview` menu):

* Selects `Scene` and clicking the `Capture screenshot` button in both edit mode and play mode.
* Running `Scene` in play mode and if there is still no preview screenshot for the scene, a screenshot will be taken automatically after 10 seconds.

## Setup
Below you can see only the code of `ScenePreviewEditor.cs`. There are 3 more files for this extension. 

Download the full [gist](https://gist.github.com/giacomelli/ad9d4dcdb702d2d1edf0663628ca9608) or use the [Gist Importer](/unitytips-gist-importer) to import the complete `Scene Preview Window` for your project.

{% gist ad9d4dcdb702d2d1edf0663628ca9608 ScenePreviewWindow.cs %}
{% gistimporter %}

{% note Remember that you need to save the above .cs files inside any `Editor` folder %}