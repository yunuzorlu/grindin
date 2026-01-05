//
//  LoopRow.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 5.01.2026.
//

import SwiftUI

struct LoopRow: View {
    let day: LoopDay

    var body: some View {
        NavigationLink {
            DayView(taskViewModel: day.taskViewModel)
        } label: {
            HStack(spacing: 12) {
                Capsule()
                    .fill(day.isSuccessful ? .accent : .subtle)
                    .frame(width: 4, height: 48)

                VStack(alignment: .leading) {
                    Text(day.weekday.rawValue)
                        .font(.custom("HostGrotesk-Medium", size: 20))
                    Text("27/11")
                        .font(.custom("Satoshi Medium", size: 16))
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(
                    "\(day.taskViewModel.completedCount)/\(day.taskViewModel.totalCount)"
                )
                .font(.custom("Satoshi Regular", size: 16))
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    LoopView()
        .environment(LoopViewModel())
}
