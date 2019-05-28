---
published: true
layout: post
title: Using Tesseract4 with C#
categories: Lab
tags: tesseract ocr dotnet
---

Recently I've to built a small tool to read the text from thounsands of images.

The common technique to extract text from images is called OCR (Optical character recognition) and the best implementation of if is called [Tesseract](https://github.com/tesseract-ocr/tesseract).

When a I started to build the tool, I used the most famous [Tesseract's wrapper for .NET](https://github.com/charlesw/tesseract). This wrapper still use Tesseract 3. In early performance tests a decide to test Tesseract4, because the version 4 had some performance improvements:

> If you are running Tesseract 4, you can use the "fast" integer models.
>
Tesseract 4 also uses up to four CPU threads while processing a page, so it will be faster than Tesseract 3 for a single page.
>
If your computer has only two CPU cores, then running four threads will slow down things significantly and it would be better to use a single thread or maybe a maximum of two threads! Using a single thread eliminates the computation overhead of multithreading and is also the best solution for processing lots of images by running one Tesseract process per CPU core.
>
Set the maximum number of threads using the environment variable OMP_THREAD_LIMIT.
>
To disable multithreading, use OMP_THREAD_LIMIT=1
{% caption https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr %} 

To use Tesseract4 I've to remove the wrapper and called Tesseract4 directly as a process.

{% note The use of Tesseract4 cut off the time to read the images in almost half %}


## OcrTesseract4Service
I endup developing the class below to call the `tesseract.exe` using `Process.Start`.


{% gist %}
 

* https://github.com/tesseract-ocr/tesseract
* https://appliedmachinelearning.blog/2018/06/30/performing-ocr-by-running-parallel-instances-of-tesseract-4-0-python/
* https://github.com/charlesw/tesseract
* https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr
* https://github.com/doxakis/How-to-use-tesseract-ocr-4.0-with-csharp

https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/0/06/Avengers_Tesseract2012.png/revision/latest/scale-to-width-down/310?cb=20170220131242


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