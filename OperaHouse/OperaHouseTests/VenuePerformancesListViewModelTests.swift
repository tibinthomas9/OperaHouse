//
//  VenuePerformancesListViewModelTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 23/09/23.
//

import XCTest
@testable import OperaHouse

final class VenuePerformancesListViewModelTests: XCTestCase {

    @MainActor func testVenuePerformancesDataFetch() async throws {
        // given
        let client =  VenuePerformancesClient()
        let viewModel = VenuePerformancesListViewModel(client: client)

        // when
        try await viewModel.getVenuePerformances(venueId: "3", fromDate: "2023-09-01", toDate: "2023-09-15")

        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.venuePerformances.count > 0)
    }
}
