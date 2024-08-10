//
//  MBSDSColor.Status.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSColor {

    public enum Status: Colorable {

        case success
        case warning
        case error
        case informative

        public var color: Color {
            switch self {
            case .success:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusSuccessBase),
                    dark: Color(hex: Manager.shared.darkMode.statusSuccessBase)
                )
            case .warning:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusWarningBase),
                    dark: Color(hex: Manager.shared.darkMode.statusWarningBase)
                )
            case .error:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusErrorBase),
                    dark: Color(hex: Manager.shared.darkMode.statusErrorBase)
                )
            case .informative:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusInformativeBase),
                    dark: Color(hex: Manager.shared.darkMode.statusInformativeBase)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .success:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusSuccessBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.statusSuccessBaseInverse)
                )
            case .warning:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusWarningBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.statusWarningBaseInverse)
                )
            case .error:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusErrorBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.statusErrorBaseInverse)
                )
            case .informative:
                Color(
                    light: Color(hex: Manager.shared.lightMode.statusInformativeBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.statusInformativeBaseInverse)
                )
            }
        }
    }
}
