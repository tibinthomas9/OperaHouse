//
//  ImageEndPoint.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

enum ImageEndPoint: URLEndpoint {
    case artist(name: String)
    case venue(name: String)
}

extension ImageEndPoint {

    var scheme: String { return "https" }

    var host: String { return "songleap.s3.amazonaws.com" }

    var path: String {
        switch self {
        case .artist(let name):
            return "/artists/\(name).png"
        case .venue(let name):
            return "/venues/\(name).png"
        }
    }
}
