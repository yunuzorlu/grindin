//
//  AddTaskButton.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

struct AddTaskButton: ToolbarContent {
    @State private var taskViewModel = TaskViewModel()
    let transition: Namespace.ID

    var body: some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            Button { taskViewModel.didAddTap() } label: {
                Capsule()
                    .fill(.accent)
                    .frame(height: 48)
                    .overlay {
                        HStack {
                            Image(systemName: "plus")
                                .font(.system(size: 14, weight: .bold))
                            
                            Text("Add Task")
                                .font(.custom("HostGrotesk-SemiBold", size: 20))
                        }
                        .foregroundStyle(.black)
                    }
            }
            .buttonStyle(.plain)
            .matchedTransitionSource(id: "addTask", in: transition)
        }
    }
}

#Preview {
    DayView()
        .environment(TaskViewModel(useMock: true))
}
