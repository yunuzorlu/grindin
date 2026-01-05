//
//  LoopView.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import SwiftUI

struct LoopView: View {
    @Environment(LoopViewModel.self) var loopViewModel
    @State var isExpanded: Bool = true

    var body: some View {
        NavigationStack {
            List {
//                Section(isExpanded: $isExpanded) {
                    ForEach(loopViewModel.week.days) { day in
                        LoopRow(day: day)
//                    }
//                } header: {
//                    HStack {
//                        Text("Week 1")
//                            .font(.custom("Satoshi-Bold", size: 20))
//                            .foregroundStyle(.blue)
//
//                        Spacer()
//
//                        Button {
//                            withAnimation { isExpanded.toggle() }
//                        } label: {
//                            Image(
//                                systemName: isExpanded
//                                    ? "chevron.up" : "chevron.down"
//                            )
//                            .font(.system(size: 16, weight: .bold))
//                        }
//                        .buttonStyle(.plain)
//                    }
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
