//
//  MBSDSColor.OnColor.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 28/11/24.
//

import SwiftUI

extension MBSDSColor {

    public enum OnColor: Colorable {

        case emphasis(Emphasis)
        case indicator(Indicator)
        
        public var color: Color {
            switch self {
            case let .emphasis(emphasis): emphasis.color
            case let .indicator(indicator): indicator.color
            }
        }

        public var inverseColor: Color {
            switch self {
            case let .emphasis(emphasis): emphasis.inverseColor
            case let .indicator(indicator): indicator.inverseColor
            }
        }
    }
}

extension MBSDSColor.OnColor {

    public enum Emphasis: Colorable {

        case high
        case medium
        case low
        case disabled

        public var color: Color {
            switch self {
            case .high:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisHigh),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisHigh)
                )
            case .medium:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisMedium),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisMedium)
                )
            case .low:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisLow),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisLow)
                )
            case .disabled:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisDisabled),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisDisabled)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .high:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisHighInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisHighInverse)
                )
            case .medium:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisMediumInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisMediumInverse)
                )
            case .low:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisLowInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisLowInverse)
                )
            case .disabled:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorEmphasisDisabledInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorEmphasisDisabledInverse)
                )
            }
        }
    }
}

extension MBSDSColor.OnColor {

    public enum Indicator: Colorable {

        case highlight
        case positive
        case negative

        public var color: Color {
            switch self {
            case .highlight:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorHighlightBase),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorHighlightBase)
                )
            case .positive:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorPositiveBase),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorPositiveBase)
                )
            case .negative:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorNegativeBase),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorNegativeBase)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case .highlight:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorHighlightBaseInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorHighlightBaseInverse)
                )
            case .positive:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorPositiveBaseInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorPositiveBaseInverse)
                )
            case .negative:
                Color(
                    light: Color(hex: MBSDSColor.Manager.shared.lightMode.onColorIndicatorNegativeBaseInverse),
                    dark: Color(hex: MBSDSColor.Manager.shared.darkMode.onColorIndicatorNegativeBaseInverse)
                )
            }
        }
    }
}
