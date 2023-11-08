//
//  ViewController.swift
//  5thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/7/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sizeSwitch: UISwitch!
    @IBOutlet var deliverySwitch: UISwitch!
    @IBOutlet var doughSwitch: UISwitch!
    @IBOutlet var foodImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addCartBtnClicked(_ sender: UIButton) {
        //화면 전환
        //1. SB 생성
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. VC 생성
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        //3. 화면전환 메소드 이용하여 화면 전환
//        self.present(cartVC, animated: true, completion: nil)
        
//        cartVC.foodImg.image = self.foodImg.image ?? UIImage()

        let size = (sizeSwitch.isOn ? " M" : " L")
        let delivery = (deliverySwitch.isOn ? " 여러집 배달" : " 한집 배달")
        let dough = (deliverySwitch.isOn ? " 일반" : " 치즈")
        let foodImg = self.foodImg.image ?? UIImage(named: "circle")
        cartVC.info = Info(size: size, delivery: delivery, dough: dough, foodImg: foodImg)
//        if let size = cartVC.sizeLabel.text {
//            cartVC.sizeLabel.text = size + (sizeSwitch.isOn ? " M" : " L")
//        }
//        if let delivery = cartVC.deliveryLabel.text {
//            cartVC.sizeLabel.text = delivery + (deliverySwitch.isOn ? " 여러집 배달" : " 한집 배달")
//        }
//        if let dough = cartVC.doughLabel.text {
//            cartVC.sizeLabel.text = dough + (deliverySwitch.isOn ? " 일반" : " 치즈")
//        }
        
        
        self.navigationController?.pushViewController(cartVC, animated: true)
        
        //ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
//        registerVC.userInfo = { [weak self] (userInfo) in
//            self?.userInfo = userInfo
//        }
    }
    
}

