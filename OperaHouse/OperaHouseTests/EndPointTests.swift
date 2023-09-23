//
//  EndPointTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 22/09/23.
//

import XCTest
@testable import OperaHouse

final class EndPointTests: XCTestCase {

    func testImageEndpointUrl() {
        let url = ImageEndPoint.venue(name: "The Velvet Unicorn").url()
        XCTAssertEqual(url?.absoluteString, "https://songleap.s3.amazonaws.com/venues/The%20Velvet%20Unicorn.png")
    }

}
