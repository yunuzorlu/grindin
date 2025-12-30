//
//  AddTaskSheet.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

struct AddTaskSheet: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var isPresentingAddSheet = false

    var body: some View {
        VStack(spacing: 8) {
            Text("Add Task")
                .font(.custom("HostGrotesk-Bold", size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 24) {
                TextField(
                    "Enter your task here",
                    text: $taskViewModel.taskTitle
                )
                .font(.custom("Satoshi Medium", size: 20))
                .textFieldStyle(.plain)
                Button {
                    taskViewModel.addTask()
                    taskViewModel.taskTitle = ""
                    isPresentingAddSheet = false
                } label: {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(.accent)
                        .frame(height: 48)
                        .overlay {
                            Text("Add")
                                .font(.custom("Satoshi Medium", size: 20))
                                .foregroundStyle(.black)
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.horizontal, 24)
        .presentationDetents([.height(180)])
        .presentationBackground(Color.theme.opacity(0.25))
    }
}

#Preview {
    AddTaskSheet()
        .environmentObject(TaskViewModel())
}
