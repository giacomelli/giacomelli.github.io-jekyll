---
published: true
layout: post
title: unitytips&colon; Changing the style of the Hierarchy Window Group Header
categories: Lab
tags: unity3d unitytips gamedev hierarchy-window
---
In my last [#unitytips](/tags/unitytips/) I demonstrated how you could create a visual header to any group of components on your hierarchy window using `EditorApplication.hierarchyWindowItemOnGUI`. Now I'm improving it allowing you to **customize its style**.

{% youtube g2lq0lIJzh8 %}
{% caption To change the style, you just need to edit the values of the HierarchyWindowGroupHeaderSettings in the inspector %}

## Code
{% gist bb6a9932e5f49a072c57a7c17135bf6b HierarchyWindowGroupHeader.cs %}
{% gistimporter %}

{% note Remember that you need to save the above .cs inside any `Editor` folder %}
{% note It's a good practice add the tag `EditorOnly` to your group header game objects %}