//
//  RegisterVC.swift
//  Catstargram
//
//  Created by 김제훈 on 2023/10/07.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet {
            DispatchQueue.main.async {
                self.validateUserInfo()
            }
            
        }
    }
    var isValidName = false {
        didSet {
            DispatchQueue.main.async {
                self.validateUserInfo()
            }
        }
    }
    var isValidNickname = false {
        didSet {
            DispatchQueue.main.async {
                self.validateUserInfo()
            }
        }
    }
    var isValidPassword = false {
        didSet {
            DispatchQueue.main.async {
                self.validateUserInfo()
            }
        }
    }
    
    @IBOutlet var dismissToLoginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    //TextFields
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var nicknameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
        
    var textFields: [UITextField] {
        [emailTF, nameTF, nicknameTF, passwordTF]
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    //MARK: - Actions
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTF:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTF:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTF:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTF:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TestField")
        }
        
        
    }
    
    @IBAction func backBtnDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: email, name: name, nickname: nickname, password: password)
        
        self.userInfo?(userInfo)
        
    }
    
    
    //MARK: - Helpers
    private func setupTextField() {
//        emailTF.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//        nameTF.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//        nicknameTF.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//        passwordTF.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }

    /// 사용자가 입력한 회원정보를 확인하고 -> UI업데이트
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                DispatchQueue.main.async {
                    self.signupButton.backgroundColor = UIColor.facebookColor
                }
            }
            
            
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                DispatchQueue.main.async {
                    self.signupButton.backgroundColor = UIColor.disabledButtonColor
                }
            }
        }
    }
   
    private func setupAttribute() {
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.dismissToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.dismissToLoginButton.setAttributedTitle(attributes, for: .normal)
        
    }
}
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
