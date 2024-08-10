//
//  MBSDSImage.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

import SwiftUI

public struct MBSDSImage: View {

    // MARK: Initializers
    public init(
        image: Image,
        style: MBSDSBorder.Style,
        size: MBSDSSize,
        showBorder: Bool = false,
        isRound: Bool = false,
        alignment: Alignment = .center,
        isInverse: Bool = false
    ) {
        self.image = image
        self.style = style
        self.size = size
        self.showBorder = showBorder
        self.alignment = alignment
        self.isRound = isRound
        self.isInverse = isInverse
    }

    // MARK: Enum
    enum ClipShapeType: Shape {
        case circle
        case square

        func path(in rect: CGRect) -> Path {
            switch self {
            case .circle: Circle().path(in: rect)
            case .square: Rectangle().path(in: rect)
            }
        }
    }

    // MARK: Variables
    var image: Image
    var style: MBSDSBorder.Style
    var size: MBSDSSize
    var showBorder: Bool
    var alignment: Alignment
    var isRound: Bool
    var isInverse: Bool

    // MARK: State
    @Environment(\.isEnabled) var isEnabled

    // MARK: Body
    public var body: some View {
        image
            .resizable()
            .frame(width: size.rawValue, height: size.rawValue, alignment: alignment)
            .scaledToFit()
            .clipShape(isRound ? ClipShapeType.circle : ClipShapeType.square)
            .overlay(generateOverlay())
    }

    // MARK: Custom Methods
    private func generateOverlay() -> some View {
        if isRound {
            ClipShapeType.circle.stroke(
                generateStrokeColor(),
                lineWidth: MBSDSBorder.Stroke.thin.rawValue
            )
        } else {
            ClipShapeType.square.stroke(
                generateStrokeColor(),
                lineWidth: MBSDSBorder.Stroke.thin.rawValue
            )
        }
    }

    private func generateStrokeColor() -> Color {
        switch style {
        case .primary: generatePrimaryStrokeColor()
        case .neutral: generateNeutralStrokeColor()
        }
    }

    private func generatePrimaryStrokeColor() -> Color {
        guard showBorder else { return .clear }
        
        if isEnabled {
            if isInverse {
                return MBSDSColor.action(.secondary(.enabled)).inverseColor
            } else {
                return MBSDSColor.action(.secondary(.enabled)).color
            }
        } else {
            if isInverse {
                return MBSDSColor.action(.secondary(.enabled)).color
            } else {
                return MBSDSColor.action(.secondary(.enabled)).inverseColor
            }
        }
    }

    private func generateNeutralStrokeColor() -> Color {
        guard showBorder else { return .clear }
        
        if isEnabled {
            if isInverse {
                return MBSDSColor.action(.neutral(.enabled)).color
            } else {
                return MBSDSColor.action(.neutral(.enabled)).inverseColor
            }
        } else {
            if isInverse {
                return MBSDSColor.action(.disabled).inverseColor
            } else {
                return MBSDSColor.action(.disabled).color
            }
        }
    }
}

#Preview {
    MBSDSImage(image: Image(systemName: "globe"), style: .neutral, size: .size48)
}
