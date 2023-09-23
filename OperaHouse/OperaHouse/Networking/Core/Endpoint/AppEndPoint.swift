//
//  AppEndPoint.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 21/09/23.
//

import Foundation

enum AppEndPoint: URLEndpoint {
    case artists
    case venues
    case artistPerformances(artistId: String, fromDate: String, toDate: String)
    case venuePerformances(venueId: String, fromDate: String, toDate: String)
}
extension AppEndPoint {

    var path: String {
        switch self {
        case .artists:
            return "/artists"
        case .venues:
            return "/venues"
        case .artistPerformances(let artistId, _, _):
            return "/artists/\(artistId)/performances"
        case .venuePerformances(let venueId, _, _):
            return "/venues/\(venueId)/performances"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .artistPerformances(artistId: _, fromDate: let fromDate, toDate: let toDate):
            return [URLQueryItem(name: "from", value: fromDate), URLQueryItem(name: "to", value: toDate)]
        case .venuePerformances(venueId: _, fromDate: let fromDate, toDate: let toDate):
            return [URLQueryItem(name: "from", value: fromDate), URLQueryItem(name: "to", value: toDate)]
        default:
            return nil
        }
    }
}
