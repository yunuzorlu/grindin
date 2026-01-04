import SwiftUI

extension Color {
    static var theme: Color {
        Color(UIColor { trait in
            trait.userInterfaceStyle == .dark ? .black : .white
        })
    }
}


extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
