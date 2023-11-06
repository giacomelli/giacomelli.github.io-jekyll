---
published: true
layout: post
title: Using localized exception messages with T4 Templates
categories: Tutorial
tags: dotnet csharp t4-template
hideTitle: true
---
A common scenario in many projects is to use a [Resource File (.resx)](https://learn.microsoft.com/en-us/dotnet/core/extensions/create-resource-files#resources-in-resx-files) to store exception/validation messages.

An important and useful feature of the .resx files is that you can have one file for each culture that your application supports. For example, you can have one `ErrorsMessages.resx` as the default to support `en-US` (English - United States) messages and another with the name `ErrorsMessages.pt-BR.resx` to support `pt-BR` (Portuguese - Brazil) messages.

In this tutorial I will show you how to use a T4 Template to read the .resx file and generate a helper class to make very easy handle localized exception messages.

{% note It is not the aim of this tutorial to go into details on how to work with T4 Templates, to do so read the documentation [Code Generation and T4 Text Templates](https://learn.microsoft.com/en-us/visualstudio/modeling/code-generation-and-t4-text-templates) %}


## Creating the .resx files
Open your .NET project where you want to have your localized exception messages (probably a class library).


#### Creating the English (fallback) messages resource file
Add a `Resources file` called `ErrorMessages.resx` to the project:
{% screenshot add-error-messages-resx.png %}

This file will contain the English exception messages for your project. It is also a fallback, if there is no other match for the current UICulture, this one will be used.

Add these lines to the file:
* ProductHasMinWeight: The product '{0}' must weigh at least {1}.
* PropertyIsRequired: The property '{0}' is required.

{% screenshot error-messages-content.png %}

#### Creating the Brazilian Portuguese messages resource file
Repeat the same process, but name the file as `ErrorMessages-pt-BR.resx`.
This file will contain your projects Brazilian Portuguese exception messages.

Add these lines to the file:
* ProductHasMinWeight: O produto '{0}' deve pesar pelo menos {1}.
* PropertyIsRequired | A propriedade '{0}' é obrigatória.


## Creating the T4 Template
Create a T4 template file in the same folder where you placed the .resx files, named `Errors.tt`.
{% screenshot add-errors-tt.png %}

Now, copy the content below to your `Errors.tt`:
{% gist 6297f4ca7b0be353d92203e5b6364e40 Errors.tt %}


## Generating the code
If everything looks good, you should see the following code in the `Errors.generated.cs` file (expand `Errors.tt` in Solution Explorer to see it):{% gist 6297f4ca7b0be353d92203e5b6364e40 Errors.generated.cs %}

As you can see, two methods were generated within the `Errors` class: `PropertyIsRequired` and `ProductHasMinWeight`.

{% note Every time you add, update or remove lines to .resx files and want your `Errors` class to be updated, just go to the menu "Build / Transform All T4 Templates". %}

### Validating the generated code
If you want to validate that you have followed the tutorial correctly so far, you can create the NUnit project and add this test fixture:
{% gist 6297f4ca7b0be353d92203e5b6364e40 ErrorsTest.cs %}

### Customizing the T4 Template​
You've probably noticed that inside the .tt file there is a line: `CHANGE THE VALUES BELOW TO THE VALUES CORRESPONDING TO YOUR PROJECT`.
In the 3 variables below this line you can customize the name of the resource file, the exception class that will be used (maybe you want to use a different exception or your project has a custom one) and the namespace that the `Error` class will be in.
{% gist 6297f4ca7b0be353d92203e5b6364e40 custom.tt %}

## Using the generated code
Finally it's time to use the generated code.

### PropertyIsRequired
{% gist 6297f4ca7b0be353d92203e5b6364e40 PropertyIsRequired.sample.cs %}

In this case, it will be generate a `InvalidOperationException` with the message:
* If UICulture is pt-BR: `A propriedade 'First Name' é obrigatória.`
* Otherwise: `The property 'First Name' is required.`

### ProductHasMinWeight
{% gist 6297f4ca7b0be353d92203e5b6364e40 ProductHasMinWeight.sample.cs %}

In this case, it will be generate a `InvalidOperationException` with the message:
* If UICulture is pt-BR: `O produto 'Amazing Product' deve pesar pelo menos 1KG.`
* Otherwise: `The product 'Amazing Product' must weigh at least 1KG.`

{% note `Error.tt` checks for any `{number}` within the message and generates the appropriate method arguments. %}

## ASP.NET tip
If you want to use this technique in an ASP.NET project remember to enable localization in the `Startup.cs` or `Program.cs` file:
{% gist 6297f4ca7b0be353d92203e5b6364e40 Startup.cs %}

## Conclusion
T4 is a powerful tool to help create an efficient development flow in the .NET stack. In cases like this tutorial, it drastically reduces the amount of code and improves the overall availability of the codebase.

{% iconscopyright %}