//
//  CartVC.swift
//  5thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/8/23.
//

import UIKit

struct Info {
    var size: String
    var delivery: String
    var dough: String
    var foodImg: UIImage?
}

class CartVC: UIViewController {
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var deliveryLabel: UILabel!
    @IBOutlet var doughLabel: UILabel!
    @IBOutlet var foodImg: UIImageView!
    
    var info:Info? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let info = self.info {
            if let size = sizeLabel.text {
                sizeLabel.text = size + info.size
            }
            if let delivery = deliveryLabel.text {
                deliveryLabel.text = delivery + info.delivery
            }
            if let dough = doughLabel.text {
                doughLabel.text = dough + info.dough
            }
            foodImg.image = info.foodImg
        }
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
