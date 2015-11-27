//
//  TrainingViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class TrainingViewController: UIViewController {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var contentLabelHeightConstraint: NSLayoutConstraint!
    
    var training: Training! = nil
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentLabel.text = training.trainingBody()
        dateLabel.text = training.date != nil ? FormattingService.dateFormatterWithFormat("yyyy-MM-dd").stringFromDate(training.date!) : ""
        
        let bodyAttributes = [NSFontAttributeName: Stylesheet.commonFontOfSize(13.0)]
        let bodyHeight = ceil(contentLabel.text!.boundingRectWithSize(CGSize(width: contentLabel.frame.size.width, height: 1000.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: bodyAttributes, context: nil).height) + 1.0
        contentLabelHeightConstraint.constant = bodyHeight
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}