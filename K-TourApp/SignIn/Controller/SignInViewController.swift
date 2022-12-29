//
//  SignInViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/22.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class SignInViewController: UIViewController {

    @IBOutlet weak var kakaoButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKakaoButton()
        
    }
    
    private func setupKakaoButton() {
        kakaoButton.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(kakaoLoginButtonTapped))
        kakaoButton.addGestureRecognizer(gesture)
    }
    
    @objc private func kakaoLoginButtonTapped() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡 로그인 성공")
                    print("/////////////////////oauthToken: \(oauthToken)")
                    self?.viewTransition()
                }
            }
        } else {
            self.kakaoLoginWithAccount()
        }
    }
    
    private func kakaoLoginWithAccount() {
        UserApi.shared.loginWithKakaoAccount {[weak self] oauthToken, error in
            if let error = error {
                print(error)
            } else {
                print("로그인 성공")
                self?.viewTransition()
            }
        }
    }
    
    private func viewTransition() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
