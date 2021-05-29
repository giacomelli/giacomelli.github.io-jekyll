---
published: true
layout: post
title: unitytips&colon; TimeSpan Box Drawer
categories: Lab
tags: unity3d unitytips gamedev property-drawer
---
You can create a [PropertyDrawer](https://docs.unity3d.com/ScriptReference/PropertyDrawer.html) to display a help box on inspector showing the time information in seconds fields using [TimeSpan format strings](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-timespan-format-strings):
{% screenshot TimeSpanBox.gif %}

## Setup
{% gist bb3b4bf52e560c3d673cd3d50f563cfb TimeSpanBoxAttribute.cs %}
{% gist bb3b4bf52e560c3d673cd3d50f563cfb TimeSpanBoxDrawer.cs %}
{% gistimporter %}

## Usage
{% gist bb3b4bf52e560c3d673cd3d50f563cfb TimeSpanBoxDrawerUsage.cs %}