//
//  Helper.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/19.
//

import UIKit

enum contentTypeID: Int {
    case tour = 12
    case cultureFacility = 14
    case festival = 15
    case travelCourse = 25
    case reports = 28
    case stay = 32
    case shopping = 38
    case restaurant = 39
}

struct Helper {
    private let key = "O%2FG920ZjfGIFYshoBYqghwh3hF22e6g9KOcQj6T2D1eAw6LqO18gKbSGOTmmvhyaVPkiQmnh3qQfhMNvU3A4YQ%3D%3D"
    private let url = ""
    private let domain = "http://apis.data.go.kr/B551011/KorService/areaBasedList?"
    private var numOfRows = 20
    private var areaCode = 1
    
    public func getURL(contentType: contentTypeID, pageNumber: Int) -> String {
        let url = "\(domain)pageNo=\(pageNumber)&numOfRows=\(numOfRows)&serviceKey=\(key)&MobileApp=k-tour&MobileOS=IOS&arrange=Q&contentTypeId=\(contentType.rawValue)&areaCode=\(areaCode)&_type=json"
        return url
    }
}
