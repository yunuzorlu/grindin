//
//  TaskViewModel.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import Foundation
import Combine
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var selectedTask: TaskModel? = nil
    @Published var taskTitle: String = ""
    
    static let mockTasks: [TaskModel] = [
        TaskModel(id: UUID(), title: "Write down your clear goals for today.", isCompleted: false),
        TaskModel(id: UUID(), title: "Focus for 25 minutes and finish one task.", isCompleted: false),
        TaskModel(id: UUID(), title: "Do at least 10 minutes of deep work.", isCompleted: false),
        TaskModel(id: UUID(), title: "Review the progress you made yesterday.", isCompleted: false),
        TaskModel(id: UUID(), title: "Start and complete the hardest task first.", isCompleted: false),
        TaskModel(id: UUID(), title: "Spend 15 minutes learning something new.", isCompleted: false),
        TaskModel(id: UUID(), title: "Take a short break to reset your mind.", isCompleted: false),
        TaskModel(id: UUID(), title: "Make a small but meaningful step forward.", isCompleted: false),
        TaskModel(id: UUID(), title: "Track and record what you worked on.", isCompleted: false),
        TaskModel(id: UUID(), title: "Complete one action that moves you closer to your goal.", isCompleted: false),
        TaskModel(id: UUID(), title: "Reflect briefly on what you achieved today.", isCompleted: false),
        TaskModel(id: UUID(), title: "Create a simple plan for tomorrow.", isCompleted: false)
    ]

    convenience init(useMock: Bool) {
        self.init()
        if useMock {
            self.tasks = Self.mockTasks
        }
    }

    func addTask() {
        let title = taskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !title.isEmpty else { return }
        let newTask = TaskModel(id: UUID(), title: title, isCompleted: false)
        tasks.append(newTask)
        taskTitle = ""
    }

    func toggleCompletion(for task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func removeTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }

    func updateTitle(for task: TaskModel, newTitle: String) {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = trimmed
        }
    }
}
