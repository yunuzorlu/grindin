//
//  LoopView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import SwiftUI

struct LoopView: View {
    @State private var loopViewModel = LoopViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Weekday.allCases) { day in
                    Text(day.rawValue)
                }
            }
            .listStyle(.plain)
            .toolbar {
                LoopTitle()
            }
        }
    }
}

#Preview {
    LoopView()
        .environment(LoopViewModel())
}
