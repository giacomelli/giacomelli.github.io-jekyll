---
published: true
layout: post
title: unitytips&colon; Overview of .NET in Unity 
categories: Lab
tags: unity3d unitytips gamedev dotnet infographic
---
Unity Official documentation has an amazing page called [Overview of .NET in Unity](https://docs.unity3d.com/Manual/overview-of-dot-net-in-unity.html) that highlight 8 points about the usage o .NET in Unity.

I think it's important to any pro programmer in Unity quite understand those points, because of this I list them below, in a brief way. **You can (and should) read the full documentation to understand all the 8 points listed in more depth**.

At the end of this page, you can **download an infographic** with these points in case you want to share or print them.

{% logo Unity3d.png default %}

## Overview of .NET in Unity 
Read the full documentation: [https://docs.unity3d.com/Manual/overview-of-dot-net-in-unity.html](https://docs.unity3d.com/Manual/overview-of-dot-net-in-unity.html).

### Scripting backends
* Mono uses just-in-time (JIT) compilation and compiles code on demand at runtime.
* IL2CPP uses ahead-of-time (AOT) compilation and compiles your entire application before it is run.

### Managed code stripping
* When you build your application, Unity scans the compiled assemblies (.DLLs) to detect and remove unused code. 
* This process reduces the final binary size of your build, but increases build time.

### Garbage collection (GC)
* Garbage collector only runs for a limited period of time and does not necessarily collect all objects in one pass. This spreads the time it takes to collect objects over a number of frames and reduces the amount of stuttering and CPU spikes.

### .NET system libraries
* Unity tries its best to support as much of the .NET ecosystem as possible, there are some exceptions to parts of the .NET system libraries that Unity explicitly does not support.
* You should use the .NET Standard 2.0 API Compatibility Level for all new projects.

### Third-party .NET libraries
* You should only use third-party .NET libraries that have been extensively tested on a wide range of Unity configurations and platforms.
* You should profile the usage of your .NET system libraries on all target platforms.

### C# reflection overhead
* GC continuously scans the cached C# reflection objects, which causes unnecessary overhead.
* To minimize the overhead, avoid methods such as Assembly.GetTypes and Type.GetMethods().

### UnityEngine.Object special behavior
* UnityEngine.Object is a special type of C# object in Unity, because it is linked to a native C++ counterpart object.
* MonoBehaviour/ScriptableObject override the equality (==) and inequality (!=) operators.

### Avoid using async and await
* The Unity API is not thread safe and therefore, you should not use async and await tasks.
* Async tasks often allocate objects when invoked, which might cause performance issues if you overuse them.

## Infographic
* Download {% download overview-of-donet-in-unity-infographic.png overview-of-donet-in-unity-infographic.png %}
* Download {% download overview-of-donet-in-unity-infographic.pdf overview-of-donet-in-unity-infographic.pdf %}
{% screenshot overview-of-donet-in-unity-infographic.png %}