//
//  MBSDSColor.Secondary.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/12/24.
//

import SwiftUI

extension MBSDSColor {
    
    public enum Secondary: Colorable {

        case base

        public var color: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.secondaryBase),
                    dark: Color(hex: Manager.shared.darkMode.secondaryBase)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .base:
                Color(
                    light: Color(hex: Manager.shared.lightMode.secondaryBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.secondaryBaseInverse)
                )
            }
        }
    }
}
