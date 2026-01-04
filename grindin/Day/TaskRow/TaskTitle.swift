//
//  TaskTitle.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct TaskTitle: View {
    @State private var taskViewModel = TaskViewModel()
    let task: Task
    let transition: Namespace.ID

    @State private var progress: CGFloat = 0

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
    DayView()
        .environment(TaskViewModel(useMock: true))
}
