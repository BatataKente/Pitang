//
//  Movies.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import Foundation

struct Movie: Codable {
    
    let _id, name, url: String?
    let __v: Int?
}

struct MovieDetails: Codable {
    
    let _id, name, description, url: String?
    let __v: Int?
}
