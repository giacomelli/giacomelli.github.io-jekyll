---
published: true
layout: post
title: Using Gulp for Chrome Extesion Dev Workflow
categories: Tutorial
tags: unity3d gamedev math curves
---
In this tutorial we will learn how to draw a [Maurer Rose](https://en.wikipedia.org/wiki/Maurer_rose) with a [LineRenderer](https://docs.unity3d.com/ScriptReference/LineRenderer.html) in Unity.

## Introduction
A few months ago we built a Chrome Extension to a customer to allow users capture Netflix captions and sent them to custmoer web site to study them later.

While we are developing it we need to change some configurations on the extension to change what URL of our API it will use depending of what environment the Chrome Extension is using, like DEV (local), UAT (User Acceptance Testing) and Production.

## Setup
For this tutorial I use a Chrome Extension basic sample for boostrap called `Context Menus Sample`. 
You can download it from this page [https://developer.chrome.com/extensions/samples](https://developer.chrome.com/extensions/samples) or directly from [https://developer.chrome.com/extensions/examples/api/contextMenus/basic.zip/

At the time we dit not find any builtin or other solution to make this workflow easier and streamlined, so we decided to create our own solution using Gulp. This whoe solution will be explaining below.

{% note Is not the intent of this tutorial explaing how to create a Chrome Extension from scratch, for this you can use the official documentatino: [Getting Started Tutorial](https://developer.chrome.com/extensions/getstarted) %}

## Gulp
> gulp is an open-source JavaScript toolkit created by Eric Schoffstall used as a streaming build system in front-end web development.

We decided to use gulp, becaused a Chrome Extensions is a bunch of .js, .html and .json files. Perfect to use gulp.


## The problem
If we just try to open our download `Context Menus Sample` .zip file or the opened folder directly on Chrome extesions page, it will work and you see the extension's icon in the toolbar.
{% screenshot basic-sample-chrome-extension.png %}

This is not a problem if you have only one environment or now need to differnt configuration for diferent environments, but as I've already explained, we needed different configs for different environmnts.

To purpose of this tutorial we will work with two environments: DEV and PROD and will use our configuration file just to add a suffix to our menu item "Context Menu Sample":

* DEV: Context Menu Sample (DEV)
* PROD: Context Menu Sample (PROD)

## Files structure
Move the `basic samples` files to a subfolder called `src`.
In the end of this tutorial, our files structure will look like this:
{% screenshot files-structure.png %}

## Installing gulp
To allow us to build our workflow, first we need to install gulp.

Follow the instructions described on [Quick Start](https://gulpjs.com/docs/en/getting-started/quick-start/).

{% note In the section `Create a project directory and navigate into it` you just need to open the root folder of our file structure described in the previous section %}
{% note In the sectopm `Create a package.json file in your project directory` you can use the default values for all the questions of the `npm init` %}

## The gulpfile.js file
Create a file called `gulpfile.js` in the root folder.

{% gist 4f9d7289273222713933d8a95a077311 gulpfile.js %}

This is the full `gulpfile.js` file that will allow ower development workflow for different environments.
Now will explain each section of it.

### Requires section
This section define the NPM packages need for our `gulpfile.js'.
{% gist 4f9d7289273222713933d8a95a077311 requires.section.js %}

The first one is [gulp](https://www.npmjs.com/package/gulp), then we need the package [del]() that will allow us to clean our `dist` folder, 
after [gulp-merge-json](https://www.npmjs.com/package/gulp-merge-json) to allow us to merge our environment config files. The last one is [fs](https://www.npmjs.com/package/fs) to allow read and write files.

### Consts section
This is quite simple, we are just reading command-line argument called `config`. If it is not present, the defult value is `DEV`. 
{% gist 4f9d7289273222713933d8a95a077311 consts.section.js %}

### Exports section
Now we jump to last line of the file to explain the `exports.default`. 
Here we are basically defining the order of each function that will be called when we run our `gulpfile.js` file:
{% gist 4f9d7289273222713933d8a95a077311 exports.section.js %}

First we clean our `dist` folder, than we copy all files from `src` folder to the `dist` folder, after that we will transform our .config.json files, merging the source one with the `environment` one, then will write our transformed `config.json` file to the `scripts` to allow our extension .js file access its values, now we transform our `manifest.json` file too, and the last one we could `watch` for any change on the `src` folder and automatically repeat the previous steps (to enable this one wee need to pass the argument `--watch`).

### Clean section
Clean our `dist` folder.
{% gist 4f9d7289273222713933d8a95a077311 clean.section.js %}

### CopyAllFiles section
copy all files from `src` folder to the `dist` folder
{% gist 4f9d7289273222713933d8a95a077311 copyAllFiles.section.js %}

### TransformConfig section
Transform our .config.json files, merging the source one with the `environment` one.
{% gist 4f9d7289273222713933d8a95a077311 transformConfig.section.js %}

### WriteConfigJsFile section
Write our transformed `config.json` file to the `scripts` to allow our Chrome Extension's .js files access the config values.
{% gist 4f9d7289273222713933d8a95a077311 writeConfigJsFile.section.js %}

### TransformManifest section
Transform our `manifest.json` file too.
{% gist 4f9d7289273222713933d8a95a077311 transformManifest.section.js %}

### Watch section
Watch for any change on the `src` folder and automatically repeat the previous steps.
To enable this one wee need to pass the argument `--watch`.
{% gist 4f9d7289273222713933d8a95a077311 watch.section.js %}


## Packages.json file
Change the content of `packages.json` file to the content below to update the dependencies.
{% gist 4f9d7289273222713933d8a95a077311 packages.json %}

Then run the command `npm install` in the root folder, after that run the command `npm install gulp`.

## Running the gulp for the first time
Now, if you just run the command `gulp` in the root folder, you should see a output like this:
{% screenshot gulp-failed-config.png %}

## Creating the `.config.json` files
We need to create our `.config.json files.
They are 3 files:
* `config.json`: the baseline file, our common configuration should be define here.
* `config.DEV.json`: the file that the define specific configuation values for DEV environment
* `config.PROD.json`: ZAP is now listening

Create the 3 files inside the subfolder `src`.
Here is the content of each one:

{% gist 4f9d7289273222713933d8a95a077311 config.json %}
{% gist 4f9d7289273222713933d8a95a077311 config.DEV.json %}
{% gist 4f9d7289273222713933d8a95a077311 config.PROD.json %}

## Running the gulp for the second time
Run the command `gulp` in the root folder, you should see a output like this:
{% screenshot gulp-ok-no-manifest.png %}

You should see a sub folder `dist` created. Load it on Chrome Extensions page:
{% screenshot chrome-extension-page.png %}

The plugin should work ok.

## Reading the configuration inside the scripts
First thing we need to change our `manifest.json` file to allow the content of `scripts/config.js` been read by the extension .js.
Open the `manifest.json` and change it to the content below:
{% gist 4f9d7289273222713933d8a95a077311 manifest.json %}

The line `"/scripts/config.js"` is what we need to access the configuration values.


Now, open the file `sample.js` ifle

{% icon project.png %}

A Maurer Rose is always defined by two input parameters: `n` and `d`.

* The `n` represents the number of petals. The rose has n petals if n is odd, and 2n petals if n is even (look to the gif above, n = 2, then 4 petals).
* The `d` represents the angle in degrees for each line.

> Let r = sin(nθ) be a rose in the polar coordinate system, where n is a positive integer. 
> 
> We then take 361 points on the rose:
> (sin(nk), k) (k = 0, d, 2d, 3d, ..., 360d),
> where d is a positive integer and the angles are in degrees, not radians.

This definition talks about [polar coordinate system](https://en.wikipedia.org/wiki/Polar_coordinate_system). The more important thing to know about it is this: `each point on a plane is determined by a distance from a reference point and an angle from a reference direction`. So, if you want to draw a line from a point, we need to take that point, an angle, and distance to calculate the second point.

## The formula
{% icon math.png %}

The basic formula is: `r = sin(nθ)` and we need to apply it to 361 points, where:

`r = sin(n * (d * point))`

In C# the code is something like this:

{% gist 9dc5d4d408c00e92143827293a017936 %}

We calculate the angle for each point, then we get the `r` and find the `x` and `y` for the second point on the polar coordinate system.

{% note The `Mathf.PI / 180f` is to convert from degrees to radians to work properly with the Mathf functions. %}


## MaurerRoseLineRenderer
Now the complete code for a MonoBehaviour that takes the formula we saw in the previous section and combine it with a LineRenderer to draw the Maurer Rose.

{% gist f4aba5c5d7cbeb396ca784dff150e194 %}
{% gistimporter %}

## Using the MaurerRoseLineRenderer
To use it, just create a new GameObject and add the `MaurerRoseLineRenderer` component to it.

If you just hit play button, you will see something like this:
{% screenshot maurer-rose-first-try.png %}

<br>
Go to the LineRenderer component and change the line width to `0.03`, then hit play button again.
{% screenshot maurer-rose-second-try.png %}

## Testing new inputs
{% icon programmer.png %}

If you change the values of `N` and `D` of the component in the inspector, you will see a new Maurer Rose been drawing.

The image below shows the result of 6 different inputs (the same inputs used on [Wikipedia](https://en.wikipedia.org/wiki/Maurer_rose)):
{% screenshot maurer-roses.png %}

## Going beyond
{% icon beyond.png %}

Now that you understand what is a Maurer Rose and how to code it inside Unity you can try to do some crazy things with it, like animate the input values or the number of points, or still using it to build a particle system.

Below I show my realtime try on this matter:

<a href="/apps/maurer-rose/index.html" target="_blank">Open in a new window</a>
<iframe src="/apps/maurer-rose/index.html" style="width: 960px;height: 700px;"></iframe>

## Conclusion
In this tutorial, we learned how to draw a Maurer Rose with a LineRenderer.
This simple formula show how math can be used to explore creativity and beauty.

{% iconscopyright %}
The font used on the WebGL sample is from [Kenney](http://kenney.nl).