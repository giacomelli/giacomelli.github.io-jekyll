---
published: true
layout: post
title: Google Play Games Plugin for Unity&colon; Tips & Tricks
categories: Tutorial
tags: unity3d gamedev android
---
In this post I will list some tips and tricks that I learned while using the [Google Play Games Plugin for Unity](https://github.com/playgameservices/play-games-plugin-for-unity).

{% logo google-play.png default %}

## Introduction
The Unity3D has a code interface for questions regarding social features in games, these interfaces are called [Social API](https://docs.unity3d.com/Manual/net-SocialAPI.html).

> It provides a unified interface to different social back-ends, such as GameCenter, and is meant to be used primarily by programmers on the game project.

When you use it on a real platform, you will need to use some plugin that implement those interfaces, in the case of Android this job is done by the [Google Play Games Plugin for Unity](https://github.com/playgameservices/play-games-plugin-for-unity).

## Configuring the game on Google Play Console
First of all you need to create the game on [Google Play Console](https://play.google.com/publish) as any other game and make an app release (an `Internal test track` already works).
{% screenshot app-release.png %}
<br>

Then go to the `Services & APIS` menu, after enter on the `Google Play game services`.
{% screenshot services-and-apis.png %}
<br>

Fill only the required information for test, then go to menu `Linked apps` and link it to your game on with the app on Google Play Console.
{% screenshot linked-apps.png %}
<br>

## Creating some achievements for test
In the `Game services section` open the `Achievements` menu and add some achievements.
{% screenshot achievements.png %}
<br>

> I found empirically that test achievements that did not have an icon set on the Google Play Console did not show the standard Google Play Games UI when unlocked and were automatically locked again about 1 hour after they were unlocked.

## Installing the plugin
To install the `Google Play Games Plugin for Unity`, you should follow the steps in [Plugin Installation](https://github.com/playgameservices/play-games-plugin-for-unity#plugin-installation) and [Android Setup](https://github.com/playgameservices/play-games-plugin-for-unity#android-setup) sections.
{% screenshot android-setup.png %}
<br>

## OAuth and Upload Certificate
One thing can be a little confusing is about the certificate fingerprints.

Go to [Google Play Console](https://play.google.com/publish) on `App Signing`section and use the option `App Signing by Google Play`
{% screenshot app-signing.png %}
<br>

Now you need to copy your `SHA-1` fingerprint of your `Upload certificate` from `App signing` section.
{% screenshot upload-certificate.png %}
<br>

Then go to your OAuth credentials on [Google API console](https://console.developers.google.com/apis).
{% screenshot google-api-console-credentials.png %}
<br>

In `the Google API console`, select your game on the top dropdown, then go to `Credentials` menu and edit the `OAuth 2.0 Client IDs`. Paste the fingertip on the field `SHA-1 certificate fingertip` and save it.
{% screenshot google-api-console-fingertip.png %}
<br>

> remember to remove the `SHA-1` prefix, if you copied it together.

## Testing on Android
Now we have the basic setup done, we need to write some code to test it on an Android device:

{% gist c8bff996de4473c201f010b17d42fd2b AchievementsController.cs %}

Add the script above to a game object in the scene, build and run the game on a Android device.

If everything was done correctly, you should see a screen like this:
{% screenshot achievements-ui.png %}

## Conclusion
{% screenshot conclusion.png %}

With this basic setup you can start to use the other features from Google Play Games Plugin for Unity plugin, as:
* unlock/reveal/increment achievement
* post score to leaderboard
* cloud save read/write
* show built-in achievement/leaderboards UI
* events
* video recording of gameplay
* nearby connections
* turn-based multiplayer
* real-time multiplayer

Learn more about then on [plugin GitHub page](https://github.com/playgameservices/play-games-plugin-for-unity).

## Extra tips and tricks
{% screenshot extra-tips-tricks.png %}
Below a list of tips and tricks for non-common scenarios.

### Log on device
If anything goes wrong on Android device you will need to see it logs, to do so, you can use adb logcat:

On MacOS, this shell do the job:
```shell
cd /usr/local/Caskroom/android-platform-tools/29.0.5/platform-tools/

./adb logcat -s Unity PackageManager dalvikvm DEBUG
````
> If you are using a different version of Android Platform Tools you will need to change the `29.0.5` version.

### Assembly definition
If your game is using [Assembly Definition](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) you will need this step.

The plugin code come without any assembly definition, so to use in our code you will need to create two assembly definitions to the plugin:

Go to the `Assets/GooglePlayGames` folder and create a new `Assembly Definition` called `GooglePlayGames`.
{% screenshot assembly-definition-runtime.png %}
<br>

Go to the `Assets/GooglePlayGames/Editor` folder and create a new `Assembly Definition` called `GooglePlayGames.Editor`.
{% screenshot assembly-definition-editor.png %}
<br>

Now, go to your game assembly definition and add a reference to the `GooglePlayGames`.

> After this, if you receive some compilation error about `BasicApi.Nearby` namespace, just close and open Unity again.

### Exception class not found com.google.android.gms.games.Games
If you see the the log message above on the adb logcat, you need to check on Unity `Player Settings / Publishing Settings` if the minify settings are set up correctly as describe here: [Play Games Services Proguard configuration](https://github.com/playgameservices/play-games-plugin-for-unity/blob/master/README.md#play-games-services-proguard-configuration)

{% iconscopyright %}