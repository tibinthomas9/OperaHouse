//
//  ArtistPerformance.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 20/09/23.
//

import Foundation

struct ArtistPerformance: MusicPerformance {
    var id: Int
    var date: String
    let artistId: Int
    let venue: Venue
}
