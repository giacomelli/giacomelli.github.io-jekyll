---
published: true
layout: post
title: Unity Game Growth Program&colon; Tips & Tricks
categories: Tutorial
tags: puzzimals unity3d gamedev android self-publishing unity-game-growth-program
---
In this post, I will list some tips and tricks that I learned while applying my game [Puzzimals](https://play.google.com/store/apps/details?id=br.com.diegogiacomelli.puzzimals) to the [Unity Game Growth Program](https://unity.com/solutions/mobile/game-growth-program).

{% logo Unity3d.png default %}

## Introduction
Unity has recently [launch the Unity Game Growth Program](https://blogs.unity3d.com/2020/10/13/introducing-the-game-growth-program/) an accelerator program for free-to-play indie iOS/Android games made with Unity.

> Game Growth is a new game accelerator for mobile indie developers. We partner with indie game devs so they can quickly and effectively scale their games while remaining 100% independent. Becoming a partner gives you access to user acquisition funding alongside industry-leading tools and experts in game operations. The best part? You keep full ownership of your studio and intellectual property.

> If you meet the criteria and we accept you into the program, Unity will fund user acquisition for your game and provide the technology and Unity experts to help manage player engagement and monetization. We take care of the process that helps grow your game while you concentrate on development. 

> Game Growth is a revenue-sharing program – Unity and the developer team split the revenue from advertising and in-app purchases 50/50 after the user acquisition spend has been recouped. Put simply, Unity covers the cost of bringing in new players while we both share in the reward. 

You can read more about the program here:
* [Introducing the Game Growth program](https://blogs.unity3d.com/2020/10/13/introducing-the-game-growth-program/)
* [Game Growth Program](https://unity.com/solutions/mobile/game-growth-program)

## Steps
{% icon route.png %}
According to documentation, the Unity Game Growth Program works through 4 steps:

### Submit Game & Integrate Package
> Getting started is easy. All you need is a published free-to-play mobile game made with Unity. Begin your application by submitting your project, advertising assets, and installing the Game Growth package.

### Evaluation
> This stage determines if your game is a good candidate for the program. We take a look at your core game performance, project details and overall program fit. If everything looks good, Unity covers the cost of a full user acquisition test.

### Optimize Game Operations
> If you become a partner, we work with you to design features, integrate business services, and optimize player engagement and monetization. You will also have access to a dedicated game ops team that works with you every step of the way.

### Accelerate your Game
> Game Growth gives you access to the user acquisition funding and resources to take your game to the next level - with a 50/50 revenue sharing model. We acquire the right players then effectively manage those lifecycles and provide guidance for monetization.

## Requirements
{% icon requirements.png %}
There are 7 requirements that your game must meet to apply to the program:

* `Made with Unity`: game must be made with Unity 2018.4 or later.
* `Mobile Free-to Play`: game must be free-to-play on iOS or Android.
* `Published Games`: game must be currently live and published on the Google Play or Apple App Store.
* `Connected to Unity Dashboard`: game must be connected to the Unity Dashboard and have a valid project ID.
* `Age Restrictions`: not accepting games aimed at audiences under 13 years of age.
* `Advertising Assets`: submit images and videos for use in Unity ads. 
* `Language`: game must support English.

{% note More details at: [Unity Dashboard / Game Growth](https://dashboard.unity3d.com/). %}

## Getting started
{% icon start.png %}
Is not the intent of this post cover everything about how to get through the Unity Game Growth Program, I guess this quite well documented on [Unity Game Growth Program page](https://unity.com/solutions/mobile/game-growth-program).

The idea of this post is focused on the first of the four-step: `Submit Game & Integrate Package`. 

### Read the docs
Please, if you did not read the official documentation yet, go to [Game Growth Program page](https://unity.com/solutions/mobile/game-growth-program), click in the `Apply` button and follow the instructions

{% screenshot unity-game-growth-apply.png %}

After you finish the `6 - Confirm` come back here. You'll better understand this post and tips & tricks after that.

## Submit Game & Integrate Package
{% icon package.png %}

The `Submit Game & Integrate Package` step is divided into 3 sub-steps:
* Download and Install Package
* Run & Validate Integration
* Publish & Validate Integration

## Download and Install Package
> Download the Game Growth package and integrate it into your project. Once installed, refer to the package documentation for next steps.

You need to download the package through the `Download Package`, then in Unity, open the `Package Manager` window install it from the `tarball` option.
{% screenshot unity-package-manager-tarball.png %}

{% note if you are using Unity version previous 2019.4, you need to use the option `Add package from disk` %}

### Tip & Trick
{% icon tip.png %}
After installing the package, if your using `UnityEngine.Purchasing` in your project and you use [Assembly Definitions](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) too you can see a lot of errors in the console about it, like `error CS0246: The type or namespace name 'IStoreController' could not be found (are you missing a using directive or an assembly reference?)`

To fix it, just reference again the `UnityEngine.Purchasing` on the `Assembly Definition references`:
{% screenshot unity-assembly-definition-references.png %}

### Easy On-Boarding
Now, open the menu `Game Growth / Easy onboarding` and follow the steps.
{% screenshot unity-game-growth-eash-on-boarding.png %}

## Run & Validate Integration
> After the package has been installed and configured for sandbox, run your game on the devices . To confirm integration, make sure you remove the game from your device, reinstall, and then launch the game.

Build, install, and run the game on your target device (iOS / Android).
Then go to Unity Dashboard and try to confirm the `Run & Validate integration`, this can take minutes or even hours to allow you to confirm successfully.

### Tip & Trick
{% icon tip.png %}
Running the shell `./adb logcat -s Unity PackageManager dalvikvm DEBUG` while running the game on an Android device I saw errors like this on the game log:

`UriFormatException: Invalid URI: The hostname could not be parsed
at DeltaDNA.Network+<SendRequest>
[DDSDK] [WARNING] Event upload failed - try again later`

I found out that the `collect_url` and `engagement_url` in the `/Assets/DeltaDNA/Resources/ddna_configuration.xml` file were empty and this was an error cause.

To fix it, I had to go to the `Game Growth / Configuration` menu, then click on the `Configure SDKs` button, so `collect_url` and `engagement_url` were correctly configured in the file.

## Publish & Validate Integration
> The final step is to publish your project on the Apple App Store and Google Play Store. Don’t forget to switch the package environment dropdown from Sandbox to Store in GGLauncher prefab. Run your game on the devices.

Build and publish the game to the store (App Store or Google Play), download/update the game and run it on your device.
Then go to Unity Dashboard again and try to confirm the `Publish & Validate integration`, this can take minutes or even hours to allow you to confirm successfully.

## Conclusion
{% icon conclusion.png %}
I hope that these tips and tricks that I learned while applying my game [Puzzimals](https://play.google.com/store/apps/details?id=br.com.diegogiacomelli.puzzimals) to the [Unity Game Growth Program](https://unity.com/solutions/mobile/game-growth-program) can be useful to you too.

If you have any other tips & tricks you use on the Unity Game Growth Program process and you like to share it, please let me know in the comments section below.