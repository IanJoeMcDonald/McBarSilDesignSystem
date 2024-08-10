//
//  MBSDSColor.Neutral.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSColor {

    public enum Neutral: Colorable {

        case base
        case extended(Extended)

        public var color: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralBase),
                    dark: Color(hex: Manager.shared.darkMode.neutralBase)
                )
            case let .extended(extended): Self.getExtendedColor(for: extended)
            }
        }

        public var inverseColor: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.neutralBaseInverse)
                )
            case let .extended(extended): Self.getExtendedInverseColor(for: extended)
            }
        }

        private static func getExtendedColor(for level: Extended) -> Color {
            switch level {
            case .level00:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended00),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended00)
                )
            case .level10:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended10),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended10)
                )
            case .level20:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended20),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended20)
                )
            case .level30:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended30),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended30)
                )
            case .level40:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended40),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended40)
                )
            case .level50:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended50),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended50)
                )
            case .level60:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended60),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended60)
                )
            case .level70:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended70),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended70)
                )
            case .level80:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended80),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended80)
                )
            case .level90:
                Color(
                    light: Color(hex: Manager.shared.lightMode.neutralExtended90),
                    dark: Color(hex: Manager.shared.darkMode.neutralExtended90)
                )
            }
        }

        private static func getExtendedInverseColor(for level: Extended) -> Color {
            getExtendedColor(for: level)
        }
    }
}
