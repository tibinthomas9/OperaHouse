//
//  VenuePerformance.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 20/09/23.
//

import Foundation

struct VenuePerformance: MusicPerformance, Identifiable {
    var id: Int
    var date: String
    let venueId: Int
    let artist: Artist
}
