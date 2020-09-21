---
published: true
layout: post
title: unitytips&colon; ShadowCaster2DFromCollider Component
categories: Lab
tags: unity3d unitytips gamedev
---
If you try to use a [ShadowCaster2D](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@7.1/manual/2DShadows.html) in a [SpriteShape](https://docs.unity3d.com/Packages/com.unity.2d.spriteshape@3.0/manual/index.html) the shadow produced will have a box form, no matter the form of your SpriteShape.

This happens because `ShadowCaster2D` does not update its internal shape according to the `SpriteShape's` form.

## ShadowCaster2DFromCollider component
I created this script to help to have **SpriteShape with ShadowCaster2D casting right shadows**.<br>
To use it you need to add a [PolygonCollider2D](https://docs.unity3d.com/ScriptReference/PolygonCollider2D.html) or an [EdgeCollider2D](https://docs.unity3d.com/Manual/class-EdgeCollider2D.html) to your `SpriteShape's` gameobject and then add the `ShadowCaster2DFromCollider` component to the same gameobject.

Below you can see a video showing a scene with some SpriteShapes before and after applying the ShadowCaster2DFromCollider component.
{% youtube m8nnTek5U0Y %}

## Source code
{% gist c208e20ecf75a77e0833f4c7671a0052 %}
{% gistimporter %}

{% note This solution was based on this Unity Forum post: https://forum.unity.com/threads/can-2d-shadow-caster-use-current-sprite-silhouette.861256 %}
