//
//  CircularTaskProgressBar.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import SwiftUI

struct CircularTaskProgressBar: ToolbarContent {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            ZStack {
                if taskViewModel.isAllCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.black)
                        .background(
                            Circle()
                                .fill(.accent)
                                .frame(width: 32, height: 32)
                        )
                        .transition(.scale.combined(with: .opacity))
                } else {
                    Text(
                        "\(taskViewModel.completedCount)/\(taskViewModel.totalCount)"
                    )
                    .font(.custom("Satoshi Medium", size: 13))
                    .foregroundStyle(.secondary)
                }
                
                Circle()
                    .trim(from: taskViewModel.completionRate, to: 1)
                    .stroke(
                        Color.primary.opacity(0.1),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(
                        .easeInOut(duration: 0.25),
                        value: taskViewModel.completionRate
                    )
                
                Circle()
                    .trim(from: 0, to: taskViewModel.completionRate)
                    .stroke(
                        .accent,
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(
                        .easeInOut(duration: 0.25),
                        value: taskViewModel.completionRate
                    )
            }
            .animation(
                .spring(response: 0.5, dampingFraction: 0.75),
                value: taskViewModel.isAllCompleted
            )
            .frame(width: 40, height: 40)
            .padding(4)
        }
    }
}

#Preview {
    DayView()
        .environmentObject(TaskViewModel(useMock: true))
}
