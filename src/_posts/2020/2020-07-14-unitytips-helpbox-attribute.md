---
published: true
layout: post
title: unitytips&colon; HelpBox Attribute (with docs button)
categories: Lab
tags: unity3d unitytips gamedev custom-editor
---
You can create a [PropertyAttribute](https://docs.unity3d.com/ScriptReference/PropertyAttribute.html) to display a help box on inspector showing a few lines of information, like [EditorGUI.HelpBox](https://docs.unity3d.com/2020.1/Documentation/ScriptReference/EditorGUI.HelpBox.html), but with a `docs` button to the documentation page.
{% screenshot sample-component.png %}

## Setup
{% gist be4850e86a0aacd3de4266830566b139 HelpBoxAttribute.cs %}
{% gist be4850e86a0aacd3de4266830566b139 HelpBoxDrawer.cs %}
{% gistimporter %}

## Usage
{% gist be4850e86a0aacd3de4266830566b139 SampleComponent.cs %}