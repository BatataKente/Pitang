//
//  TestReader.swift
//  Pitang Agile IT Tests
//
//  Created by Josicleison Elves on 07/09/1401 AP.
//

import XCTest

extension XCTestCase {
    func read<T: Codable>(the model: T.Type,for resource: String) -> T? {
        guard let url = Bundle(
            for: type(of: self)).path(forResource: resource, ofType: "geojson"
        ) else {
            fatalError("jason not found")
        }
        guard let jason = try? String(contentsOfFile: url, encoding: .utf8) else {return nil}
        guard let data = jason.data(using: .utf8) else {return nil}
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
