//
//  TransitionsMediator.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 18.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import UIKit

class TransitionsMediator {
    
    // MARK - Initialization
    static let sharedInstance: TransitionsMediator = {
        let instance = TransitionsMediator()
        return instance
    }()
    
    init() {
        // TODO: initialization
    }
    
    // MARK - Transitions
    func showAuthorization(animated animated: Bool) {
        let authorizationStoryboard: UIStoryboard = UIStoryboard(name: "Authorization", bundle: nil)
        let initialViewController = authorizationStoryboard.instantiateInitialViewController()!
        let keyWindow: UIWindow = (UIApplication.sharedApplication().delegate as! AppDelegate).window!
        
        if (animated) {
            initialViewController.view.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(initialViewController.view.frame))
            keyWindow.addSubview(initialViewController.view)
            UIView.animateWithDuration(0.3, animations: {
                initialViewController.view.transform = CGAffineTransformIdentity
            }, completion: { (finished: Bool) in
                keyWindow.rootViewController = initialViewController
            })
        } else {
            keyWindow.rootViewController = initialViewController
        }
    }
    
    func processAuthorization(animated animated: Bool) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController: UIViewController = mainStoryboard.instantiateInitialViewController()!
        let keyWindow: UIWindow = (UIApplication.sharedApplication().delegate as! AppDelegate).window!

        if (animated) {
            let topView: UIView = keyWindow.subviews.last!
            keyWindow.insertSubview(initialViewController.view, belowSubview: topView)
            UIView.animateWithDuration(0.3, animations: {
                topView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(topView.frame))
            }, completion: { (finished: Bool) in
                keyWindow.rootViewController = initialViewController
            })
        } else {
            keyWindow.rootViewController = initialViewController
        }
    }
}