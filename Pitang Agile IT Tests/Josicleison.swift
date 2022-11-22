//
//  Josicleison.swift
//  Pitang Agile IT Tests
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import XCTest
@testable import Pitang_Agile_IT

final class Josicleison: XCTestCase {

    func testExample() throws {
        let jason = """
        {
            "weather": [
                {
                    "id": 804,
                    "description": "overcast clouds"
                }
            ],
            "main": {
                "temp": 10.58
            },
            "name": "Calgary"
        }
        """
        
        guard let data = jason.data(using: .utf8) else {return}
        let weaterData = try? JSONDecoder().decode(Water.self, from: data)
        
        XCTAssertEqual(10.58, weaterData?.main?.temp ?? 0)
        XCTAssertEqual("Calgary", weaterData?.name ?? "")
    }
}
