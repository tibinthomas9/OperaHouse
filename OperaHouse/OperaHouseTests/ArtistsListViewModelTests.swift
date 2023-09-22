//
//  ArtistsListViewModelTests.swift
//  OperaHouseTests
//
//  Created by Tibin Thomas on 21/09/23.
//

import XCTest
@testable import OperaHouse

final class ArtistsListViewModelTests: XCTestCase {

    @MainActor func testArtistsDataFetch() async throws {
        // given
        let client =  ArtistsClient()
        let viewModel = ArtistsListViewModel(client: client)

        // when
        try await viewModel.getArtists()

        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.artists.count > 0)
    }

}
