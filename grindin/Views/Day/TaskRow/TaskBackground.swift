//
//  TaskBackground.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct TaskBackground: View {
    let task: Task
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .fill(.accent)
                    .frame(
                        width: task.isCompleted
                        ? proxy.size.width : 0
                    )
                    .animation(
                        .easeInOut(duration: 0.25),
                        value: task.isCompleted
                    )
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    DayView()
        .environment(TaskViewModel(useMock: true))
}
