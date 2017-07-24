# Pre-work - *Tippy*

**Tippy** is a tip calculator application for iOS.

Submitted by: **Christopher L. Price**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are planned to be implemented:
* [x] Added UI Constraints so the app looks the same on any device that it runs on.
* [x] Added color and more design to the original assignment.
* [x] Added a gear icon for the settings button within the "Assets" catalog.
* [ ] Create and added an App Icon
* [ ] Create and added an Splash Screen
* [ ] Ability to request an Uber from the location

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/chrispmonkey/Tippy/blob/master/Tippy%20Tip%20Calculator.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
* One challenge that I ran into was setting the UserDefaults on the first run. I looked into this and figured it out. I had to register the default UserDefault in the AppDelegate.
* Another issue I ran into was detecting if the bill amount text field was empty or not before animating the lower view with the tip and total amount. I had an issue where the lower view would animate when the text field had one character in it and I only wanted it to animate when there was no characters in it or when the user first put a character in it. I found a way to make it work by using a boolean value to check along with the character count that allowed me to achieve the desired effect.
## License

    Copyright 2017 Christopher L. Price

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
