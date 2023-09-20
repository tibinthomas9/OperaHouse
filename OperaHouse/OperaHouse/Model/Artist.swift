//
//  Artist.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 20/09/23.
//

import Foundation

struct Artist: Codable {
    let id: Int
    let genre: String
    let name: String
}

// MARK: Validators
extension Artist {
    func isValidId() -> Bool {
        return id >= 0
    }

    func isValidGenre() -> Bool {
        return genre.count >= 1
    }

    func isValidName() -> Bool {
        return name.count >= 1
    }
}
