//
//  ArtistsViewModel.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 21/09/23.
//

import Foundation

@MainActor
class ArtistsListViewModel: ObservableObject {

    @Published private(set) var state = LoadingState.loading
    @Published var artists: [Artist] = []
    @Published private var error: Error?

    private let client: ArtistsService

    func getArtists() async throws {
        do {
            if let allArtists = try await client.getArtists() {
                self.artists = allArtists.sorted { $0.name < $1.name }
            }
            self.state = artists.isEmpty ? .empty :.loaded
        } catch {
            self.artists = []
            self.state = .error(error)
        }
    }

    init(client: ArtistsService = ArtistsClient()) {
        self.client = client
    }
}
