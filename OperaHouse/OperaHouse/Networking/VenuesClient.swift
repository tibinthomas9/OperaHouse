//
//  VenuesClient.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

protocol VenuesService {
    func getVenues() async throws -> [Venue]?
}

class VenuesClient: VenuesService {
    func getVenues() async throws -> [Venue]? {
        guard let url =  AppEndPoint.venues.url() else { return nil }
        do {
            if let venues = try await NetworkClient.shared.fetchHttpData(from: url,
                                                                          responseType: [Venue]?.self) {
                return venues
            } else { return nil }
        } catch { throw error }
    }
}
