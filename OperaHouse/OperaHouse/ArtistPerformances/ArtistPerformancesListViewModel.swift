//
//  ArtistPerformancesListViewModel.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

@MainActor
class ArtistPerformancesListViewModel: ObservableObject {

    @Published private(set) var state = LoadingState.loading
    @Published var artistPerformances: [ArtistPerformance] = []
    @Published private var error: Error?

    private let client: ArtistPerformancesClient

    func getArtistPerformances(artistId: String, fromDate: String, toDate: String) async throws {
        do {
            if let allArtistPerformances = try await client.getArtistPerformances(artistId: artistId, fromDate: fromDate, toDate: toDate) {
                self.artistPerformances = allArtistPerformances
            }
            self.state = artistPerformances.isEmpty ? .empty :.loaded
        } catch {
            self.artistPerformances = []
            self.state = .error(error)
        }
    }

    init(client: ArtistPerformancesClient = ArtistPerformancesClient()) {
        self.client = client
    }
}

