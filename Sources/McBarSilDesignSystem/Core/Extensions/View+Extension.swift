//
//  View+Extension.swift
//
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension View {

    /// Attach this to any Xcode Preview's view to have custom fonts displayed
    /// Note: Not needed for the actual app
    public func loadCustomFonts() -> some View {
        MBSDSFont.registerCustomFonts()
        return self
    }

    /// Allows an if statement to be used to apply an adjustment to a view.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
