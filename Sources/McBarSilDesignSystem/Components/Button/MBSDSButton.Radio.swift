//
//  MBSDSButton.Radio.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 30/01/25.
//

import SwiftUI

extension MBSDSButton {

    public struct Radio: View {

        // MARK: Initializers
        public init(
            title: String? = nil,
            isSelected: Bool = false,
            size: MBSDSSize,
            isInverse: Bool = false,
            onSelectAction: @escaping (String) -> Void
        ) {
            self.title = title ?? ""
            self.buttonIsSelected = isSelected
            self.size = size
            self.isInverse = isInverse
            self.onSelectAction = onSelectAction
        }

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: State
        @State private var buttonIsSelected: Bool = false

        // MARK: Variables
        public var title: String
        public var isSelected: Bool {
            buttonIsSelected
        }
        public var size: MBSDSSize
        public var onSelectAction: (String) -> Void
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
                                .onTapGesture {
                                    buttonIsSelected = true
                                    self.onSelectAction(title)
                                }
                        MBSDSLabel(text: title, font: .body(.md), onColor: generateTextColor(), isInverse: isInverse)
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
