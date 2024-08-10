//
//  MBSDSButton.Secondary.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSButton {

    public struct Secondary: View {

        // MARK: Initializers
        public init(
            title: LocalizedStringResource? = nil,
            style: MBSDSBorder.Style,
            size: MBSDSButton.Size = .large,
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
            self.size = size
            self.isInverse = isInverse
        }

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: Variables
        public var title: LocalizedStringResource
        public var leftIcon: Image?
        public var rightIcon: Image?
        public var action: () -> Void
        public var style: MBSDSBorder.Style
        public var size: MBSDSButton.Size
        public var isInverse: Bool

        // MARK: Body
        public var body: some View {
            Button(action: action) {
                HStack {
                    if let leftIcon { leftIcon }
                    Text(title)
                    if let rightIcon { rightIcon }
                }
                .if(size == .large) { $0.frame(maxWidth: .infinity) }
            }
            .padding(.horizontal, MBSDSSpacing.sm.rawValue)
            .padding(.vertical, MBSDSSpacing.xs.rawValue)

            .foregroundColor(generateForegroundColor())
            .overlay(
                RoundedRectangle(cornerRadius: MBSDSBorder.Radius.md.rawValue)
                    .stroke(generateStrokeColor(), lineWidth: MBSDSBorder.Stroke.medium.rawValue)
            )
        }

        // MARK: Private Custom Methods
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
