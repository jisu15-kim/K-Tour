//
//  CommonDetailDataManager.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/20.
//

import Foundation
import Alamofire

class CommonDetailDataManager {
    func getNetworkData(contentID: String, completion: @escaping ([CDItem]) -> Void) {
        AF.request(Helper().getCommonDataURL(contentID: contentID))
            .responseDecodable(of: CommonDetailModel.self) { response in
                switch response.result {
                case .success(let response):
                    print("============성공==========")
                    completion(response.response.body.items.item)
                case .failure(let error):
                    print("============실패==========")
                    print(error)
                }
            }
    }
}
