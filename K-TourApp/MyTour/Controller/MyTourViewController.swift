//
//  MyTourViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/22.
//

import UIKit
import KakaoSDKUser
import Kingfisher

class MyTourViewController: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNicknameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
    }
    
    private func configure() {
        UserApi.shared.me { [weak self] user, error in
            if let error = error {
                print(error)
            } else {
                self?.userNicknameLabel.text = "\(user?.kakaoAccount?.profile?.nickname ?? "에러")"
                self?.userEmailLabel.text = "\(user?.kakaoAccount?.email ?? "")"
                let userImageUrl = user?.kakaoAccount?.profile?.profileImageUrl
                self?.userProfileImage.kf.setImage(with: userImageUrl)
            }
        }
    }
    
    private func setupUI() {
        userProfileImage.layer.cornerRadius = userProfileImage.frame.height / 2
        userProfileImage.clipsToBounds = true
    }
}
