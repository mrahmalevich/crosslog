//
//  FeedCell.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 18.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit

private let kContentTopOffset: CGFloat = 40.0
private let kContentBottomOffset: CGFloat = 50.0
private let kPadding: CGFloat = 10.0
private let kFontSize: CGFloat = 13.0

protocol FeedCellDelegate: AnyObject {
    func didPressResultsButtonForFeedCell(cell: FeedCell)
    func didPressEnterResultButtonForFeedCell(cell: FeedCell)
}

class FeedCell: UITableViewCell {
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var checkInButton: UIButton!
    @IBOutlet private weak var resultsButton: UIButton!
    @IBOutlet private weak var editButton: UIButton!
    
    var training: Training! = nil {
        didSet {
            contentLabel.text = training.trainingBody()
            dateLabel.text = training.date != nil ? FormattingService.dateFormatterWithFormat("yyyy-MM-dd").stringFromDate(training.date!) : ""
        }
    }
    weak var delegate: FeedCellDelegate? = nil

    // MARK - Static
    static func cellHeightForTraining(training: Training, tableWidth: CGFloat) -> CGFloat {
        let contentWidth = tableWidth - 2 * kPadding
        let trainingBody = training.trainingBody()
        let bodyAttributes = [NSFontAttributeName: Stylesheet.commonFontOfSize(kFontSize)]
        let bodyHeight = ceil(trainingBody.boundingRectWithSize(CGSize(width: contentWidth, height: 1000.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: bodyAttributes, context: nil).height) + 1.0
        return bodyHeight + kContentTopOffset + kContentBottomOffset
    }
    
    // MARK - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // setup
    }
    
    // MARK: - Actions
    @IBAction func actionEnterResult(sender: UIButton) {
        delegate?.didPressEnterResultButtonForFeedCell(self)
    }
    
    @IBAction func actionShowResults(sender: UIButton) {
        delegate?.didPressResultsButtonForFeedCell(self)
    }
}
