//
//  MBSDSButton.Radio.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSButton {

    public struct Radio: View {

        // MARK: Initializers
        public init(
            title: String? = nil,
            isSelected: Binding<Bool>,
            size: MBSDSSize,
            isInverse: Bool = false
        ) {
            self.title = title ?? ""
            self._isSelected = isSelected
            self.size = size
            self.isInverse = isInverse
        }

        public init(
            title: String? = nil,
            selection: Binding<String?>,
            size: MBSDSSize,
            isInverse: Bool = false
        ) {
            self.title = title ?? ""
            self._isSelected = Binding(
                get: { selection.wrappedValue == title },
                set: { _ in selection.wrappedValue = title }
            )
            self.size = size
            self.isInverse = isInverse
        }

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: State
        @Binding private var isSelected: Bool

        // MARK: Variables
        public var title: String
        public var size: MBSDSSize
        public var isInverse: Bool


        // MARK: Body
        public var body: some View {
            Group {
                if isSelected {
                    HStack(alignment: .center, spacing: MBSDSSpacing.sm.rawValue) {
                        ZStack {
                            Circle()
                                .fill(generateOutlineColor())
                                .frame(width: size.rawValue, height: size.rawValue)
                            Circle()
                                .fill(generateFillColor())
                                .frame(width: size.rawValue * 0.75, height: size.rawValue * 0.75)
                        }
                        MBSDSLabel(text: title, font: .body(.md), onColor: generateTextColor())
                    }
                } else {
                    HStack(alignment: .center, spacing: MBSDSSpacing.sm.rawValue) {
                            Circle()
                                .fill(generateOutlineColor())
                                .frame(width: size.rawValue, height: size.rawValue)
                        MBSDSLabel(text: title, font: .body(.md), onColor: generateTextColor(), isInverse: isInverse)
                    }
                    .onTapGesture {
                        isSelected = true
                    }
                }
            }
        }

        // MARK: Custom Methods
        private func generateOutlineColor() -> Color {
            if isInverse {
                if isEnabled {
                    MBSDSColor.action(.primary(.enabled)).inverseColor
                } else {
                    MBSDSColor.action(.disabled).inverseColor
                }
            } else {
                if isEnabled {
                    MBSDSColor.action(.primary(.enabled)).color
                } else {
                    MBSDSColor.action(.disabled).color
                }
            }
        }

        private func generateFillColor() -> Color {
            if isInverse {
                MBSDSColor.action(.secondary(.enabled)).inverseColor
            } else {
                MBSDSColor.action(.secondary(.enabled)).color
            }
        }

        private func generateTextColor() -> MBSDSColor.OnColor {
            if isEnabled {
                MBSDSColor.OnColor.emphasis(.high)
            } else {
                MBSDSColor.OnColor.emphasis(.disabled)
            }
        }
    }
}
