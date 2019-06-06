---
published: true
layout: post
title: Using Tesseract4 with C#
categories: Lab
tags: tesseract ocr dotnet
---

Recently I've to built a small tool to read the text from thounsands of images.

A common technique to extract text from images is know as OCR (Optical character recognition) and the best implementation (that I Know) of if is called [Tesseract](https://github.com/tesseract-ocr/tesseract).

When a I started to build the tool, I used the most famous [Tesseract's wrapper for .NET](https://github.com/charlesw/tesseract). 

Besides the wrapper worked pretty well, I was curious about if there was a way to get better peformance results. With a little search I noticed that the .NET wrapper still use Tesseract 3, but there was a version 4 available with a lot of performance improvements:

> If you are running Tesseract 4, you can use the "fast" integer models.
>
Tesseract 4 also uses up to four CPU threads while processing a page, so it will be faster than Tesseract 3 
{% caption https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr %} 

So, I decided to try Tesseract4 to see how could it impact in the performance of my tool. As there are no .NET wrapper for it, I remove the old wrapper and called Tesseract4 directly as a process.

{% note The use of Tesseract4 cut off the time to read the images in almost half %}


# TesseractService
I endup developing the class below to call the `tesseract.exe` using `Process.Start`.

{% gist 141742c3175476f03ca2437c7b35fd88 SortingLayerDebugger.cs %}
 
# Setup
* Just download the gist above and add it to your .NET project.
* Install Tesseract4
   * Linux and OSX: [https://github.com/tesseract-ocr/tesseract/wiki](https://github.com/tesseract-ocr/tesseract/wiki)
   * Windows: [https://github.com/UB-Mannheim/tesseract/wiki](https://github.com/UB-Mannheim/tesseract/wiki) 
* Download the trained data model for the language you need to read from images
   * More acurrated, but slower: [https://github.com/tesseract-ocr/tessdata_best](https://github.com/tesseract-ocr/tessdata_best)
   * Faster, but less acurrated: [https://github.com/tesseract-ocr/tessdata_fast](https://github.com/tesseract-ocr/tessdata_fast).

# Usage
{% gist 141742c3175476f03ca2437c7b35fd88 SortingLayerDebugger.cs %}

# Further reading
* https://github.com/tesseract-ocr/tesseract
* https://appliedmachinelearning.blog/2018/06/30/performing-ocr-by-running-parallel-instances-of-tesseract-4-0-python/
* https://github.com/charlesw/tesseract
* https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr
* https://github.com/doxakis/How-to-use-tesseract-ocr-4.0-with-csharp