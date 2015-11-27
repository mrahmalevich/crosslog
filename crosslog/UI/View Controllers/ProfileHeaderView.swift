//
//  ProfileHeaderView.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import SDWebImage

class ProfileHeaderView: HeaderView {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    var user: User! = nil {
        didSet {
            nameLabel.text = user.fullName()
            photoImageView.sd_setImageWithURL(NSURL(string: user.photoUrl!))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = floor(photoImageView.frame.size.width/2)
        photoImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        photoImageView.layer.borderWidth = 1.0
    }
    
}