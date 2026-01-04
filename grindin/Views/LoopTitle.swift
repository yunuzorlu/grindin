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
                .font(.custom("HostGrotesk-Bold", size: 36))
        }
        .sharedBackgroundVisibility(.hidden)
    }
}

#Preview {
    LoopView()
        .environment(LoopViewModel())
}
