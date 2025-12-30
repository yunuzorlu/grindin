//
//  AddTaskButton.swift
//  grindin
//
//  Created by Yunus Emre Zorlu on 30.12.2025.
//

import SwiftUI

struct AddTaskButton: View {
    @Binding var isSheetVisible: Bool

    var body: some View {
        Button {
            isSheetVisible.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 100)
                .fill(.accent)
                .frame(height: 48)
                .overlay {
                    HStack {
                        Image(systemName: "plus")
                            .font(.system(size: 14, weight: .semibold))

                        Text("Add Task")
                            .font(.custom("HostGrotesk-SemiBold", size: 20))
                    }
                    .foregroundStyle(.black)
                }
        }
        .buttonStyle(.plain)
    }
}
