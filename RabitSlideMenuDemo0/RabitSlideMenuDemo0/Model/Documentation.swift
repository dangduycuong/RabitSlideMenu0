//
//  Documentation.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 18/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let documentation = try? newJSONDecoder().decode(Documentation.self, from: jsonData)

import Foundation

// MARK: - Documentation
struct Documentation: Codable {
    var d: [D]?
    var q: String?
    var v: Int?
}

// MARK: - D
struct D: Codable {
    var i: I?
    var id, l, q, qid: String?
    var rank: Int?
    var s: String?
    var y: Int?
    var yr: String?
}

// MARK: - I
struct I: Codable {
    var height: Int?
    var imageURL: String?
    var width: Int?
    
    enum CodingKeys: String, CodingKey {
        case height
        case imageURL = "imageUrl"
        case width
    }
}
