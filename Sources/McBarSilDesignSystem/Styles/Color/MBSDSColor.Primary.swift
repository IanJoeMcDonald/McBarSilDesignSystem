//
//  MBSDSColor.Primary.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSColor {

    public enum Primary: Colorable {

        case base
        case extended(Extended)

        public var color: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryBase),
                    dark: Color(hex: Manager.shared.darkMode.primaryBase)
                )
            case let .extended(extended): Self.getExtendedColor(for: extended)
            }
        }

        public var inverseColor: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.primaryBaseInverse)
                )
            case let .extended(extended): Self.getExtendedInverseColor(for: extended)
            }
        }

        private static func getExtendedColor(for level: Extended) -> Color {
            switch level {
            case .level00:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended00),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended00)
                )
            case .level10:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended10),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended10)
                )
            case .level20:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended20),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended20)
                )
            case .level30:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended30),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended30)
                )
            case .level40:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended40),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended40)
                )
            case .level50:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended50),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended50)
                )
            case .level60:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended60),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended60)
                )
            case .level70:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended70),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended70)
                )
            case .level80:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended80),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended80)
                )
            case .level90:
                Color(
                    light: Color(hex: Manager.shared.lightMode.primaryExtended90),
                    dark: Color(hex: Manager.shared.darkMode.primaryExtended90)
                )
            }
        }

        private static func getExtendedInverseColor(for level: Extended) -> Color {
            getExtendedColor(for: level)
        }
    }
}
