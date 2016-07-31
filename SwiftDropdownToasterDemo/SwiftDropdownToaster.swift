//
//  SwiftDropdownToaster.swift
//  
//
//  Created by Charles Wong on 7/24/16.
//  Copyright © 2016 Charles Wong. All rights reserved.
//

import UIKit

enum ToastStyle: Int {
    case Default = 1, Success, Warning, Error
}

class SwiftDropdownToaster: NSObject {
    
    // Configurables.
    var toastHeight: CGFloat = 60.0
    var duration: NSTimeInterval = 2.5
    
    var activeToasts = [DropdownToastView]()
    
    func addToView(view: UIView, style: ToastStyle, message: String, font: UIFont? = nil, tapHandler: (() -> ())? = nil) {
        
        let toast = DropdownToastView(frame: CGRect(x: 0, y: -toastHeight, width: view.frame.width, height: toastHeight), style: style, message: message, font: font)
        
        view.addSubview(toast)
        activeToasts.append(toast)
        
        UIView.animateWithDuration(0.5, animations: {
            toast.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: self.toastHeight)
            view.layoutIfNeeded()
        }, completion: { finished in
            let seconds = self.duration
            let delay = seconds * Double(NSEC_PER_SEC)  // Convert into nanoseconds.
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.removeFromView(view, toast: toast)
            })
        })
    }
    
    func removeFromView(view: UIView, toast: DropdownToastView) {
        UIView.animateWithDuration(0.5, animations: {
            toast.frame = CGRect(x: 0, y: -self.toastHeight, width: view.frame.width, height: self.toastHeight)
            view.layoutIfNeeded()
        }, completion: { finished in
            if finished {
                if let index = self.activeToasts.indexOf(toast) {
                    self.activeToasts.removeAtIndex(index)
                    toast.removeFromSuperview()
                }
            }
        })
    }
    
    func removeAllToasts(view: UIView) {
        for toast in activeToasts {
            removeFromView(view, toast: toast)
        }
    }
}

class DropdownToastView: UIView {
    
    // Take care of optional tapHandlers.
    var tapHandler: (() -> ())?
    
    func callTapHandler() {
        if let tap = tapHandler {
            tap()
        }
    }

    init(frame: CGRect, style: ToastStyle, message: String, font: UIFont?, tapHandler: (() -> ())? = nil) {
        super.init(frame: frame)
        
        var color: UIColor!
        
        switch style {
        case .Default:
            color = UIColor(colorLiteralRed: 64/255, green: 190/255, blue: 255/255, alpha: 1.0)
        case .Success:
            color = UIColor(colorLiteralRed: 45/255, green: 236/255, blue: 105/255, alpha: 1.0)
        case .Warning:
            color = UIColor(colorLiteralRed: 255/255, green: 212/255, blue: 64/255, alpha: 1.0)
        case .Error:
            color = UIColor(colorLiteralRed: 247/255, green: 82/255, blue: 102/255, alpha: 1.0)
        }
        self.backgroundColor = color
        
        let label = UILabel(frame: CGRect(origin: CGPointZero, size: frame.size))
        
        if let _ = font {
            label.font = font
        }
        
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 1
        label.text = message
        label.textAlignment = .Center
        
        self.addSubview(label)
        
        // Integrate tap handler if provided.
        if let tap = tapHandler {
            self.tapHandler = tap
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(callTapHandler))
            self.addGestureRecognizer(tapGesture)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
