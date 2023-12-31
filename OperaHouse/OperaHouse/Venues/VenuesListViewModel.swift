//
//  VenuesListViewModel.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

@MainActor
class VenuesListViewModel: ObservableObject {

    @Published private(set) var state = LoadingState.loading
    @Published var venues: [Venue] = []
    @Published private var error: Error?

    private let client: any VenuesService

    func getVenues() async throws {
        do {
            if let allVenues = try await client.getVenues() {
                self.venues = allVenues.sorted { $0.sortId < $1.sortId }
            }
            self.state = venues.isEmpty ? .empty :.loaded
        } catch {
            self.venues = []
            self.state = .error(error)
        }
    }

    init(client: any VenuesService = VenuesClient()) {
        self.client = client
    }
}
