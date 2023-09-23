//
//  VenuesListViewModelTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 22/09/23.
//

import XCTest
@testable import OperaHouse

final class VenuesListViewModelTests: XCTestCase {

    @MainActor func testVenuesDataFetch() async throws {
        // given
        let client =  VenuesClient()
        let viewModel = VenuesListViewModel(client: client)

        // when
        try await viewModel.getVenues()

        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.venues.count > 0)
    }

}
