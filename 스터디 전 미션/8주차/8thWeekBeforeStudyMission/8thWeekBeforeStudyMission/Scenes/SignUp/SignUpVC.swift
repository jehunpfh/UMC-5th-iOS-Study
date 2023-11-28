//
//  SignUpVC.swift
//  8thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/28/23.
//

import Foundation
import UIKit

class SignUpVC: UIViewController {
    @IBOutlet var userIdInputTF: UITextField!
    @IBOutlet var userPwInputTF: UITextField!
    @IBOutlet var userPwConfirmInputTF: UITextField!
    
    @IBOutlet var idValidationLabel: UILabel!
    @IBOutlet var pwValidationLabel: UILabel!
    @IBOutlet var pwConfirmValidationLabel: UILabel!
    
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.addTarget(self, action: #selector(signUpBtnClicked(_:)), for: .touchUpInside)
        
        signUpButton.isEnabled = false
        idValidationLabel.isHidden = true
        pwValidationLabel.isHidden = true
        pwConfirmValidationLabel.isHidden = true
        
        print(#fileID, #function, #line, "- ✅ \(LoginVC.shared)")
        
        LoginVC.shared.add(id: "a", pw: "a")
    }
    
    @objc func signUpBtnClicked(_ sender: UIButton) {
        let id = self.userIdInputTF.text ?? ""
        let pw = self.userPwInputTF.text ?? ""
        
        LoginVC.shared.add(id: id, pw: pw)
        self.dismiss(animated: true)
    }
    
    @IBAction func SignupIdTFValidation(_ sender: UITextField) {
        let inputId = sender.text ?? ""
        
        let (isValid, msg) = handleIdValidation(id:inputId)
        
        // Validation Label 설정
        if (self.idValidationLabel.isHidden) { self.idValidationLabel.isHidden = false }
        self.idValidationLabel.text = msg
        if(isValid) {
            self.idValidationLabel.textColor = UIColor.black
        }
        else {
            self.idValidationLabel.textColor = UIColor.systemRed
        }
        
        // Btn 활성화 체크
        self.signUpButton.isEnabled = signUpBtnEnableValidation()
    }
    
    @IBAction func SignupPwTFValidation(_ sender: UITextField) {
        let inputPw = sender.text ?? ""
        
        let (isValid, msg) = handlePwValidation(pw:inputPw)
        
        // Validation Label 설정
        if (self.pwValidationLabel.isHidden) { self.pwValidationLabel.isHidden = false }
        self.pwValidationLabel.text = msg
        if(isValid) {
            self.pwValidationLabel.textColor = UIColor.black
        }
        else {
            self.pwValidationLabel.textColor = UIColor.systemRed
        }
        
        // Btn 활성화 체크
        self.signUpButton.isEnabled = signUpBtnEnableValidation()
    }
  
    @IBAction func SignupPwConfirmTFValidation(_ sender: UITextField) {
        let inputPw = self.userPwInputTF.text ?? ""
        let inputPwConfirm = sender.text ?? ""
        
        let (isValid, msg) = handlePwConfirmValidation(pw:inputPw, pwConfirm: inputPwConfirm)
        
        // Validation Label 설정
        if (self.pwConfirmValidationLabel.isHidden) { self.pwConfirmValidationLabel.isHidden = false }
        self.pwConfirmValidationLabel.text = msg
        if(isValid) {
            self.pwConfirmValidationLabel.textColor = UIColor.black
        }
        else {
            self.pwConfirmValidationLabel.textColor = UIColor.systemRed
        }
        
        // Btn 활성화 체크
        self.signUpButton.isEnabled = signUpBtnEnableValidation()
    }
    
    // ID Validation
    private func handleIdValidation(id: String) -> (Bool, String) {
        var msg = ""
        var result = false

        if (checkIdDuplication(id: id)) {
            msg = "아이디가 중복됩니다."
        }
        else if (!(id.count > 0)) {
            msg = "1자 이상 입력해주세요."
        }
        else {
            msg = "✅"
            result = true
        }
        
        return (result, msg)
        
    }
    
    private func checkIdDuplication(id: String) -> Bool {
        return LoginVC.shared.isIdAlreadyExist(id: id)
    }
    
    // PW Validation
    private func handlePwValidation(pw: String) -> (Bool, String) {
        var msg = ""
        var result = false
        
        if(pw.count > 4) {
            result = true
            msg = "✅"
        }
        else {
            msg = "5자 이상 입력해주세요."
        }
        
        return (result, msg)
    }

    // PW Confirm Validation
    private func handlePwConfirmValidation(pw: String, pwConfirm: String) -> (Bool, String) {
        var msg = ""
        var result = false
        
        if(pw == pwConfirm) {
            result = true
            msg = "✅"
        }
        else {
            msg = "일치하지 않습니다, 다시 입력해주세요."
        }
        
        return (result, msg)
    }
    
    private func signUpBtnEnableValidation() -> Bool {
        // 회원가입 버튼 활성화 조건
        let idLabel = self.idValidationLabel.text ?? ""
        let pwLabel = self.pwValidationLabel.text ?? ""
        let pwConfirmLabel = self.pwConfirmValidationLabel.text ?? ""
        
        return idLabel == "✅" && pwLabel == "✅" && pwConfirmLabel == "✅"
    }

}
