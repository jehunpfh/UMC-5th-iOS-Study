//
//  ViewController.swift
//  7thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/20/23.
//

import UIKit

// Kakao Login
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleKakaoLogin(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 카카오 로그인")
        startKakaoLoginFlow()
    }
    
}

//MARK: - Kakao Login
extension ViewController {
    
    /// 카카오톡 로그인 시작
    func startKakaoLoginFlow() {
        print(#fileID, #function, #line, "- ")
        fetchKakaoOpenIDToken(completion: { token in
            guard let token = token else { return }
            
            // DB와 연결
        })
    }
    
    /// 카카오 로그인 후 OpenID 토큰 가져오기
    func fetchKakaoOpenIDToken(completion: @escaping (String?) -> Void)  {
        // 카카오톡 실행 가능 여부 확인
        // 카카오톡이 설치되어 있다면
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                    completion(oauthToken?.idToken)
                }
            }
        } else {
            // 웹 브라우저로 로그인 시도
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    completion(oauthToken?.idToken)
                }
            }
        }
    }
        
        
}
