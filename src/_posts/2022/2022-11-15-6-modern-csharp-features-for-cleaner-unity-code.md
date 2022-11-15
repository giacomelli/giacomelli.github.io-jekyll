---
published: true
layout: post
title: 6 modern C# features for cleaner Unity code
categories: Tutorial
tags: unity3d gamedev logrocket
---
Since C# 7.0, many code improvements that help us write less code have been added to the language.

{% logo Unity3d.png default %}

This tutorial will focus on six new features that can help us write more concise and readable code and how we can use these features on our C# for Unity.

{% note I originally wrote this post as a guest writer for [LogRocket's blog](https://blog.logrocket.com/6-modern-c-sharp-features-cleaner-unity-code/) %}

## Tutorial sections
{% icon requirements.png %}

* Prerequisites
* Setting up our Unity project
* Tutorial structure
* C# features support in Unity
* Switch expression
* Property pattern
* Type pattern
* Constant pattern
* Relational pattern
* Logical pattern
* Conclusion


## Prerequisites
The following prerequisites are required to follow along with this tutorial:

* Basic knowledge of Unity
* Previous experience writing C# scripts in Unity


## Setting up our Unity project
{% icon config.png %}
First, we need to create our Unity project. For this tutorial, we’ll use the version 2021.3.4f1, which, at the moment I’m writing, is the newest LTS Unity version.

On the project templates list, choose 2D(core), give it a name, and click the Create project button.
{% screenshot project-template.png %}

<br>
With the project started, create two folders called `Scripts` inside the `Assets` folder. We’ll use them to keep our project organized during the tutorial.
{% screenshot folders.png %}

## Tutorial structure
For each sample of how to use the new C# feature, we will first look at how it was done before and then how we could write less and more readable code with the new feature.

The classes below are just stubs that are used on all samples throughout the tutorial. You can add them to a script inside the `Scripts folder:
{% gist 7c30665bc635b4950a9b949e4de7516d base.cs %}


## C# features support in Unity
In C# versions 8 and 9, a lot of new features were added to the language. You can read the full features list for each version in the links below:
* [What's new in C# 8.0](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8)
* [What's new in C# 9.0](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-9)

### C# 8 and 9 features in Unity: What’s missing?
{% icon problem.png %}
Unity support for C# 8 has started on version [2020.2](https://docs.unity3d.com/2020.2/Documentation/Manual/CSharpCompiler.html) and C# 9 has started on version [2021.2](https://docs.unity3d.com/2021.2/Documentation/Manual/CSharpCompiler.html). 

* Be aware that not every C# 8 and 9 feature is supported by Unity, like:
* default interface methods
* indices and ranges
* asynchronous streams
* asynchronous disposable
* suppress emitting locals init flag
* covariant return types
* module initializers
* extensible calling conventions for unmanaged function pointers
* init only setters

Most of these unsupported features are used in very specific scenarios, like [extensible calling conventions for unmanaged function pointers](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/proposals/csharp-9.0/function-pointers), and some aren’t, like [indices and ranges](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#indices-and-ranges). 

Because of this, features like indices and ranges and init only setters will likely be supported in future versions of Unity. However, the chance of an unsupported feature for a very specific scenario gaining Unity support in the future is smaller than a feature like [indices and ranges](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#indices-and-ranges)

Maybe you can find some workarounds to use these unsupported features in Unity, but I discourage you from doing this because Unity is a cross-platform game engine. A workaround in a new feature could lead you to problems quite hard to understand, debug, and resolve.

Fortunately, Unity supports some of the more common patterns and expressions from C# 8 and 9. Let’s review some of the most helpful ones below and see how they can enable us to write cleaner code.


## Switch expression
The switch expression can dramatically simplify and reduce the LOC (Lines Of Code) to make a `switch`, because we can avoid a bunch of boilerplate code, like the case and return statements.

> [Doc tip](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#switch-expressions): the switch expression provides for switch-like semantics in an expression context. It provides a concise syntax when the switch arms produce a value.
> 
> Often, a switch statement produces a value in each of its case blocks. Switch expressions enable you to use more concise expression syntax. There are fewer repetitive case and break keywords and fewer curly braces.


### Before
{% gist 7c30665bc635b4950a9b949e4de7516d switch-expression-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d switch-expression-after.cs %}


## Property pattern
The property pattern enables you to match on properties of the object examined in a `switch` expression.

As you can see in the sample below, using a property pattern, we can transform a series of `if` statements into a simple list of properties that the object on the `switch` statement should match.

The `_ =>` has the same meaning as the `default` on a classic `switch`.

> [Doc tip](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-8#property-patterns): a property pattern matches an expression when an expression result is non-null and every nested pattern matches the corresponding property or field of the expression result.

### Before
{% gist 7c30665bc635b4950a9b949e4de7516d property-pattern-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d property-pattern-after.cs %}


## Type pattern
We can use type patterns to check if the runtime type of an expression is compatible with a given type.

The type pattern is almost the same logic as a property pattern but is now used in a context of an object type. We can transform a series of `if` statements that check an object type into a list of types that the object on the `switch` statement should match.

### Before
{% gist 7c30665bc635b4950a9b949e4de7516d type-pattern-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d type-pattern-after.cs %}
Using the type pattern, we go from 16 lines of code to only 8 that have the same result and are quite clear to read and understand.


## Constant pattern
A constant pattern can be used to test if an expression result equals a specified constant.

Probably the simplest pattern match, it just matches a constant value (for instance, a string) and then returns the result.

### Before
{% gist 7c30665bc635b4950a9b949e4de7516d constant-pattern-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d constant-pattern-after.cs %}
A constant pattern can be used with any constant expression, like `int, float, char, string, bool, and enum`.


## Relational pattern
A relational pattern will compare an expression result with a constant.

This one could seem the most complex pattern match, but at its core it’s not that complicated. What we can do with a Relational Pattern is directly use logical operators as `<, >, <=, or >=` to evaluate the object and then provide a result for the `switch`.

> [Doc tip](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/patterns#relational-patterns): the right-hand part of a relational pattern must be a constant expression.

### Before
{% gist 7c30665bc635b4950a9b949e4de7516d relational-pattern-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d relational-pattern-after.cs %}
Any of the relational operators `<, >, <=, or >=` can be used on a relational pattern.


## Logical pattern
We can use the `not`, `and`, and `or` pattern combinators to create logical expressions.

This is like an extension of the relational pattern where you can combine the logical operators not, and, and or to create a more complex and elaborate pattern match.

> [Doc tip](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/patterns#logical-patterns): you use the not, and, and or pattern combinators to create the following logical patterns:
> * Negation not pattern that matches an expression when the negated pattern doesn't match the expression
> * Conjunctive and pattern that matches an expression when both patterns match the expression
> * Disjunctive or pattern that matches an expression when either pattern matches the expression

### Before
{% gist 7c30665bc635b4950a9b949e4de7516d logical-pattern-before.cs %}

### After
{% gist 7c30665bc635b4950a9b949e4de7516d logical-pattern-after.cs %}


## Conclusion
{% icon challenge.png %}
In this tutorial, we’ve learned how to use the switch expression, property pattern, type pattern, constant pattern, relational pattern, and logical pattern to write less and more modern C# code on Unity. 

Hopefully, you can use some of these in your next project to spare yourself time while writing cleaner code.

{% iconscopyright %}