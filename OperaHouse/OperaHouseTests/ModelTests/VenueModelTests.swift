//
//  VenueModelTest.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 20/09/23.
//

import XCTest
@testable import OperaHouse

final class VenueModelTests: XCTestCase {

    func testVenueModel_IsValidId() {
          let venue = Venue(id: 1, name: "Globe", sortId: 1)
         XCTAssertTrue(venue.isValidId())
    }

}
