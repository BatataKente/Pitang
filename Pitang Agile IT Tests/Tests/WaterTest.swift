//
//  Josicleison.swift
//  Pitang Agile IT Tests
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import XCTest
@testable import Pitang_Agile_IT

final class WaterTest: XCTestCase {
//    func testCanParseWater() throws {
//        let jason = """
//        {
//            "waters": [
//                {
//                    "weather": [
//                        {
//                            "id": 804,
//                            "description": "overcast clouds"
//                        }
//                    ],
//                    "main": {
//                        "temp": 10.58
//                    },
//                    "name": "Calgary"
//                }
//            ]
//        }
//        """
//        guard let data = jason.data(using: .utf8) else {return}
//        let result = try? JSONDecoder().decode(Test.self, from: data)
//        XCTAssertEqual(10.58, result?.waters?.first?.main?.temp ?? 0)
//        XCTAssertEqual("Calgary", result?.waters?.first?.name ?? "")
//        XCTAssertEqual(804, result?.waters?.first?.weather?.first?.id ?? 0)
//        XCTAssertEqual("overcast clouds", result?.waters?.first?.weather?.first?.description ?? "")
//    }
//    func testCanParseWaterWithEmptyCityName() throws {
//        let jason = """
//        {
//            "waters": [
//                {
//                    "weather": [
//                        {
//                            "id": 804,
//                            "description": "overcast clouds"
//                        }
//                    ],
//                    "main": {
//                        "temp": 10.58
//                    },
//                    "name": ""
//                }
//            ]
//        }
//        """
//        guard let data = jason.data(using: .utf8) else {return}
//        let result = try? JSONDecoder().decode(Test.self, from: data)
//        XCTAssertEqual("", result?.waters?.first?.name ?? "")
//    }
    func testArray(_ escape: @escaping (Test.Water) -> ()) throws {
        guard let waters = read(the: Test.self, for: "Water")?.waters else {return}
        for water in waters {
            escape(water)
        }
    }
    func makeTests() throws {
        try testArray {water in
            XCTAssertNoThrow(water)
        }
    }
}
