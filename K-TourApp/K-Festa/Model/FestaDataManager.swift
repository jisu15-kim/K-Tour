//
//  FestaDataManager.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/23.
//

import UIKit
import Alamofire

class FestaDataManager {
    func getNetworkData(completion: @escaping ([FestaItem]) -> Void) {
        AF.request(Helper().getFestaDataURL(date: "20221201"))
            .responseDecodable(of: FestaModel.self) { response in
                switch response.result {
                case .success(let response):
                    print("========성공========")
                    completion(response.response.body.items.item)
                    
                case .failure(let error):
                    print("========실패========")
                    print(error)
                }
            }
    }
}
