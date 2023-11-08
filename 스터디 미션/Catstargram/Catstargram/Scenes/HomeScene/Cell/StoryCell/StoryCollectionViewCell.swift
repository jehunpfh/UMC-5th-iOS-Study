//
//  StoryCollectionViewCell.swift
//  Catstargram
//
//  Created by 김제훈 on 11/6/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageBackgroundView: UIView!
    @IBOutlet var userProfileBackgroundView: UIView!
    @IBOutlet var userProfileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageBackgroundView.layer.cornerRadius = 24
        userProfileBackgroundView.layer.cornerRadius = 23.5
        userProfileImageView.layer.cornerRadius = 22.5
        userProfileImageView.clipsToBounds = true
    }

}
