---
published: true
layout: post
title: unitytips&colon; Hierarchy Window Group Header
categories: Lab
tags: unity3d unitytips gamedev hierarchy-window
---
You can create a visual header to any group of components on your hierarchy window using `EditorApplication.hierarchyWindowItemOnGUI`:
{% youtube YS5H8Y2Ytww %}

## Code
{% gist 35410d682e41a504c7869a464a96c30a HierarchyWindowGroupHeader.cs %}
{% caption Any GameObject with name that starts with "---" will be considered a group header %}