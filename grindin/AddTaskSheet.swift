//
//  AddTaskSheet.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

struct AddTaskSheet: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let transition: Namespace.ID

    var body: some View {
        VStack(spacing: 8) {
            Text("Add Task")
                .font(.custom("HostGrotesk-Bold", size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                TextField("Enter your task here", text: $taskViewModel.taskTitle, axis: .vertical)
                    .font(.custom("Satoshi Medium", size: 20))
                    .textFieldStyle(.plain)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                Button { taskViewModel.addTask() } label: {
                    Capsule()
                        .fill(.accent)
                        .frame(height: 48)
                        .overlay {
                            Text("Add")
                                .font(.custom("HostGrotesk-SemiBold", size: 20))
                                .foregroundStyle(.black)
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(EdgeInsets(top: 32, leading: 32, bottom: taskViewModel.adaptiveBottomPadding, trailing: 32))
        .presentationDetents([.height(220)])
        .presentationDragIndicator(.visible)
        .presentationSizing(.form)
        .presentationBackground(Color.theme)
        .navigationTransition(
            .zoom(sourceID: "addTask", in: transition)
        )
    }
}

#Preview {
    DayView()
        .environmentObject(TaskViewModel(useMock: true))
}
