//
//  LazyTests.swift
//  Pitang Agile IT Tests
//
//  Created by Josicleison Elves on 08/09/1401 AP.
//

import XCTest
@testable import Pitang_Agile_IT

final class LazyTest: XCTestCase {
    func testSquare() {
        let value = 3
        XCTAssertEqual(value.square(), 9)
    }
    func testHelloWorld() {
        var helloWorld: String?
        helloWorld = "Hello Crazy World"
        XCTAssertEqual(helloWorld, "Hello Crazy World")
    }
}
