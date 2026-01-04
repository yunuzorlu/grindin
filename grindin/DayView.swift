//
//  DayView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 2.01.2026.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Namespace private var transition
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(taskViewModel.tasks) { task in
                    Button { taskViewModel.didTaskTap(task) } label: {
                        HStack(spacing: 12) {
                            TaskButton(task: task)
                            TaskTitle(task: task, transition: transition)
                        }
                    }
                    .listRowBackground(TaskBackground(task: task))
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $taskViewModel.addSheetPresented) {
                AddTaskSheet(transition: transition)
            }
            .sheet(item: $taskViewModel.selectedTask) { task in
                EditTaskSheet(task: task, transition: transition)
            }
            .toolbar {
                DayTitle()
                AddTaskButton(transition: transition)
                ToolbarSpacer(placement: .bottomBar)
                CircularTaskProgressBar()
            }
        }
    }
}

#Preview {
    DayView()
        .environmentObject(TaskViewModel(useMock: true))
}
