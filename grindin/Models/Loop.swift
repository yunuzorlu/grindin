//
//  Loop.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import Foundation

struct LoopDay: Identifiable {
    let id = UUID()
    let weekday: Weekday
    var resultStatus: LoopResultStatus
    var timeStatus: LoopTimeStatus
}

enum LoopResultStatus {
    case none
    case success
    case fail
}

enum LoopTimeStatus {
    case notStarted
    case inProgress
    case completed
}


