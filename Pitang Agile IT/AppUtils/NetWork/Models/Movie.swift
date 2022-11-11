//
//  Movies.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import Foundation

struct Movies: Codable {
    let page, total_pages, total_results: Int?
    let results: [Result]?
}

struct Result: Codable {
    let adult, video: Bool?
    let backdrop_path, original_language, original_title, overview, poster_path, release_date, title: String?
    let genre_ids: [Int]?
    let id, vote_count: Int?
    let popularity, vote_average: Double?
}
