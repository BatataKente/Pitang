//
//  Water.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import Foundation

struct Test: Codable {
    struct Water: Codable {
        struct Weather: Codable {
            let id: Int?
            let description: String?
        }
        let weather: [Weather]?
        struct Main: Codable {
            let temp: Float?
        }
        let main: Main?
        let name: String?
    }
    let waters: [Water]?
}
