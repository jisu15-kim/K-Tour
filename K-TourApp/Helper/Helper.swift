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
    private let key = Secret.apiKey
    private let url = ""
    private let listViewDomain = "areaBasedList?"
    private let commonDataDomain = "detailCommon?"
    private var numOfRows = 20
    private var areaCode = 1
    
    public func getListViewURL(contentType: contentTypeID, pageNumber: Int) -> String {
        let url = "http://apis.data.go.kr/B551011/KorService/\(listViewDomain)pageNo=\(pageNumber)&numOfRows=\(numOfRows)&serviceKey=\(key)&MobileApp=k-tour&MobileOS=IOS&arrange=Q&contentTypeId=\(contentType.rawValue)&areaCode=\(areaCode)&_type=json"
        return url
    }
    
    public func getCommonDataURL(contentID: String) -> String {
        let url = "http://apis.data.go.kr/B551011/KorService/\(commonDataDomain)pageNo=1&numOfRows=10&serviceKey=\(key)&numOfRows=10&pageNo=1&MobileOS=iOS&MobileApp=k-tour&contentId=\(contentID)&defaultYN=Y&_type=json&overviewYN=Y&addrinfoYN=Y&mapinfoYN=Y&firstImageYN=Y"
        return url
    }
    
    public func getFestaDataURL(date: String) -> String {
        let url = "http://apis.data.go.kr/B551011/KorService/searchFestival?serviceKey=\(key)&numOfRows=10&pageNo=1&MobileOS=iOS&MobileApp=k-tour&arrange=Q&listYN=Y&eventStartDate=\(date)&_type=json"
        print(url)
        return url
    }
}
