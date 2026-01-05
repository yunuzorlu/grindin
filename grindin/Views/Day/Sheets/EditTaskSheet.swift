//
//  EditTaskSheet.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 31.12.2025.
//

import SwiftUI

struct EditTaskSheet: View {
    @Bindable var taskViewModel: TaskViewModel
    @State private var editedTitle: String = ""
    let task: TaskModel
    let transition: Namespace.ID

    var body: some View {
        VStack(spacing: 8) {
            Text("Edit Task")
                .font(.custom("HostGrotesk-SemiBold", size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                TextField("Task Title", text: $editedTitle, axis: .vertical)
                    .font(.custom("Satoshi Medium", size: 20))
                    .textFieldStyle(.plain)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .onAppear {
                        editedTitle = task.title
                    }
                
                HStack(spacing: 16) {
                    Button {
                        taskViewModel.updateTitle(for: task, newTitle: editedTitle)
                        taskViewModel.selectedTask = nil
                    } label: {
                        Capsule()
                            .fill(.accent)
                            .frame(height: 48)
                            .overlay {
                                Text("Done")
                                    .font(.custom("HostGrotesk-SemiBold", size: 20))
                                    .foregroundStyle(.black)
                            }
                    }
                    
                    Button {
                        taskViewModel.removeTask(task)
                        taskViewModel.selectedTask = nil
                    } label: {
                        Capsule()
                            .fill(.red)
                            .frame(height: 48)
                            .overlay {
                                Text("Delete")
                                    .font(.custom("HostGrotesk-SemiBold", size: 20))
                                    .foregroundStyle(.black)
                            }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(EdgeInsets(top: 32, leading: 32, bottom: taskViewModel.adaptiveBottomPadding, trailing: 32))
        .presentationDetents([.height(234)])
        .presentationDragIndicator(.visible)
        .presentationSizing(.form)
        .presentationBackground(Color.theme)
        .navigationTransition(
            .zoom(sourceID: task.id, in: transition)
        )
    }
}

#Preview {
    DayView(taskViewModel: TaskViewModel(useMock: true))
}
