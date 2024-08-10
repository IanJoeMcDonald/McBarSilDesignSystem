//
//  View+Extension.swift
//
//
//  Created by Ian McDonald on 01/08/24.
//

import SwiftUI

extension View {

    /// Attach this to any Xcode Preview's view to have custom fonts displayed
    /// Note: Not needed for the actual app
    public func loadCustomFonts() -> some View {
        MBSDSFont.registerCustomFonts()
        return self
    }
}
