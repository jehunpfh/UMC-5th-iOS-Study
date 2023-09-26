//
//  MainVC.swift
//  1thWeekBeforeStudyMission
//
//  Created by 김제훈 on 2023/09/26.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var couponBannerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.selectedIndex = 2
        couponBannerLabel.layer.cornerRadius = 10
        couponBannerLabel.layer.masksToBounds = true
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
