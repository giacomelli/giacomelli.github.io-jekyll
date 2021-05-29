---
published: true
layout: post
title: unitytips&colon; Editor Coroutines
categories: Lab
tags: unity3d unitytips gamedev
---
{% logo Unity3d.png default %}
Recently, I was doing a small experiment trying to run an [CHIP-8](https://en.wikipedia.org/wiki/CHIP-8) emulator inside the Unity Editor inspector window and for that I needed to update from times to time the inspector.

Initially I tried to use `EditorApplication.update`, but as it is only called when something changes in the inspector, it ended up not serving this purpose.

It was then that I discovered this official Unity package: [Editor Coroutines](https://docs.unity3d.com/Packages/com.unity.editorcoroutines@0.0/manual/index.html)

> The Editor Coroutines package allows the user to start the execution of iterator methods within the Editor similar to how we handle Coroutines inside MonoBehaviour scripts during runtime.

## Usage
At this time we cannot use any of the yield classes present inside the Unity Scripting API, like WaitForSeconds and WaitForEndOfFrame, except for the CustomYieldInstruction.

However, there is a specific yielding class for wait seconds on Editor: [EditorWaitForSeconds](https://docs.unity3d.com/Packages/com.unity.editorcoroutines@0.0/api/Unity.EditorCoroutines.Editor.EditorWaitForSeconds.html)

In my case, I used the `yield return null` to skip a frame within the Editor and get the refresh rate that I would like.

{% gist 96086201cb5cc512ce7a15a02ebcf29a %}

{% screenshot chip-8-inside-unity-editor.gif %}
{% caption The result of using the `EditorCoroutineUtility.StartCoroutine` %}

<br>
{% note More details in the official documentation: [Editor Coroutines](https://docs.unity3d.com/Packages/com.unity.editorcoroutines@0.0/api/Unity.EditorCoroutines.Editor.EditorCoroutineUtility.html) %}
