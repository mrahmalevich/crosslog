//
//  HeaderView.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 15.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    static func headerView() -> HeaderView {
        return NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil).first as! HeaderView
    }
    
}