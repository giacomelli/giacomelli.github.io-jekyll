---
published: true
layout: post
title: HTML5 audio tag, large files and ASP .NET
categories: Lab
tags: dotnet audio html asp-net csharp
---
## Introduction
If you have tried to change the current playback position (currentTime) of large audio files using the HTML5 audio tag, even using the preload attribute, you probably struggled with the fact that the audios would never play at that position but would start playing again from the beginning of the audio.

This happens because most browsers, Chrome included, request that the headers `accept-ranges` and `content-range` should be in the audio file response.

## ASP .NET solution
If you are using ASP .NET, the easiest way to include those headers in the response is to use the third parameter of the `Controller's File` method:

{% gist 2e0a4ba574e8864d9e30fd6e641f628d audio.cs %}

Then, the result response will have the needed headers that make browsers happy and allow you to change the audio's playback position.
{% screenshot response-headers.png %}