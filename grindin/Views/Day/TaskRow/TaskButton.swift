//
//  TaskButton.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct TaskButton: View {
    @Bindable var taskViewModel: TaskViewModel
    let task: TaskModel
    
    var body: some View {
        Button { taskViewModel.toggleCompletion(for: task) } label: {
            Image(systemName: task.isCompleted ?
                  "checkmark.circle.fill" : "circle"
            )
            .font(.system(size: 22, weight: .semibold))
            .foregroundStyle(task.isCompleted ? .black : .primary)
            .contentTransition(.symbolEffect(.replace))
            .animation(.easeInOut(duration: 0.25), value: task.isCompleted)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DayView(taskViewModel: TaskViewModel(useMock: true))
}
