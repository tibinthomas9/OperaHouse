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
    case artistPerformance(artistId: String, fromDate: String, toDate: String)
}
extension AppEndPoint {

    var path: String {
        switch self {
        case .artists:
            return "/artists"
        case .venues:
            return "/venues"
        case .artistPerformance(let artistId, _, _):
            return "/artists/\(artistId)/performances"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .artistPerformance(artistId: _, fromDate: let fromDate, toDate: let toDate):
            return [URLQueryItem(name: "from", value: fromDate), URLQueryItem(name: "to", value: toDate)]
        default:
            return nil
        }
    }
}
