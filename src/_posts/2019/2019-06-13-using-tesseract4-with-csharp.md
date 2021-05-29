---
published: true
layout: post
title: Using Tesseract 4 with C#
categories: Lab
tags: tesseract ocr dotnet
---

Recently I built a small tool to read the text of thousands of images.

## Introduction
A common technique to extract text from images is know as OCR (Optical character recognition) and the best implementation, that I Know, is called [Tesseract](https://github.com/tesseract-ocr/tesseract).

When a I started to build the tool, I used the most famous [Tesseract's wrapper for .NET](https://github.com/charlesw/tesseract). 

Although the wrapper worked very well, I was curious about if there was a way to get better peformance results. With a little search I noticed that the .NET wrapper still use Tesseract 3, but there was a version 4 available with a lot of performance improvements:

> If you are running Tesseract 4, you can use the "fast" integer models.
>
Tesseract 4 also uses up to four CPU threads while processing a page, so it will be faster than Tesseract 3 
{% caption https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr %} 

So, I decided to try Tesseract 4 to see how could it impact in the performance of my tool. As at the time there was no .NET wrapper for it, I removed the old wrapper and called Tesseract 4 directly as a process.

{% note The use of Tesseract 4 cut off the time to read the images in almost half %}


## TesseractService
I ended up developing the class below to call the `Tesseract 4` command-line `(tesseract.exe)` directly from the C# code. 
{% include ad.html %}
{% gist ae80c1ed9b374894b21890f1d2dee42a TesseractService.cs %}
 
## Setup
* Just download the gist above and add it to your .NET project.
* Install Tesseract 4
   * Linux and OSX: [https://github.com/tesseract-ocr/tesseract/wiki](https://github.com/tesseract-ocr/tesseract/wiki)
   * Windows: [https://github.com/UB-Mannheim/tesseract/wiki](https://github.com/UB-Mannheim/tesseract/wiki) 
* Download the trained data model for the language you need to read the images
   * More accurate, but slower: [https://github.com/tesseract-ocr/tessdata_best](https://github.com/tesseract-ocr/tessdata_best)
   * Faster, but less accurate: [https://github.com/tesseract-ocr/tessdata_fast](https://github.com/tesseract-ocr/tessdata_fast).

## Usage
{% gist ae80c1ed9b374894b21890f1d2dee42a usage-sample.cs %}

If you try to read a image like this one:
{% screenshot input-sample-image.png %}

You will get this result after call the `TesseractService.GetText` method:
`The (quick) [brown] {fox} jumps!
Over the $43,456.78 <lazy> #90 dog
& duck/goose, as 12.5% of E-mail
from aspammer@website.com is spam.
Der ,.schnelle" braune Fuchs springt
iiber den faulen Hund. Le renard brun
«rapide» saute par-dessus le chien
paresseux. La volpe marrone rapida
salta sopra il cane pigro. El zorro
marron rapido salta sobre el perro
perezoso. A raposa marrom rapida
salta sobre o céo preguicoso.`

## Further reading
* [A .Net wrapper for tesseract-ocr](https://github.com/charlesw/tesseract)
* [Can I increase speed of OCR?](https://github.com/tesseract-ocr/tesseract/wiki/FAQ#can-i-increase-speed-of-ocr)
* [How to use Tesseract OCR 4.0 with C#](https://github.com/doxakis/How-to-use-tesseract-ocr-4.0-with-csharp)
* [Performing OCR by running parallel instances of Tesseract 4.0](https://appliedmachinelearning.blog/2018/06/30/performing-ocr-by-running-parallel-instances-of-tesseract-4-0-python/)
* [Tesseract repository](https://github.com/tesseract-ocr/tesseract)

