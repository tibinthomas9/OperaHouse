//
//  ArtistModelTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 20/09/23.
//

import XCTest
@testable import OperaHouse

final class ArtistModelTests: XCTestCase {
    let artist = Artist(id: 1, genre: "Punk", name: "Vomit Spots")

    func testArtistModel_IsValidId() {
         XCTAssertTrue(artist.isValidId())
    }
    func testArtistModel_IsValidName() {
         XCTAssertTrue(artist.isValidName())
    }
}
