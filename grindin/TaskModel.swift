//
//  TaskModel.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
