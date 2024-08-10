//
//  PreviewData.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 10/12/24.
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
