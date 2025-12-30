//
//  EditTaskSheet.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 31.12.2025.
//

import SwiftUI

struct EditTaskSheet: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var editedTitle: String = ""
    let task: TaskModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Edit Task")
                .font(.custom("HostGrotesk-Bold", size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 24) {
                TextField("Task Title", text: $editedTitle)
                    .font(.custom("Satoshi Medium", size: 20))
                    .textFieldStyle(.plain)
                    .onAppear {
                        editedTitle = task.title
                    }
                    .onDisappear {
                        taskViewModel.updateTitle(
                            for: task,
                            newTitle: editedTitle
                        )
                    }
                HStack {
                    Button {
                        taskViewModel.selectedTask = nil
                    } label: {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.accent)
                            .frame(height: 48)
                            .overlay {
                                Text("Edit")
                                    .font(.custom("Satoshi Medium", size: 20))
                                    .foregroundStyle(.black)
                            }
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        taskViewModel.removeTask(task)
                        taskViewModel.selectedTask = nil
                    } label: {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.red)
                            .frame(height: 48)
                            .overlay {
                                Text("Delete")
                                    .font(.custom("Satoshi Medium", size: 20))
                                    .foregroundStyle(.black)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.horizontal, 24)
        .presentationDetents([.height(180)])
        .presentationBackground(Color.theme.opacity(0.25))
    }
}
