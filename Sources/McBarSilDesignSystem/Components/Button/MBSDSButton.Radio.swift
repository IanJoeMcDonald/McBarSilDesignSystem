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
            item: MBSDSController.RadioButtonItem,
            selection: Binding<(AnyEquatableRadioButtonItem)?>,
            size: MBSDSSize,
            isInverse: Bool = false
        ) {
            self.item = item
            self.size = size
            self.isInverse = isInverse
            self._selection = selection
        }

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: State
        @Binding private var selection: (AnyEquatableRadioButtonItem)?

        // MARK: Variables
        public var item: MBSDSController.RadioButtonItem
        public var size: MBSDSSize
        public var isInverse: Bool
        private var isSelected: Bool { selection?.id == item.id }


        // MARK: Body
        public var body: some View {
            Group {
                if isSelected {
                    HStack(alignment: .center, spacing: MBSDSSpacing.sm.rawValue) {
                        MBSDSLabel(text: item.description, font: .body(.md), onColor: generateTextColor())
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(generateOutlineColor())
                                .frame(width: size.rawValue, height: size.rawValue)
                            Circle()
                                .fill(generateFillColor())
                                .frame(width: size.rawValue * 0.75, height: size.rawValue * 0.75)
                        }
                    }
                } else {
                    HStack(alignment: .center, spacing: MBSDSSpacing.sm.rawValue) {
                        MBSDSLabel(text: item.description, font: .body(.md), onColor: generateTextColor(), isInverse: isInverse)
                        Spacer()
                        Circle()
                            .fill(generateOutlineColor())
                            .frame(width: size.rawValue, height: size.rawValue)
                    }
                }
            }
            .onTapGesture {
                selection = AnyEquatableRadioButtonItem(item)
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
                MBSDSColor.neutral(.base).inverseColor
                //MBSDSColor.secondary(.base).inverseColor
            } else {
                MBSDSColor.neutral(.base).color
                //MBSDSColor.secondary(.base).color
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
