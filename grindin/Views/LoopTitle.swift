//
//  LoopTitle.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 4.01.2026.
//

import SwiftUI

struct LoopTitle: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Text("Loop")
                .font(.custom("ZalandoSansExpanded-SemiBold", size: 32))
        }
        .sharedBackgroundVisibility(.hidden)
    }
}

#Preview {
    LoopView()
        .environment(LoopViewModel())
}
