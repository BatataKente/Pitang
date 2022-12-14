//
//  Book.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import Foundation

struct Bible: Codable {
    let book: Book?
    let chapter: Chapter?
    let verses: [Verse]?
}
struct Book: Codable {
    let abbrev: Abbrev?
    let name, author, group, version: String?
}
struct Abbrev: Codable {
    let pt, en: String?
}
struct Chapter: Codable {
    let number, verses: Int?
}
struct Verse: Codable {
    let number: Int?
    let text: String?
}
