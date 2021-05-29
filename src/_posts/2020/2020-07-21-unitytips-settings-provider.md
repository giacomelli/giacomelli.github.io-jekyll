---
published: true
layout: post
title: unitytips&colon; SettingsProvider
categories: Lab
tags: unity3d unitytips gamedev custom-editor
---
You can add a custom section to [Project Settings](https://docs.unity3d.com/Manual/comp-ManagerGroup.html) window that allows you to configure some global settings for your project using a [SettingsProvider](https://docs.unity3d.com/2018.3/Documentation/ScriptReference/SettingsProvider.html)
{% screenshot settings-provider.jpg %}

## Setup
{% gist 623de59997fa6f2aaeeb231a2a789933 FrameworkSettings.cs %}
{% gist 623de59997fa6f2aaeeb231a2a789933 FrameworkSettingsRegister.cs %}
{% gistimporter %}
