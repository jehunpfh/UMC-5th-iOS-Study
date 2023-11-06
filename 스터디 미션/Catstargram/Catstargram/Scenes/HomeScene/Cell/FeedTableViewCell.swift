//
//  FeedTableViewCell.swift
//  Catstargram
//
//  Created by 김제훈 on 11/6/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet var labelUserName: UILabel!
    @IBOutlet var imageViewUserProfile: UIView!
    @IBOutlet var imageViewFeed: UIImageView!
    @IBOutlet var buttonIsHeart: UIButton!
    @IBOutlet var buttonIsBookMark: UIButton!
    @IBOutlet var labelHowManyLike: UILabel!
    @IBOutlet var labelFeed: UILabel!
    @IBOutlet var imageViewMyProfile: UIImageView!
    
    @IBAction func actionIsHeart(_ sender: UIButton) {
        buttonIsHeart.isSelected = !buttonIsHeart.isSelected
    }
    
    @IBAction func actionBookMark(_ sender: UIButton) {
        buttonIsBookMark.isSelected = !buttonIsBookMark.isSelected
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.layer.masksToBounds = true
        imageViewUserProfile.clipsToBounds = true
        
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.layer.masksToBounds = true
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
