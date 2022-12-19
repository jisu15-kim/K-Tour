//
//  NetworkManager.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/19.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var models: [Item] = []
    
    func getNetworkData(contentType: contentTypeID, pageNumber: Int, completion: @escaping ([Item]) -> Void) {
        AF.request(Helper().getURL(contentType: contentType, pageNumber: pageNumber))
            .responseDecodable(of: TourModel.self) { response in
                switch response.result {
                case .success(let response):
                    print("============성공==========")
                    self.models = response.response.body.items.item
                    completion(response.response.body.items.item)
                case .failure(let error):
                    print("============실패==========")
                    print(error)
                }
            }
    }
}
