//
//  PreviewData.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import Foundation
import SwiftUI

class PreviewData {

    static func loadColors() {
        let theme = MBSDSColor.Theme.violet
        MBSDSColor.Manager.shared.loadColors(
            lightMode: theme.lightModeFilename,
            darkMode: theme.darkModeFilename
        )
    }

    static func colorLoadedView(_ view: some View) -> some View {
        view
            .onAppear {
                PreviewData.loadColors()
            }
    }
}
