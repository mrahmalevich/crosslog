//
//  TrainingResultsViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class TrainingResultsViewController: UIViewController {
    
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
    
    // MARK: - Lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}