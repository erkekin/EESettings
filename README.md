# EESettings
Change the server your app connects, without any further build or export. Directly from Apple's Settings App. 

Most of us, developers struggles while hearing the cursed words "Can you send me an IPA which is looking at my laptop's host? Fast.".
That is the time you say unconsciously, "not neat". Wouldn't that be better if you could change the host the app is connecting, by just going to the app settings and select? or type manually?. W'd be great.

The life saver.
The force awakener.

### Usage 

You'd better use this only in "Debug" mode. Don't ship your app with this.

In any view controllers or AppDelegate's didFinishLaunchingWithOptions method, just add the following.
This will create a blue view floating on your app. Like the chat heads of Facebook app.

Then set the DEBUG symbol like told here: http://stackoverflow.com/a/30013587

You are set.

```swift
 SettingHost.hostView()
```
