//
//  ViewController.swift
//  Catstargram
//
//  Created by 김제훈 on 2023/10/04.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    var userInfo: UserInfo? = nil
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        
    }
    @IBAction func emailTextFieldEditingChange(_ sender: UITextField) {
        print(#fileID, #function, #line, "- ")
        let emailText = sender.text ?? ""
        
        self.loginButton.backgroundColor = emailText.isValidEmail() ? .facebookColor : .disabledButtonColor
        
        self.email = emailText
    }
    
    @IBAction func passwordTextFieldEditingChange(_ sender: UITextField) {
        let passwordText = sender.text ?? ""
        self.password = passwordText
        
        self.loginButton.backgroundColor = passwordText.isValidPassword() ? .facebookColor : .disabledButtonColor
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email && userInfo.password == self.password {
            print(#fileID, #function, #line, "- login success")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면 전환
        //1. SB 생성
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. VC 생성
        let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        //3. 화면전환 메소드 이용하여 화면 전환
//        self.present(registerVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerVC, animated: true)
        
        //ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
        registerVC.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
        
    }
}

