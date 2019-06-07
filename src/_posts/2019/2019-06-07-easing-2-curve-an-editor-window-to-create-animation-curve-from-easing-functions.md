---
published: true
layout: post
title: Easing2Curve&colon; An editor window to create animation curve from easing functions
categories: Lab
tags: unity3d editor-window animation-curve gamedev open-source gist
---

I coded an [EditorWindow](https://docs.unity3d.com/Manual/editor-EditorWindows.html) to create [AnimationCurve](https://docs.unity3d.com/ScriptReference/AnimationCurve.html) using easing functions that define how much a value change over time. 

# Introduction
There are a bunch of classic easing functions, like: InQuad, OutElastic, InOutSin and InOutBounce. All them are functions that have a input parameter `time` and it return value between 0 and 1 that.

For example, the easing function `OutCirc` is coded like: 
```csharp
    public float Calculate(float time)
    {
        return (float)Mathf.Sqrt((2 - time) * time);
    }
```

In the `Easing2Curve` editor window you can see 31 easing function availables: 

* Linear
* InQuad, OutQuad, InOutQuad
* InCubic, OutCubic, InOutCubic
* InQuart, OutQuart, InOutQuart
* InQuint, OutQuint, InOutQuint
* InElastic, OutElastic, InOutElastic
* InSin, OutSin, InOutSin
* InExpo, OutExpo, InOutExpo
* InCirc, OutCirc, InOutCirc
* InBack, OutBack, InOutBack
* InBounce, OutBounce and InOutBounce.
               
In addition, you can add new easing functions just implementing the `IEasing` interface.

# Setup
To setup the `Easing2Curve` just download this [gist](https://gist.github.com/giacomelli/7324d63679c11529e1710a5470d9ee7f) and unzip it on an `Editor` folder inside your Unity project. 

{% gist 7324d63679c11529e1710a5470d9ee7f Easing2CurveEditorWindow.cs %}
## Using
You can open the window through the context menu on any `AnimationCurve` property on `Inspector`.

In the video below you can see how to use the `Easing2Curve`:
{% youtube 2W-g6-k74nc %}

