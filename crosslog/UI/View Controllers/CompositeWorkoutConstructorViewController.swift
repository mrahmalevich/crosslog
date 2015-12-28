//
//  CompositeWorkoutConstructorViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 28.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class CompositeWorkoutConstructorViewController: UITableViewController {
    
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

}