//
//  LoopModel.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 5.01.2026.
//

import Foundation

struct LoopDay: Identifiable {
    let id = UUID()
    let weekday: Weekday
    var resultStatus: LoopResultStatus {
        if taskViewModel.completedCount > 0 { return .success }
        if taskViewModel.totalCount == 0 { return .none }
        return .fail
    }
    var timeStatus: LoopTimeStatus
    var taskViewModel: TaskViewModel
}

enum LoopResultStatus {
    case none
    case success
    case fail
}

enum LoopTimeStatus {
    case past
    case today
    case future
}

struct LoopWeek {
    var days: [LoopDay]
}
