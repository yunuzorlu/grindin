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
    @Published var tasks: [Task] = []
    @Published var selectedTask: Task? = nil
    @Published var taskTitle: String = ""
    @Published var addSheetPresented = false
    
    static let mockTasks: [Task] = [
        Task(id: UUID(), title: "Write down your clear goals for today.", isCompleted: false),
        Task(id: UUID(), title: "Focus for 25 minutes and finish one task.", isCompleted: false),
        Task(id: UUID(), title: "Do at least 10 minutes of deep work.", isCompleted: false),
        Task(id: UUID(), title: "Review the progress you made yesterday.", isCompleted: false),
        Task(id: UUID(), title: "Start and complete the hardest task first.", isCompleted: false),
        Task(id: UUID(), title: "Spend 15 minutes learning something new.", isCompleted: false),
        Task(id: UUID(), title: "Take a short break to reset your mind.", isCompleted: false),
        Task(id: UUID(), title: "Make a small but meaningful step forward.", isCompleted: false),
        Task(id: UUID(), title: "Track and record what you worked on.", isCompleted: false),
        Task(id: UUID(), title: "Complete one action that moves you closer to your goal.", isCompleted: false),
        Task(id: UUID(), title: "Reflect briefly on what you achieved today.", isCompleted: false),
        Task(id: UUID(), title: "Create a simple plan for tomorrow.", isCompleted: false)
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
        let newTask = Task(id: UUID(), title: title, isCompleted: false)
        tasks.append(newTask)
        taskTitle = ""
        addSheetPresented = false
    }
    
    func toggleCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func updateTitle(for task: Task, newTitle: String) {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = trimmed
        }
    }
    
    func didTaskTap(_ task: Task) {
        guard selectedTask == nil else { return }
        addSheetPresented = false
        selectedTask = task
    }
    
    func didAddTap() {
        guard addSheetPresented == false else { return }
        selectedTask = nil
        addSheetPresented = true
    }
    
    var adaptiveBottomPadding: CGFloat {
        UIDevice.current.userInterfaceIdiom == .pad ? 32 : 0
    }
    
    var totalCount: Int {
        tasks.count
    }
    
    var completedCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    var completionRate: Double {
        guard totalCount > 0 else { return 0 }
        return Double(completedCount) / Double(totalCount)
    }
    
    var isAllCompleted: Bool {
        totalCount > 0 && completedCount == totalCount
    }
}
