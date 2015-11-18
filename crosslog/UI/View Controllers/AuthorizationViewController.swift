//
//  AuthorizationViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 18.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController {
    
    // MARK: - Initialization
    required convenience init(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }
    
    init(_ coder: NSCoder? = nil) {
        if let coder = coder {
            super.init(coder: coder)!
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }

    // MARK: - Actions
    @IBAction func actionLogin(sender: UIButton) {
        TransitionsMediator.sharedInstance.processAuthorization(animated: true)
    }
}