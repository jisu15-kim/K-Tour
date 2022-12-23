// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let commonDetailModel = try? newJSONDecoder().decode(CommonDetailModel.self, from: jsonData)

import Foundation

// MARK: - CommonDetailModel
struct CommonDetailModel: Codable {
    let response: CDResponse
}

// MARK: - Response
struct CDResponse: Codable {
    let header: CDHeader
    let body: CDBody
}

// MARK: - Body
struct CDBody: Codable {
    let items: CDItems
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct CDItems: Codable {
    let item: [CDItem]
}

// MARK: - Item
struct CDItem: Codable {
    let contentid, contenttypeid, title, createdtime: String
    let modifiedtime, tel, telname, homepage: String
    let booktour: String
    let firstimage, firstimage2: String
    let addr1, addr2, zipcode, mapx: String
    let mapy, mlevel, overview: String
}

// MARK: - Header
struct CDHeader: Codable {
    let resultCode, resultMsg: String
}
