//
//  LoopViewModel.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import Foundation

@Observable class LoopViewModel {
    var week: LoopWeek

    init() {
        week = LoopWeek(
            days: Weekday.allCases.map {
                LoopDay(
                    weekday: $0,
                    timeStatus: .future,
                    taskViewModel: TaskViewModel()
                )
            }
        )
    }
}

extension LoopDay {
    var isSuccessful: Bool { resultStatus == .success }
    var isFailed: Bool { resultStatus == .fail }
    var isNeutral: Bool { resultStatus == .none }
    var isPast: Bool { timeStatus == .past }
    var isToday: Bool { timeStatus == .today }
    var isFuture: Bool { timeStatus == .future }
}
