//
//  PostCell.swift
//  3thWeekBeforeStudyMission
//
//  Created by 김제훈 on 2023/10/07.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var commentCountLabel: UILabel!
    @IBOutlet var likeCountLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
