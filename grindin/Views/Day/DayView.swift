//
//  DayView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct DayView: View {
    @Bindable var taskViewModel: TaskViewModel
    @Namespace private var transition
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(taskViewModel.tasks) { task in
                    Button { taskViewModel.didTaskTap(task) } label: {
                        HStack(spacing: 12) {
                            TaskButton(taskViewModel: taskViewModel, task: task)
                            TaskTitle(task: task, transition: transition)
                        }
                    }
                    .listRowBackground(TaskBackground(task: task))
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $taskViewModel.addSheetPresented) {
                AddTaskSheet(taskViewModel: taskViewModel, transition: transition)
            }
            .sheet(item: $taskViewModel.selectedTask) { task in
                EditTaskSheet(taskViewModel: taskViewModel, task: task, transition: transition)
            }
            .toolbar {
                DayTitle()
                AddTaskButton(taskViewModel: taskViewModel, transition: transition)
                ToolbarSpacer(placement: .bottomBar)
                CircularTaskProgressBar(taskViewModel: taskViewModel)
            }
        }
    }
}

#Preview {
    DayView(taskViewModel: TaskViewModel(useMock: true))
}
