//
//  ExtensionsTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 23/09/23.
//

import XCTest
@testable import OperaHouse

final class ExtensionsTests: XCTestCase {

    func testDateExtensionApiPathFormat() {
        let date = "2023-09-01T18:00:00".toDate()
        XCTAssertEqual(date?.getApiPathFormat(), "2023-09-01")
    }

    func testDateExtensionFullFormat() {
        let date = "2023-09-01T18:00:00".toDate()
        XCTAssertEqual(date?.getFullFormat(), "1 Sep 2023, 6:00 PM")
    }

    func testDateExtensionAddDays() {
        let date = "2023-09-01T18:00:00".toDate()
        XCTAssertEqual(date?.add(days: 14)?.getApiPathFormat(), "2023-09-15")
    }

    func testStringExtensionToDate() {
        let date = "2023-09-01T18:00:00".toDate()
        XCTAssertEqual(date?.getFullFormat(), "1 Sep 2023, 6:00 PM")
    }

}
