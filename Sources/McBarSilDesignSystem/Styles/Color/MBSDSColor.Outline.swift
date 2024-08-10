//
//  MBSDSColor.Outline.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 28/11/24.
//

import SwiftUI

extension MBSDSColor {

    public enum Outline: Colorable {

        case base
        case focus

        public var color: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.outlineBase),
                    dark: Color(hex: Manager.shared.darkMode.outlineBase)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.outlineBaseFocus),
                    dark: Color(hex: Manager.shared.darkMode.outlineBaseFocus)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.outlineBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.outlineBaseInverse)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.outlineBaseFocusInverse),
                    dark: Color(hex: Manager.shared.darkMode.outlineBaseFocusInverse)
                )
            }
        }
    }
}
