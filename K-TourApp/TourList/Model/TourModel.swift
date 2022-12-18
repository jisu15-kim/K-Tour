// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tourModel = try? newJSONDecoder().decode(TourModel.self, from: jsonData)

import Foundation

// MARK: - TourModel
struct TourModel: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let addr1: String
    let addr2: String
    let areacode: String
    let booktour: String
    let cat1: String
    let cat2: String
    let cat3: String
    let contentid: String
    let contenttypeid: String
    let createdtime: String
    let firstimage: String
    let firstimage2: String
    let mapx: String
    let mapy: String
    let mlevel: String
    let modifiedtime: String
    let readcount: Int
    let sigungucode: String
    let tel: String
    let title: String
    let zipcode: String
}

enum Cat1: String, Codable {
    case a02 = "A02"
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}
