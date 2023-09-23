//
//  ArtistPerformancesListViewModelTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 22/09/23.
//

import XCTest
@testable import OperaHouse

final class ArtistPerformancesListViewModelTests: XCTestCase {

    @MainActor func testArtistPerformancesDataFetch() async throws {
        // given
        let client =  ArtistPerformancesClient()
        let viewModel = ArtistPerformancesListViewModel(client: client)

        // when
        try await viewModel.getArtistPerformances(artistId: "3", fromDate: "2023-09-01", toDate: "2023-09-15")

        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.artistPerformances.count > 0)
    }
}
