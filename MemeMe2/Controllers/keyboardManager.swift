//
//  keyboardManager.swift
//  MemeMe2
//
//  Created by Ashley Arthur on 27/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardManager : NSObject{
    // A class to adjust offset a view origin when keyboard appears
    
    // MARK: PROPERTIES
    weak var controller: UIViewController? // Delegating ViewController
    weak var activeInputView: UIView? = nil {
        didSet {
            adjustRootViewHeight()
        }
    }
    
    //State
    var currentKeyboardRect: CGRect = CGRect.zero {
        didSet {
            adjustRootViewHeight()
        }
    }
    static let keyboardEvents = [
        NSNotification.Name.UIKeyboardWillShow,
        NSNotification.Name.UIKeyboardDidChangeFrame,
        NSNotification.Name.UIKeyboardWillHide
    ]
    
    // MARK: METHODS
    
    func subscribeToKeyboardNotifications() {
        
        let notificationBindings = zip(
            KeyboardManager.keyboardEvents,
            [ #selector(updateCurrentKeyboardRect),
              #selector(updateCurrentKeyboardRect),
              #selector(resetCurrentKeyboardRect) ]
        )
        
        for (notif,selector) in notificationBindings {
            NotificationCenter.default.addObserver(self,selector:selector,name:notif,object:nil)
        }
    }
    
    func updateCurrentKeyboardRect(notification: NSNotification){
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        currentKeyboardRect = keyboardSize.cgRectValue
    }
    
    func resetCurrentKeyboardRect() {
        currentKeyboardRect = CGRect.zero
    }
    
    func adjustRootViewHeight(){
        guard
            let inputView = activeInputView,
            let rootView = controller?.view
            else {
                return // no view to move or no active text field
        }
        let originalInputViewRectWorldSpace = inputView.convert(inputView.bounds, to: nil).offsetBy(dx:0.0, dy:rootView.frame.origin.y * -1.0)
        let overlap = currentKeyboardRect.intersection(originalInputViewRectWorldSpace)
        
        UIView.animate(withDuration: 0.3) { 
            if (!overlap.isNull) {
                rootView.frame.origin.y = -overlap.height
            }
            else {
                rootView.frame.origin.y = 0.0
            }
        }
        

    }
    
}
