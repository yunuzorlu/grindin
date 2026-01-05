//
//  TaskModel.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 5.01.2026.
//

import Foundation

struct TaskModel: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
