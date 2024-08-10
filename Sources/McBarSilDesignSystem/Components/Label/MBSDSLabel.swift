//
//  MBSDSLabel.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

import SwiftUI

public struct MBSDSLabel: View {

    // MARK: Initializers
    public init(
        text: String?,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: TextAlignment = .leading,
        numberOfLines: Int = 0
    ) {
        self.text = text ?? ""
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }

    // MARK: State
    @Environment(\.isEnabled) var isEnabled

    // MARK: Variables
    public var text: String
    public var font: MBSDSFont
    public var color: MBSDSColor.OnColor
    public var isInverse: Bool
    public var textAlignment: TextAlignment
    public var numberOfLines: Int

    // MARK: Body
    public var body: some View {
        Text(text)
            .font(font.font)
            .foregroundStyle(generateForegroundColor())
            .lineLimit(numberOfLines == 0 ? nil : numberOfLines)
            .multilineTextAlignment(textAlignment)
        
    }

    // MARK: Custom Methods
    private func generateForegroundColor() -> Color {
        if isInverse {
            if isEnabled {
                color.inverseColor
            } else {
                MBSDSColor.onColor(.emphasis(.disabled)).inverseColor
            }
            
        } else {
            if isEnabled {
                color.color
            } else {
                MBSDSColor.onColor(.emphasis(.disabled)).color
            }
        }
    }
}

#Preview {
    MBSDSLabel(text: "My Label", font: .heading(.lg), onColor: .emphasis(.high))
}
