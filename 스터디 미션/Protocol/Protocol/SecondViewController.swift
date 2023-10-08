//
//  SecondViewController.swift
//  Protocol
//
//  Created by 김제훈 on 2023/10/08.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    
    var previousVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousVC?.delegate = self
        
    }
    @IBAction func buttonDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        doChange()
    }
    
}

extension SecondViewController: ChangeLabelDelegate {
    func doChange() {
        previousVC?.label.text = self.textField.text
    }
    
    
}
