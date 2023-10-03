//
//  MainVC.swift
//  1thWeekBeforeStudyMission
//
//  Created by 김제훈 on 2023/09/26.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var couponLabel: UILabel!
    
    @IBOutlet var salePriceBannerStackView: UIStackView!
    
    @IBOutlet var naviBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.selectedIndex = 2
        
        couponLabel.layer.borderColor = UIColor.blue.cgColor
        couponLabel.layer.borderWidth = 1
        
        if let text = couponLabel.text{
                    
            let attributedString = NSMutableAttributedString(string: text)
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: "쿠폰")
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            couponLabel.attributedText = attributedString
        }
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "쿠폰")
        
        naviBarView.layer.cornerRadius = 15
        naviBarView.layer.masksToBounds = true
        
        couponLabel.layer.cornerRadius = 10
        couponLabel.layer.masksToBounds = true
        
        salePriceBannerStackView.layer.cornerRadius = 10
        salePriceBannerStackView.layer.masksToBounds = true
        
        print(#fileID, #function, #line, "- MainVC")
    }
}

class BorderCustomUIBtn: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
