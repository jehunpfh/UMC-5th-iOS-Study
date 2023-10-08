//
//  ViewController.swift
//  protocol1
//
//  Created by 김제훈 on 2023/10/08.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}
class Person {
    
}

extension Person: Flyable {
    func fly() {
        print(#fileID, #function, #line, "- Fly")
    }
}

extension Person: Runnable {
    func run() {
        print(#fileID, #function, #line, "- Run")
    }
    
    
}

class ViewController: UIViewController {
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person.fly()
        person.run()
    }


}

