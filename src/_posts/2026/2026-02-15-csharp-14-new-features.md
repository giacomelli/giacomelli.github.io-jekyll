---
published: true
layout: post
title: C# 14 new features
categories: Article
tags: csharp dotnet
---
{% logo csharp.svg default %}

In **November 2025**, Microsoft released **[C# 14](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-14)**.  
It continues the trend of incremental but powerful language improvements. This version focuses on expressiveness, library authoring, and reducing boilerplate, while also adding a few long-requested features.

In this post, we’ll explore the main C# 14 features with clear explanations and practical code samples.

---

## 1. Extension Members

C# 14 introduces **extension members**, allowing extension methods, **properties**, and other members to be grouped more naturally and behave more like real members.

{% gist c62bdf48ff20cc16607b69eb175dc574 extension.members.cs %}


## 2. Null-Conditional Assignment

You can now assign values using the null-conditional operator (`?.`).  
The assignment only occurs if the receiver is not `null`.

{% gist c62bdf48ff20cc16607b69eb175dc574 null.conditional.assignment.cs %}

---

## 3. `nameof` Supports Unbound Generic Types

`nameof` can now be used with **unbound generic types**, which is especially useful for logging, diagnostics, and analyzers.

{% gist c62bdf48ff20cc16607b69eb175dc574 nameof.supports.unbound.generic.types.cs %}

---

## 4. More Implicit Conversions for `Span<T>` and `ReadOnlySpan<T>`

C# 14 expands implicit conversions, making `Span<T>` and `ReadOnlySpan<T>` even easier to work with.

{% gist c62bdf48ff20cc16607b69eb175dc574 more.implicit.conversions.for.span.cs %}

---

## 5. Modifiers on Simple Lambda Parameters

You can now apply modifiers such as `ref`, `out`, `in`, or `scoped` directly to **simple lambda parameters**.

{% gist c62bdf48ff20cc16607b69eb175dc574 modifiers.on.lambda.cs %}

---

## 6. Field-Backed Properties

C# 14 introduces **field-backed properties**, eliminating the need for explicit backing fields in many scenarios.

{% gist c62bdf48ff20cc16607b69eb175dc574 field.backed.properties.cs %}

---

## 7. Partial Events and Constructors

Just like methods and properties, **events and constructors** can now be declared as `partial`.

{% gist c62bdf48ff20cc16607b69eb175dc574 partial.events.constructors.cs %}

---

## 8. User-Defined Compound Assignment Operators

Types can now define compound assignment operators such as `+=`, `-=`, `*=`, and more.

{% gist c62bdf48ff20cc16607b69eb175dc574 user.defined.compound.assignment.operators.cs %}

---

## 9. New Preprocessor Directives for File-Based Apps
File-based apps are programs that you compile and run by using dotnet run Program.cs (or any *.cs file). The C# compiler ignores these preprocessor directives, but the build system parses them to produce the output. These directives generate warnings when encountered in a project-based compilation.

The C# compiler ignores any preprocessor directive that starts with #: or #!.

The #! preprocessor directive enables Unix shells to directly execute a C# file by using dotnet run

{% gist c62bdf48ff20cc16607b69eb175dc574 preprocessor.file.based.app.cs %}

---

## Conclusion
{% icon conclusion.png %}
C# 14 may look subtle at first glance, but it delivers meaningful improvements for everyday development and advanced library scenarios. From extension members and field-backed properties to better Span support and partial events, these features reduce boilerplate and unlock cleaner designs.

If you’re building libraries, analyzers, or performance-sensitive code, C# 14 is well worth exploring.
