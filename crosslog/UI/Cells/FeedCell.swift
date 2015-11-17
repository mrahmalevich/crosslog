//
//  FeedCell.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 18.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var editButton: UIButton!

    // MARK - Static
    static func cellHeight() -> CGFloat {
        return 310.0;
    }
    
    // MARK - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // setup
    }
}
