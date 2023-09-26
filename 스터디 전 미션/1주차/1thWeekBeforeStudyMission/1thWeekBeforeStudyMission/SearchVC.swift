//
//  SearchVC.swift
//  1thWeekBeforeStudyMission
//
//  Created by 김제훈 on 2023/09/26.
//

import Foundation
import UIKit

class SearchVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.selectedIndex = 2
        print(#fileID, #function, #line, "- searchVC")
    }
}
