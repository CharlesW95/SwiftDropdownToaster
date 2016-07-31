# SwiftDropdownToaster

## Introduction

SwiftDropdownToaster is a simple, Swift-based solution for implementing dropdown toast notifications in your iOS App.

![Alt Sample Toast] (./Images/sample1.png)

Adding a toast notification is extremely easy. The following code produces a dropdown notification:

    let toaster = SwiftDropdownToaster()
    toaster.addToView(self.view, style: .Success, message: "Saved successfully.")
    
## Installation

To begin using SwiftDropdownToaster, simply drag and drop SwiftDropdownToaster.swift into your Xcode Project. Remember to check "Copy items if needed" so that you get a local copy of the file.

## Appearance

SwiftDropdownToaster is meant to be simple but customizable. It comes prepackaged with 4 styles:
    
    .Default
    .Success
    .Warning
    .Error

This can easily be extended by adding to the enum.


## Configuration

Each instance of SwiftDropdownToaster can be configured by setting various instance variables after initialization.

    let toaster = SwiftDropdownToaster()
    toaster.toastHeight = 65.0 // Height of the toaster (CGFloat)
    toaster.duration = 3.0 // Duration (in seconds) of the toaster
    
This allows one toaster to manage multiple toasts with a single configuration.

## Tap Handlers

SwiftDropdownToaster comes with built in support for tap handlers. To add a tap handler, simple pass it in as an argument while adding a toast:

    toaster.addToView(self.view, style: .Default, message: "Done", tapHandler:
    {
    	print("This gets called")
    })

## Extras

To remove all toast views initialized by an instance of SwiftDropdownToaster, simply call the following:

    toaster.removeAllToasts(self.view)


SwiftDropdownToaster is designed to be a lightweight and easily extendable solution. 

Feel free to download the sample project, open issues or send pull requests. Happy coding!
   