//
//  DateExtesions.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import Foundation

extension Date {

    func getApiPathFormat() -> String {
        self.string(format: "yyyy-MM-dd")
    }

    func getFullFormat() -> String {
        self.string(format: "d MMM yyyy, h:mm a")
    }

    func add(days: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: days, to: self)
    }

    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
