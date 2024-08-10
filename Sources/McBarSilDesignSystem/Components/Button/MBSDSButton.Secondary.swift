//
//  MBSDSButton.Secondary.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

import SwiftUI

extension MBSDSButton {

    public struct Secondary: View {

        // MARK: Initializers
        public init(
            title: String? = nil,
            style: MBSDSBorder.Style,
            leftIcon: Image? = nil,
            rightIcon: Image? = nil,
            isInverse: Bool = false,
            action: @escaping () -> Void
        ) {
            self.title = title ?? ""
            self.leftIcon = leftIcon
            self.rightIcon = rightIcon
            self.action = action
            self.style = style
            self.isInverse = isInverse
        }

        // MARK: State
        @Environment(\.isEnabled) private var isEnabled

        // MARK: Variables
        public var title: String
        public var leftIcon: Image?
        public var rightIcon: Image?
        public var action: () -> Void
        public var style: MBSDSBorder.Style
        public var isInverse: Bool

        // MARK: Body
        public var body: some View {
            Button(action: action) {
                HStack {
                    if let leftIcon { leftIcon }
                    Text(title)
                    if let rightIcon { rightIcon }
                }
            }
            .padding(.horizontal, MBSDSSpacing.sm.rawValue)
            .padding(.vertical, MBSDSSpacing.xs.rawValue)
            .foregroundColor(generateForegroundColor())
            .overlay(
                RoundedRectangle(cornerRadius: MBSDSBorder.Radius.md.rawValue)
                    .stroke(generateStrokeColor(), lineWidth: MBSDSBorder.Stroke.medium.rawValue)
            )
        }

        private func generateForegroundColor() -> Color {
            let emphasis: MBSDSColor.OnColor.Emphasis = if self.isEnabled { .high } else { .disabled }
            
            let styleColor: MBSDSColor.OnColor = switch style {
            case .primary: .emphasis(emphasis)
            case .neutral: .emphasis(emphasis)
            }
            
            return if isInverse {
                styleColor.inverseColor
            } else {
                styleColor.color
            }
        }

        private func generateStrokeColor() -> Color {
            switch style {
            case .primary: generatePrimaryStrokeColor()
            case .neutral: generateNeutralStrokeColor()
            }
        }

        private func generatePrimaryStrokeColor() -> Color {
            if isEnabled {
                if isInverse {
                    MBSDSColor.action(.secondary(.enabled)).inverseColor
                } else {
                    MBSDSColor.action(.secondary(.enabled)).color
                }
            } else {
                if isInverse {
                    MBSDSColor.action(.secondary(.enabled)).color
                } else {
                    MBSDSColor.action(.secondary(.enabled)).inverseColor
                }
            }
        }

        private func generateNeutralStrokeColor() -> Color {
            if isEnabled {
                if isInverse {
                    MBSDSColor.action(.neutral(.enabled)).color
                } else {
                    MBSDSColor.action(.neutral(.enabled)).inverseColor
                }
            } else {
                if isInverse {
                    MBSDSColor.action(.disabled).inverseColor
                } else {
                    MBSDSColor.action(.disabled).color
                }
            }
        }
    }
}

#Preview {
    MBSDSButton.Secondary(title: "Button", style: .primary, action: { print("Hello World") })
}
