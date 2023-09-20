//
//  MusicPerformance.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 20/09/23.
//

import Foundation

protocol MusicPerformance: Codable {
    var id: Int { get set }
    var date: String { get set }
}
