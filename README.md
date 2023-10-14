# KeyboardBarTest

This is a sample project for the issue, where a keyboard toolbar doesn't get shown, when added with SwiftUI on iOS 17.

The issue is reported to Apple as: FB13209435

## Feedback content

**Please provide a descriptive title for your feedback:**

The ToolbarItemGroup(placement: .keyboard) doesn't work on iOS 17

**Which platform is most relevant for your report?**

iOS

**Which technology does your report involve?**

SwiftUI

**What type of feedback are you reporting?**

Incorrect/Unexpected Behavior

**What build does the issue occur on?**

iOS 17 RC Seed (21A329)

**Where does the issue occur?**

On device

**Please describe the issue and what steps we can take to reproduce it:**

When I run my app on iOS 17 and, with SwiftUI, attach a button to ToolbarItemPlacement.keyboard, it newer shows up on iOS 17. It works fine on iOS 16.4. This also happens for an app in the App Store built with the iOS 16 SDK running on iOS 17.

Open the attached Xcode project and run the app on an iOS 16.4 simulator and an iOS 17 simulator:
- On the iOS 16.4 simulator a toolbar appears over the keyboard, when one of the fields are in focus.
- On the iOS 17 simulator a toolbar never appears over the keyboard.
See also the attached video.

This was all done with Xcode 15.0 (15A240d) and the included SDK.

## Update October 13/14th

**From Apple:** Please verify this issue with iOS 17.1 beta 3 (21B5066a).

The issue is somewhat fixed in iOS 17.1 beta 3 (21B5066a).

When the Form IS NOT inside a TabView, it works as expected. When the Form IS inside a TabView the issue is still reproducible to some capacity. I have updated (and attached) the test project with some more test cases.

Here is also an interesting case:
1. Open the test project (where the EntryFormView IS inside a TabView).
2. Tap inside the “Name” TextField to give it focus.
2-1. The Xcode log shows the following message: `<0x104707bc0> Gesture: System gesture gate timed out.`
3. Tap “Enter” on the keyboard, and the keyboard will disappear.
3-1. The Xcode log shows the following message: `CAReportingClient.mm:532 Attempted to remove a reporter not created by this client { careporter_id=5.153.960.755.201 }`
4. Tap inside the “Name” TextField again to give it focus.
4-1. The Xcode log shows the following message: `-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID`
5. Tap “Enter” on the keyboard, and the keyboard will disappear.
5-1. The Xcode log shows the following message: `CAReportingClient.mm:532 Attempted to remove a reporter not created by this client { careporter_id=5.153.960.755.201 }`
6. Tap the “Start” tab on the TabView.
7. Tap the “Form” tab on the TabView.
8. Tap inside the “Name” TextField again to give it focus.
8-1. The keyboard toolbar is now visible.
8-2. The Xcode log shows A LOT of messages about unsatisfiable contraints (see attached KeyboardTabBar-log.txt file).

In my app, Score Wonders ([available on the App Store](https://apps.apple.com/us/app/score-wonders/id1671023841)) I also see an interesting case (video attached).
1. Open the app (in the video it is a TestFlight build, but the same happens with the current App Store version on iOS 17.1 beta 3).
2. Go to the “Calculator” (third) tab.
3. Tap inside the first TextField to give it focus.
3-1. No toolbar is shown above the keyboard/keypad.
4. Send the app to the background.
5. Open the app again.
5-1. The toolbar is now shown above the keyboard/keypad.

https://github.com/MortenGregersen/KeyboardBarTest/assets/759680/64d9b7d7-5d11-446b-9b07-6c793b4c03be

## Example video

* Left: iOS 16.4 simulator
* Right: iOS 17.0 simulator

Both built with Xcode 15.0 (15A240d)

https://github.com/MortenGregersen/KeyboardBarTest/assets/759680/904dc5c2-f0eb-4b35-b581-3e86b7748e04
