//
//  MBSDSButton.Link.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 09/12/24.
//

import SwiftUI

extension MBSDSButton {

    public struct Link: View {

        // MARK: Initializers
        public init(
            title: String? = nil,
            onColor: MBSDSColor.OnColor = .emphasis(.high),
            isUnderlined: Bool = true,
            leftIcon: Image? = nil,
            rightIcon: Image? = Image(systemName: "chevron.right"),
            isInverse: Bool = false,
            action: @escaping () -> Void
        ) {
            self.title = title ?? ""
            self.onColor = onColor
            self.isUnderlined = isUnderlined
            self.leftIcon = leftIcon
            self.rightIcon = rightIcon
            self.action = action
            self.isInverse = isInverse
        }

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: Variables
        public var title: String
        public var onColor: MBSDSColor.OnColor
        public var isUnderlined: Bool
        public var leftIcon: Image?
        public var rightIcon: Image?
        public var action: () -> Void
        public var isInverse: Bool

        // MARK: Body
        public var body: some View {
            Button(action: {
                action()
            }
            ) {
                HStack {
                    if let leftIcon { leftIcon }
                    Text(title)
                        .font(MBSDSFont.body(.lg).font)
                        .if(isUnderlined) {
                            $0.underline()
                        }
                    if let rightIcon { rightIcon }
                }
            }
            .foregroundColor(generateForegroundColor())
        }

        // MARK: Private Custom Methods
        private func generateForegroundColor() -> Color {
            return if isInverse {
                onColor.inverseColor
            } else {
                onColor.color
            }
        }
    }
}

// MARK: Preview
#Preview {
    MBSDSButton.Link(title: "Button", action: { print("Hello World") })
}
