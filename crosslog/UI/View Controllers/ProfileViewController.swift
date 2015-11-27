//
//  ProfileViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

class ProfileViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

//    var user: User?
    
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
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    convenience init(user: User?) {
//        self.init(nibName: nil, bundle: nil)
//        self.user = user
//    }
    
    // MARK: - View lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    
}
