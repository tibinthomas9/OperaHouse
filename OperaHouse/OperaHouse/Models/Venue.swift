//
//  Venue.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 20/09/23.
//

import Foundation

struct Venue: Codable, Identifiable {
    let id: Int
    let name: String
    let sortId: Int
}

// MARK: Validators
extension Venue {
    func isValidId() -> Bool {
        return id >= 0
    }

    func isValidSortId() -> Bool {
        return sortId >= 0
    }

    func isValidName() -> Bool {
        return name.count >= 1
    }
}
