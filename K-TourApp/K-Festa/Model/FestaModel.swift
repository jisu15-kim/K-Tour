// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let festaModel = try? newJSONDecoder().decode(FestaModel.self, from: jsonData)

import Foundation

// MARK: - FestaModel
struct FestaModel: Codable {
    let response: FestaResponse
}

// MARK: - Response
struct FestaResponse: Codable {
    let header: FestaHeader
    let body: FestaBody
}

// MARK: - Body
struct FestaBody: Codable {
    let items: FestaItems
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct FestaItems: Codable {
    let item: [FestaItem]
}

// MARK: - Item
struct FestaItem: Codable {
    let addr1: String
    let addr2: String
    let booktour: String
    let cat1: String
    let cat2: String
    let cat3: String
    let contentid, contenttypeid, createdtime, eventstartdate: String
    let eventenddate: String
    let firstimage, firstimage2: String
    let mapx, mapy, mlevel, modifiedtime: String
    let readcount: Int
    let areacode, sigungucode, tel, title: String
}

// MARK: - Header
struct FestaHeader: Codable {
    let resultCode, resultMsg: String
}
