//
//  LoopView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import SwiftUI

struct LoopView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel

    var body: some View {
        NavigationStack {
            NavigationLink {
                DayView()
            } label: {
                Text("Go to Day View")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Loop")
                        .font(.custom("HostGrotesk-Bold", size: 36))
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
    }
}

#Preview {
    LoopView()
        .environmentObject(TaskViewModel())
}
