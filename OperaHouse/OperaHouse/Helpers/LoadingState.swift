//
//  LoadingState.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 21/09/23.
//

import Foundation

enum LoadingState: Equatable {
    case loading
    case error(Error)
    case empty
    case loaded

    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case (.loaded, .loaded):
            return true
        case (.error(let error1), .error(let error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}
