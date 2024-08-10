//
//  MBSDSColor.Action.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSColor {

    public enum Action: Colorable {

        case primary(ActionTypes)
        case secondary(ActionTypes)
        case neutral(ActionTypes)
        case disabled

        public var color: Color {
            switch self {
            case let .primary(action): Self.getPrimaryActionColor(for: action)
            case let .secondary(action): Self.getSecondaryActionColor(for: action)
            case let .neutral(action): Self.getNeutralActionColor(for: action)
            case .disabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionDisabledBase),
                    dark: Color(hex: Manager.shared.darkMode.actionDisabledBase)
                )
            }
        }

        public var inverseColor: Color {
            switch self {
            case let .primary(action): Self.getPrimaryActionInverseColor(for: action)
            case let .secondary(action): Self.getSecondaryActionInverseColor(for: action)
            case let .neutral(action): Self.getNeutralActionInverseColor(for: action)
            case .disabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionDisabledBaseInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionDisabledBaseInverse)
                )
            }
        }

        private static func getPrimaryActionColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryEnabled),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryEnabled)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryHover),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryHover)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryFocus),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryFocus)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryPressed),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryPressed)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimarySelected),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimarySelected)
                )
            }
        }

        private static func getPrimaryActionInverseColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryEnabledInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryEnabledInverse)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryHoverInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryHoverInverse)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryFocusInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryFocusInverse)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimaryPressedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimaryPressedInverse)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionPrimarySelectedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionPrimarySelectedInverse)
                )
            }
        }

        private static func getSecondaryActionColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryEnabled),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryEnabled)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryHover),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryHover)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryFocus),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryFocus)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryPressed),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryPressed)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondarySelected),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondarySelected)
                )
            }
        }

        private static func getSecondaryActionInverseColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryEnabledInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryEnabledInverse)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryHoverInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryHoverInverse)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryFocusInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryFocusInverse)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondaryPressedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondaryPressedInverse)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionSecondarySelectedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionSecondarySelectedInverse)
                )
            }
        }

        private static func getNeutralActionColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralEnabled),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralEnabled)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralHover),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralHover)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralFocus),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralFocus)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralPressed),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralPressed)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralSelected),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralSelected)
                )
            }
        }

        private static func getNeutralActionInverseColor(for action: ActionTypes) -> Color {
            switch action {
            case .enabled:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralEnabledInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralEnabledInverse)
                )
            case .hover:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralHoverInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralHoverInverse)
                )
            case .focus:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralFocusInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralFocusInverse)
                )
            case .pressed:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralPressedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralPressedInverse)
                )
            case .selected:
                Color(
                    light: Color(hex: Manager.shared.lightMode.actionNeutralSelectedInverse),
                    dark: Color(hex: Manager.shared.darkMode.actionNeutralSelectedInverse)
                )
            }
        }
    }
}

extension MBSDSColor.Action {

    public enum ActionTypes {
            
        case enabled
        case hover
        case focus
        case pressed
        case selected
    }
}
