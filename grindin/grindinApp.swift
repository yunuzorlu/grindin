//
//  grindinApp.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

@main
struct grindinApp: App {
    @StateObject var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            DayView()
                .environmentObject(TaskViewModel())
        }
    }
}
