//
//  Weekday.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import Foundation

enum Weekday: String, CaseIterable, Identifiable {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"

    var id: String { rawValue }
}
