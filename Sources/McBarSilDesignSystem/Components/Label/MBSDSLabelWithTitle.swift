//
//  MBSDSLabelWithTitle.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 23/10/25.
//

import SwiftUI

public struct MBSDSLabelWithTitle: View {
    
    // MARK: Initializers
    public init(
        text: LocalizedStringResource?,
        title: LocalizedStringResource,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: Alignment = .leading,
        numberOfLines: Int = 0,
        style: MBSDSBorder.Style = .primary,
        backgroundColor: MBSDSColor = .background(.base)
    ) {
        self.text = text
        self.title = title
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.style = style
        self.backgroundColor = backgroundColor.color
    }
    
    public init(
        verbatim: String,
        title: LocalizedStringResource,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: Alignment = .leading,
        numberOfLines: Int = 0,
        style: MBSDSBorder.Style = .primary,
        backgroundColor: MBSDSColor = .background(.base)
    ) {
        self.verbatimText = verbatim
        self.title = title
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.style = style
        self.backgroundColor = backgroundColor.color
    }
    
    public init(
        attributedText: AttributedString,
        title: LocalizedStringResource,
        font: MBSDSFont,
        onColor: MBSDSColor.OnColor,
        isInverse: Bool = false,
        textAlignment: Alignment = .leading,
        numberOfLines: Int = 0,
        style: MBSDSBorder.Style = .primary,
        backgroundColor: MBSDSColor = .background(.base)
    ) {
        self.attributedText = attributedText
        self.title = title
        self.font = font
        self.color = onColor
        self.isInverse = isInverse
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.style = style
        self.backgroundColor = backgroundColor.color
    }
    
    // MARK: Environment
    @Environment(\.isEnabled) var isEnabled
    
    // MARK: State
    @State private var height: Double = .zero
    private var isEmpty: Bool {
        if let text {
            String(localized: text).isEmpty
        } else if let verbatimText {
            verbatimText.isEmpty
        } else if let attributedText {
            attributedText.characters.isEmpty
        } else {
            true
        }
    }
    
    // MARK: Variables
    public var text: LocalizedStringResource?
    public var verbatimText: String?
    public var attributedText: AttributedString?
    public var title: LocalizedStringResource
    public var font: MBSDSFont
    public var color: MBSDSColor.OnColor
    public var isInverse: Bool
    public var textAlignment: Alignment
    public var numberOfLines: Int
    public var style: MBSDSBorder.Style
    private var backgroundColor: Color
    
    // MARK: Body
    public var body: some View {
        createTextObject()
            .frame(maxWidth: .infinity, alignment: textAlignment)
            .font(font.font)
            .foregroundStyle(generateForegroundColor())
            .lineLimit(numberOfLines == 0 ? nil : numberOfLines)
            .padding(.leading)
            .padding(.vertical)
            .saveHeight(in: $height)
            .background(
                MBSDSTextField.BorderWithTitle(
                    title: title,
                    isInverse: isInverse,
                    style: style,
                    backgroundColor: backgroundColor,
                    isEmpty: .constant(isEmpty),
                    height: $height)
            )
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
    MBSDSLabelWithTitle(verbatim: "My Label", title: "My Title", font: .heading(.lg), onColor: .emphasis(.high))
}
