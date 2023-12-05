//
//  ViewController.swift
//  9thWeekBeforeStudyMission
//
//  Created by 김제훈 on 12/5/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var districtNameLabel: UILabel!
    
    @IBOutlet var issueDateLabel: UILabel!
    
    @IBOutlet var issueGbnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DustVM().fetchData(self)
    }

    func didSuccess(_ response: Dust){
        for i in response.response.body.items {
            if (i.districtName == "서울") {
                districtNameLabel.text = i.districtName
                issueDateLabel.text = i.issueDate
                issueGbnLabel.text = i.issueGbn.rawValue
                break
            }
        }
    }
}


