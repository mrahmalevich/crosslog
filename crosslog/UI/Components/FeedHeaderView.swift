//
//  FeedHeaderView.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import SDWebImage

class FeedHeaderView: HeaderView {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var addressLabelHeightConstraint: NSLayoutConstraint!
    
    var gym: Gym! = nil {
        didSet {
            nameLabel.text = gym.name
            phoneLabel.text = gym.phone
            photoImageView.sd_setImageWithURL(NSURL(string: gym.photoUrl!))
            
            if let address = gym.address {
                addressLabel.text = address
                let addressAttributes = [NSFontAttributeName: Stylesheet.commonFontOfSize(13.0)]
                addressLabelHeightConstraint.constant = ceil(address.boundingRectWithSize(CGSize(width: addressLabel.frame.size.width, height: 1000.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: addressAttributes, context: nil).height) + 1.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = floor(photoImageView.frame.size.width/2)
        photoImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        photoImageView.layer.borderWidth = 1.0
    }
}
