//
//  MBSDSLabel.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

public struct MBSDSLabel: View {

    // MARK: Initializers
    public init(
        text: LocalizedStringResource?,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: TextAlignment = .leading,
        numberOfLines: Int = 0
    ) {
        self.text = text
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }

    public init(
        verbatim: String,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: TextAlignment = .leading,
        numberOfLines: Int = 0
    ) {
        self.verbatimText = verbatim
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    public init(
        attributedText: AttributedString,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: TextAlignment = .leading,
        numberOfLines: Int = 0
    ) {
        self.attributedText = attributedText
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }

    // MARK: State
    @Environment(\.isEnabled) var isEnabled

    // MARK: Variables
    public var text: LocalizedStringResource?
    public var verbatimText: String?
    public var attributedText: AttributedString?
    public var font: MBSDSFont
    public var color: MBSDSColor.OnColor
    public var isInverse: Bool
    public var textAlignment: TextAlignment
    public var numberOfLines: Int

    // MARK: Body
    public var body: some View {
        createTextObject()
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

    private func createTextObject() -> Text {
        if let text {
            return Text(text)
        }

        if let verbatimText {
            return Text(verbatim: verbatimText)
        }
        
        if let attributedText {
            return Text(attributedText)
        }
        
        return Text("")
    }
}

#Preview {
    MBSDSLabel(verbatim: "My Label", font: .heading(.lg), onColor: .emphasis(.high))
}
