//
//  ViewController.swift
//  SwiftDropdownToasterDemo
//
//  Created by Charles Wong on 7/24/16.
//  Copyright © 2016 Charles Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func defaultTapped(sender: AnyObject) {
        toaster.addToView(self.view, style: .Default, message: "This is the default")
    }
    
    @IBAction func successTapped(sender: AnyObject) {
        toaster.addToView(self.view, style: .Success, message: "Show a success message")
    }
    
    @IBAction func warningTapped(sender: AnyObject) {
        toaster.addToView(self.view, style: .Warning, message: "This is a warning")
    }
    
    @IBAction func errorTapped(sender: AnyObject) {
        toaster.addToView(self.view, style: .Error, message: "An error occurred")
        
    }
    
    var toaster: SwiftDropdownToaster!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        toaster = SwiftDropdownToaster()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

