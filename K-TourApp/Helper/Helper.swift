//
//  Helper.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/19.
//

import Foundation

struct Helper {
    private let key = "O%2FG920ZjfGIFYshoBYqghwh3hF22e6g9KOcQj6T2D1eAw6LqO18gKbSGOTmmvhyaVPkiQmnh3qQfhMNvU3A4YQ%3D%3D"
    private let url = ""
    private let domain = "http://apis.data.go.kr/B551011/KorService/areaBasedList?"
    private var pageNo = 1
    private var numOfRows = 10
    private var contentTypeCode = 12
    private var areaCode = 1
    
    public func getURL() -> String {
        let url = "\(domain)pageNo=\(pageNo)&numOfRows=\(numOfRows)&serviceKey=\(key)&MobileApp=k-tour&MobileOS=IOS&arrange=Q&contentTypeId=\(contentTypeCode)&areaCode=\(areaCode)&_type=json"
        return url
    }
}
