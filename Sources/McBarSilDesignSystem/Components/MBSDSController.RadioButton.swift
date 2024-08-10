//
//  MBSDSController.RadioButton.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

public enum MBSDSController { }

extension MBSDSController {

    public struct RadioButton: View {

        // MARK: Initializers
        public init(
            items: [String],
            size: MBSDSSize,
            spacing: MBSDSSpacing = .zero,
            isInverse: Bool = false,
            onSelectAction: @escaping (String) -> Void
        ) {
            self.items = items
            self.size = size
            self.spacing = spacing
            self.isInverse = isInverse
            self.onSelectAction = onSelectAction
        }

        // MARK: State
        @State private var isSelected: String? = nil

        // MARK: Variables
        public var items: [String]
        public var size: MBSDSSize
        public var spacing: MBSDSSpacing
        public var isInverse: Bool
        public var onSelectAction: (String) -> Void

        // MARK: Body
        public var body: some View {
            VStack(spacing: spacing.rawValue) {
                ForEach(0 ..< items.count, id: \.self) {
                    MBSDSButton.Radio(
                        title: items[$0],
                        selection: $isSelected,
                        size: size,
                        isInverse: isInverse
                    )
                }
            }.onChange(of: isSelected) {
                guard let newValue = $0 else { return }
                onSelectAction(newValue)
            }
        }
    }
}
