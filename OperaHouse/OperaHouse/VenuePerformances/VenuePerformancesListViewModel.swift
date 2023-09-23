//
//  VenuePerformancesListViewModel.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

@MainActor
class VenuePerformancesListViewModel: ObservableObject {

    @Published private(set) var state = LoadingState.loading
    @Published var venuePerformances: [VenuePerformance] = []
    @Published private var error: Error?
    private let client: any VenuePerformancesService

    func getVenuePerformances(venueId: String,
                              fromDate: String? = nil,
                              toDate: String? = nil) async throws {

        let fromString: String = fromDate ?? Date().getApiPathFormat()
        let toString: String = toDate ?? Date().add(days: 13)?.getApiPathFormat() ?? Date().getApiPathFormat()
        do {
            if let allVenuePerformances =
                try await client.getVenuePerformances(venueId: venueId,
                                                      fromDate: fromString,
                                                      toDate: toString) {
                self.venuePerformances = allVenuePerformances.sorted { $0.date < $1.date }
            }
            self.state = venuePerformances.isEmpty ? .empty :.loaded
        } catch {
            self.venuePerformances = []
            self.state = .error(error)
        }
    }

    init(client: any VenuePerformancesService = VenuePerformancesClient()) {
        self.client = client
    }
}
