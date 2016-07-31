# SwiftDropdownToaster

## Introduction

SwiftDropdownToaster is a simple, Swift-based solution for implementing dropdown toast notifications in your iOS App.


Adding a toast notification is extremely easy. The following code produces a dropdown notification:

    let toaster = SwiftDropdownToaster()
    toaster.addToView(self.view, style: .Success, message: "Saved successfully.")


SwiftDropdownToaster is meant to be simple but customizable. It comes prepackaged with 4 styles:


This can easily be extended by adding to the enum:

