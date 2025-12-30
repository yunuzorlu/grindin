//
//  DayView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Namespace private var transition
    @State var isCompleted: Bool = false
    @State private var isSheetVisible: Bool = false

    var body: some View {
        NavigationStack {
            List(taskViewModel.tasks) { task in
                Button { taskViewModel.selectedTask = task } label: {
                    HStack(spacing: 12) {
                        Button {
                            taskViewModel.toggleCompletion(for: task)
                        } label: {
                            Image(
                                systemName: task.isCompleted
                                ? "checkmark.circle.fill" : "circle"
                            )
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(task.isCompleted ? .black : .primary)
                            .contentTransition(.symbolEffect(.replace))
                        }
                        .buttonStyle(.plain)
                        
                        Text(task.title)
                            .font(.custom("Satoshi Medium", size: 20))
                            .foregroundStyle(task.isCompleted ? .black : .primary)
                            .lineLimit(1)
                    }
                    
                    .listRowBackground(
                        GeometryReader { proxy in
                            ZStack {
                                Rectangle()
                                    .fill(Color.accentColor)
                                    .frame(
                                        width: task.isCompleted
                                        ? proxy.size.width : 0
                                    )
                                    .animation(
                                        .easeInOut(duration: 0.2),
                                        value: task.isCompleted
                                    )
                            }
                            .allowsHitTesting(false)
                        }
                    )
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $isSheetVisible) {
                AddTaskSheet()
                    .navigationTransition(
                        .zoom(sourceID: "addTask", in: transition)
                    )
            }
            .sheet(item: $taskViewModel.selectedTask) { task in
                EditTaskSheet(task: task)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Tuesday")
                        .font(.custom("HostGrotesk-Bold", size: 34))
                }
                .sharedBackgroundVisibility(.hidden)

                ToolbarItem(placement: .bottomBar) {
                    AddTaskButton(isSheetVisible: $isSheetVisible)
                        .matchedTransitionSource(
                            id: "addTask",
                            in: transition
                        )
                }

                ToolbarSpacer(placement: .bottomBar)

                // TODO: Add circular progress bar
            }
        }
    }
}

#Preview {
    DayView()
        .environmentObject(TaskViewModel(useMock: true))
}
