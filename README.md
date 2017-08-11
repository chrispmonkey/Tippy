# Pre-work - *Tippy*

**Tippy** is a tip calculator application for iOS.

Submitted by: **Christopher L. Price**

Time spent: **11** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [ ] Using locale-specific currency and currency thousands separators.

The following **additional** features are planned to be implemented:
* [x] Added UI Constraints so the app looks the same on any device that it runs on.
* [x] Added color and more design to the original assignment.
* [x] Added a gear icon for the settings button within the "Assets" catalog.
* [x] Create and added an App Icon
* [x] Create and added an Splash Screen
* [x] Changing the keyboard background color to dark.
* [ ] Ability to request an Uber from the location

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/chrispmonkey/Tippy/blob/master/Tippy%20Tip%20Calculator.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
* One challenge that I ran into was setting the UserDefaults on the first run. I looked into this and figured it out. I had to register the default UserDefault in the AppDelegate.
* Another issue I ran into was detecting if the bill amount text field was empty or not before animating the lower view with the tip and total amount. I had an issue where the lower view would animate when the text field had one character in it and I only wanted it to animate when there was no characters in it or when the user first put a character in it. I found a way to make it work by using a boolean value to check along with the character count that allowed me to achieve the desired effect.

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer**: My current reactors to the iOS app development platform are that it's really fun and challenging. I like the ability to build the UI graphically using the Storyboard editor. It's also really neat that it allows you to grab the various objects and connect them to the code with control clicking. Overall I think Xcode is a pretty powerful and clean IDE.
The way that I would descirbe Outlets and Actions is that Outlets are a way for you access the properties of a specific object; You can get the properties and set properties by using the Outlet reference. One example of this is when you want to change the text of a label. Actions are ways for you to detect various triggers within the view to call specific lines of code as a result. An example of this would be when a button is clicked and you want it to do something like play a sound.
Bonus: The way that I think that this is occuring under the hood, is that within the Storyboard file as you drag and drop objects and make connections, xcode is generating an XML file that layouts how the different views will display, including various ways that the views connect to the corresponding files. If you look at the source you can see a couple interesting properties like "outletConnection" with a property that says what kind of connection it is as well as it's destination and id. All of this information together helps connect it to the correct link within the swift file to allow manipulation and detecting the trigger.


**Question 2**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer**: Since Swift uses Automatic Reference Counting (ARC) to manage memory, the way that you get a strong reference cycle for closures are to make instances related to eachother. When Swift sees at least one strong reference, ARC knows that it is still needed and doesn't destroy it for memory management. ARC will however detroy the instance if it sees that the relationship is broken, signaling that the instance is no longer needed later on. I guess a simple way to explain this would be to compare it to 

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
