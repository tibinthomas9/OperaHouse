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
    private let client: ArtistPerformancesService

    func getArtistPerformances(artistId: String,
                               fromDate: String? = nil,
                               toDate: String? = nil) async throws {

        let fromString: String = fromDate ?? Date().getApiPathFormat()
        let toString: String = toDate ?? Date().add(days: 13)?.getApiPathFormat() ?? Date().getApiPathFormat()
        do {
            if let allArtistPerformances =
                try await client.getArtistPerformances(artistId: artistId,
                                                       fromDate: fromString,
                                                       toDate: toString) {
                self.artistPerformances = allArtistPerformances.sorted { $0.date < $1.date }
            }
            self.state = artistPerformances.isEmpty ? .empty :.loaded
        } catch {
            self.artistPerformances = []
            self.state = .error(error)
        }
    }

    init(client: ArtistPerformancesService = ArtistPerformancesClient()) {
        self.client = client
    }
}
