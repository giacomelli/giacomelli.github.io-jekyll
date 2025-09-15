---
published: true
layout: post
title: C# 13 new features
categories: Article
tags: csharp dotnet
---
{% logo csharp.svg default %}

In **November 2024**, Microsoft released **[C# 13](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-version-history#c-version-13)**.  
It’s not a huge overhaul, but it removes some long-standing restrictions and introduces features that make code cleaner, safer, and easier to write.  

Here are the highlights — with **before vs after** examples.

---

## params collections
Before, `params` was limited to arrays.  

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 params.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 params.after.cs %}

---

## New lock semantics
When locking on `System.Threading.Lock`, the compiler now uses `EnterScope()` under the hood.

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 lock.before.cs %}

This used the `Monitor` API.  

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 lock.after.cs %}

Which is equivalent to:
{% gist 77de9ea857053c44a5c3e36164dcdfe5 lock.after.underhood.cs %}

---

## Escape sequence \e
Now you can use `\e` for the **ESC** character.

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 escape.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 escape.after.cs %}

---

## Overload resolution improvements
Ambiguous overloads are resolved better.

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 overload.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 overload.after.cs %}

---

## Indexers in initializers
The `^` (from end) operator can now be used in initializers.

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 indexer.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 indexer.after.cs %}

---

## ref in iterators and async methods

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-async.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-async.after.cs %}

---

## ref struct and interfaces

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-struct-interface.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-struct-interface.after.cs %}

---

## ref struct in generics

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-struct-generic.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 ref-struct-generic.after.cs %}

---

## Partial properties and indexers

### Before
{% gist 77de9ea857053c44a5c3e36164dcdfe5 partial-properties.before.cs %}

### After
{% gist 77de9ea857053c44a5c3e36164dcdfe5 partial-properties.after.cs %}

---

## Conclusion
{% icon conclusion.png %}
C# 13 is a **quality-of-life release**.  
The changes are small, but together they:  
- Remove old limitations (ref struct with interfaces/generics).  
- Improve expressiveness (\e, params collections).  
- Make code more consistent (lock, partial properties).  

It’s a great step forward, especially if you write libraries, low-level code, or high-performance apps.  
