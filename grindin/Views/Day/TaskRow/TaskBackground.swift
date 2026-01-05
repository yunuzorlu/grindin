//
//  TaskBackground.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct TaskBackground: View {
    let task: TaskModel

    var body: some View {
        GeometryReader { proxy in
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
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    DayView(taskViewModel: TaskViewModel(useMock: true))
}
