//
//  ArtistPerformancesClient.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

protocol ArtistPerformancesService {
    func getArtistPerformances(artistId: String,
                               fromDate: String,
                               toDate: String) async throws -> [ArtistPerformance]?
}

class ArtistPerformancesClient: ArtistPerformancesService {
    func getArtistPerformances(artistId: String,
                               fromDate: String,
                               toDate: String) async throws -> [ArtistPerformance]? {
        guard let url =  AppEndPoint.artistPerformances(artistId: artistId,
                                                       fromDate: fromDate,
                                                       toDate: toDate).url() else { return nil }
        do {
            if let artistPerformances = try await
                NetworkClient.shared.fetchHttpData(from: url,
                                                   responseType: [ArtistPerformance]?.self) {
                return artistPerformances
            } else { return nil }
        } catch { throw error }
    }
}
