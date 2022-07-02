---
published: true
layout: post
title: unitytips&colon; Scene Selection Toolbar
categories: Lab
tags: unity3d unitytips gamedev
---
Using [Unity Toolbar Extender](https://github.com/marijnz/unity-toolbar-extender) by [Marijn Zwemmer's](https://github.com/marijnz) and [Ondrej Petrzilka's](https://github.com/OndrejPetrzilka) you can easily add buttons side by side of play/pause/step buttons on the Unity editor toolbar.

## Scene Selection Toolbar
I created a gist, called `Scene Selection Toolbar`, that uses the [Unity Toolbar Extender](https://github.com/marijnz/unity-toolbar-extender) and allows us to have a dropdown with the most used scenes right on the side of the `Play` button.
{% youtube 9NfVyDsj1rQ %}

### Usage
* Import the `Unity Toolbar Extender` as described in the [Import section](https://github.com/marijnz/unity-toolbar-extender#importing) on GitHub.
* Then, just add it the gist below to any `Editor` folder of your project or use the [Gist Importer](/unitytips-gist-importer).

{% gist 4122c117c927d5c370dd562e619129e6 SceneSelectionToolbar.cs %}
{% gistimporter %}

#### Adding, removing, and opening scenes
* **Add the current scene to the list**: with any scene opened, you can click on the `+` button to add it to the scenes dropdown.
* **Remove the current scene from the list**: just click the `-` button to remove the current scene from the list.
* **Open a scene from the list**: select any scene in the dropdown to open that scene on the editor.