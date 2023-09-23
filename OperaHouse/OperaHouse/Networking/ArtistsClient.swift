//
//  ArtistsClient.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 21/09/23.
//

import Foundation

protocol ArtistsService {
    func getArtists() async throws -> [Artist]?
}

class ArtistsClient: ArtistsService {
    func getArtists() async throws -> [Artist]? {
        guard let url =  AppEndPoint.artists.url() else { return nil }
        do {
            if let artists = try await NetworkClient.shared.fetchHttpData(from: url,
                                                                          responseType: [Artist]?.self) {
                return artists
            } else { return nil }
        } catch { throw error }
    }
}
