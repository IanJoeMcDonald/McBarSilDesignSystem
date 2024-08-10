//
//  MBSDSController.RadioButton.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSController {

    public struct RadioButton: View {

        // MARK: Initializers
        public init(
            items: [RadioButtonItem],
            size: MBSDSSize,
            spacing: MBSDSSpacing = .zero,
            alignment: HorizontalAlignment = .leading,
            isInverse: Bool = false,
            onSelectAction: @escaping (RadioButtonItem) -> Void
        ) {
            self.items = items
            self.size = size
            self.spacing = spacing
            self.alignment = alignment
            self.isInverse = isInverse
            self.onSelectAction = onSelectAction
        }

        // MARK: State
        @State private var isSelected: (AnyEquatableRadioButtonItem)? = nil

        // MARK: Variables
        public var items: [RadioButtonItem]
        public var size: MBSDSSize
        public var spacing: MBSDSSpacing
        public var alignment: HorizontalAlignment
        public var isInverse: Bool
        public var onSelectAction: (RadioButtonItem) -> Void

        // MARK: Body
        public var body: some View {
            VStack(alignment: alignment, spacing: spacing.rawValue) {
                ForEach(0 ..< items.count, id: \.self) {
                    MBSDSButton.Radio(
                        item: items[$0],
                        selection: $isSelected,
                        size: size,
                        isInverse: isInverse
                    )
                }
            }.onChange(of: isSelected) {
                guard let newItem =  $0 else { return }
                guard let newValue = items.first(where: { $0.id == newItem.id }) else { return }
                onSelectAction(newValue)
            }
        }
    }
}
