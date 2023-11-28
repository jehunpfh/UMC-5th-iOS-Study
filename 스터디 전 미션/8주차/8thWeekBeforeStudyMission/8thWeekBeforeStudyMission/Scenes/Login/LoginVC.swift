//
//  ViewController.swift
//  8thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/28/23.
//

import UIKit

struct Account {
    var id: String
    var pw: String
    
    func equals(another: Account) -> Bool {
        return self.id == another.id && self.pw == another.pw
    }
}

class LoginVC: UIViewController {
    static let shared: DBControl = DBControl()
    
    @IBOutlet var userIdInputTextField: UITextField!
    @IBOutlet var userPwInputTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#fileID, #function, #line, "- ⭐️\(self)")
        print(#fileID, #function, #line, "- DB \(LoginVC.shared.db)")
        self.loginButton.isEnabled = false
    }
    
    
    //MARK: - Login버튼 enable 컨트롤
    @IBAction func idTFValidation(_ sender: UITextField) {
        let inputId = sender.text ?? ""
        let inputPw = self.userPwInputTextField.text ?? ""
        
        self.loginButton.isEnabled = loginBtnEnableValidation(id: inputId, pw: inputPw)
    }
    
    @IBAction func pwTFValidation(_ sender: UITextField) {
        let inputId = self.userIdInputTextField.text ?? ""
        let inputPw = sender.text ?? ""
        
        self.loginButton.isEnabled = loginBtnEnableValidation(id: inputId, pw: inputPw)
    }
    
    private func loginBtnEnableValidation(id: String, pw: String) -> Bool {
        print(#fileID, #function, #line, "- \(id.count) \(pw.count)")
        // 로그인 버튼 활성화 조건
        if (id.count > 0 && pw.count > 4) {
            return true
        }
        
        return false
    }
    
    //MARK: - Login, Signup 버튼 클릭 후 동작
    /// 로그인 성공하면 성공 팝업, 실패했다면 오류 팝업
    @IBAction func handleLogin(_ sender: UIButton) {
        var title = ""
        var message = ""
        
        let userInputId = self.userIdInputTextField.text ?? ""
        let userInputPw = self.userPwInputTextField.text ?? ""
        
        if (loginValidation(id: userInputId, pw: userInputPw)) {
            title = "성공"
            message = "로그인 성공"
        }
        else {
            title = "실패"
            message = "아이디 또는 비밀번호를 확인하세요."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        print(#fileID, #function, #line, "- 👍DB \(LoginVC.shared.db)")
    }
    
    private func loginValidation(id: String, pw: String) -> Bool {
        if (id.isEmpty || pw.isEmpty) {
            return false
        }
        
        let account = Account(id: id, pw: pw)
        
        return LoginVC.shared.isSameInDB(account: account)
    }
}

//MARK: - DBControl Class
class DBControl {
    var db: [Account] = [Account(id: "b", pw: "12345")]
    
    func add(id: String, pw: String) {
        self.db.append(Account(id: id, pw: pw))
        print(#fileID, #function, #line, "- DB \(db)")
    }
    
    func isIdAlreadyExist(id: String) -> Bool {
        for a in self.db {
            if (a.id == id) {
                return true
            }
        }
        
        return false
    }
    
    func isSameInDB(account: Account) -> Bool {
        for a in self.db {
            if (a.equals(another: account)) {
                return true
            }
        }
        
        return false
    }
}
