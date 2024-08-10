//
//  MBSDSColor.Background.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSColor {

    public enum Background: Colorable {

        case base

        public var color: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.backgroundBase),
                    dark: Color(hex: Manager.shared.darkMode.backgroundBase)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.backgroundBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.backgroundBaseInverse)
                )
            }
        }
    }
}
