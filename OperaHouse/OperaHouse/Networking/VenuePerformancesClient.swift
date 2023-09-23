//
//  VenuePerformancesClient.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 23/09/23.
//

import Foundation

protocol VenuePerformancesService {
    func getVenuePerformances(venueId: String,
                              fromDate: String,
                              toDate: String) async throws -> [VenuePerformance]?
}

class VenuePerformancesClient: VenuePerformancesService {
    func getVenuePerformances(venueId: String,
                              fromDate: String,
                              toDate: String) async throws -> [VenuePerformance]? {
        guard let url =  AppEndPoint.venuePerformances(venueId: venueId,
                                                       fromDate: fromDate,
                                                       toDate: toDate).url() else { return nil }
        do {
            if let venuePerformances = try await
                NetworkClient.shared.fetchHttpData(from: url,
                                                   responseType: [VenuePerformance]?.self) {
                return venuePerformances
            } else { return nil }
        } catch { throw error }
    }
}
