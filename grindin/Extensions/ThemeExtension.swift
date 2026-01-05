import SwiftUI

extension Color {
    static var theme: Color {
        Color(UIColor { trait in
            trait.userInterfaceStyle == .dark ? .black : .white
        })
    }
}

extension Color {
    static var subtle: Color {
        .primary.opacity(0.25)
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
