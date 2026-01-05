//
//  TaskTitle.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct TaskTitle: View {
    let task: TaskModel
    let transition: Namespace.ID

    var body: some View {
        Text(task.title)
            .font(.custom("Satoshi Medium", size: 20))
            .foregroundStyle(task.isCompleted ? .black : .primary)
            .lineLimit(1)
            .animation(.easeInOut(duration: 0.25), value: task.isCompleted)
            .matchedTransitionSource(id: task.id, in: transition)
    }
}

#Preview {
    DayView(taskViewModel: TaskViewModel(useMock: true))
}
