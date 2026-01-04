//
//  DayTitle.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct DayTitle: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Text(Date.now, format: .dateTime.weekday(.wide))
                .font(.custom("HostGrotesk-Bold", size: 36))
        }
        .sharedBackgroundVisibility(.hidden)
    }
}

#Preview {
    DayView()
        .environmentObject(TaskViewModel(useMock: true))
}
