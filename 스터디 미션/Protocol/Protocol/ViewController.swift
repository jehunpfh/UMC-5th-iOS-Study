//
//  ViewController.swift
//  Protocol
//
//  Created by 김제훈 on 2023/10/08.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {
    var delegate: ChangeLabelDelegate?
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGoNextVC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        nextVC.previousVC = self
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
}

