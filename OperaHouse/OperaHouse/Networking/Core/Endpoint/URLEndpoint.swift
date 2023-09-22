//
//  URLEndpoint.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 21/09/23.
//

import Foundation

protocol URLEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    func url() -> URL?
}

extension URLEndpoint {
    var scheme: String { return "http" }
    var host: String { return "ec2-44-211-66-223.compute-1.amazonaws.com" }
    var queryItems: [URLQueryItem]? {return nil}

    func url() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "\(path)"
        components.queryItems = queryItems
        return components.url
    }
}
