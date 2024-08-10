//
//  MBSDSColor.Special.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 28/11/24.
//

import SwiftUI

extension MBSDSColor {

    public enum Special: Colorable {

        case fixedWhite
        case fixedBlack
        case shimmerBase1
        case shimmerBase2

        public var color: Color {
            switch self {
            case .fixedWhite:
                Color(
                    light: Color(hex: Manager.shared.lightMode.specialFixedWhite),
                    dark: Color(hex: Manager.shared.darkMode.specialFixedWhite)
                )
            case .fixedBlack:
                Color(
                    light: Color(hex: Manager.shared.lightMode.specialFixedBlack),
                    dark: Color(hex: Manager.shared.darkMode.specialFixedBlack)
                )
            case .shimmerBase1:
                Color(
                    light: Color(hex: Manager.shared.lightMode.specialShimmerBase1),
                    dark: Color(hex: Manager.shared.darkMode.specialShimmerBase1)
                )
            case .shimmerBase2:
                Color(
                    light: Color(hex: Manager.shared.lightMode.specialShimmerBase2),
                    dark: Color(hex: Manager.shared.darkMode.specialShimmerBase2)
                )
            }
        }

        public var inverseColor: Color {
            color
        }
    }
}
