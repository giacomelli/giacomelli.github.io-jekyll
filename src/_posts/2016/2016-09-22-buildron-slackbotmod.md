---
published: true
layout: post
title: Buildron SlackBotMod
categories: News
tags: Buildron slack unity3d open-source dotnet bot
---

[Buildron](https://github.com/skahal/buildron) is a build radiator to help software development teams to see the current status of their continous integration server and [Slack](https://slack.com/) is the omnipresent communication app for almost every developer in the world.
 

For these reasons, I made a mod called [Buildron.SlackBotMod](https://github.com/giacomelli/Buildron.SlackBotMod) that let you interact with Buildron through the Slack.

{% screenshot Buildron.SlackBotMod-2016-09-18.gif %}

## Features
Currently Buildron SlackBotMod has the follow features:

### Status changed notifications
Your team can be notified by Buildron about builds status changed. In the mod preferences you can choose what status you want to receive notifications (running|succes|failed).

{% screenshot Buildron-SlackBotMod-build-status-change-notifications.png %}

### Filter builds
Filter buils by status or text.

{% screenshot Buildron-SlackBotMod-filter-by.png %}

### Reset filter
Reset previous builds filter (no filter).

{% screenshot Buildron-SlackBotMod-reset-filter.png %}

### Sort builds
Sort buils by status, text or date.

{% screenshot Buildron-SlackBotMod-sort-by.png %}

### Move camera
Move the camera the amount of pixels define in the x,y,z coordinates.

{% screenshot Buildron-SlackBotMod-move-camera.png %}

### Reset camera
Reset the camera position.

{% screenshot Buildron-SlackBotMod-reset-camera.png %}

### Take a screenshot
Take a screenshot of current Buildron state.

{% screenshot Buildron-SlackBotMod-take-screenshot.png %}
 

## Conclusion
If you are not using Buildron yet, [give it a try](https://github.com/skahal/buildron).
If you are already using Buildron and Slack, try my [Buildron.SlackBotMod](https://github.com/giacomelli/Buildron.SlackBotMod).
