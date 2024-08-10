//
//  MBSDSViewWithTitle.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 27/10/25.
//

import SwiftUI

public struct MBSDSViewWithTitle<Content: View>: View {
    
    // MARK: Initializers
    public init(
        title: LocalizedStringResource,
        isInverse: Bool = false,
        style: MBSDSBorder.Style = .primary,
        backgroundColor: MBSDSColor = .background(.base),
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
        self.isInverse = isInverse
        self.style = style
        self.backgroundColor = backgroundColor.color
    }
    
    // MARK: Environment
    @Environment(\.isEnabled) var isEnabled
    
    // MARK: State
    @State private var height: Double = .zero
    
    // MARK: Variables
    public var title: LocalizedStringResource
    public var content: Content
    public var isInverse: Bool
    public var style: MBSDSBorder.Style
    private var backgroundColor: Color
    
    // MARK: Body
    public var body: some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.vertical)
            .saveHeight(in: $height)
            .background(
                MBSDSTextField.BorderWithTitle(
                    title: title,
                    isInverse: isInverse,
                    style: style,
                    backgroundColor: backgroundColor,
                    isEmpty: .constant(false),
                    height: $height)
            )
    }
}

#Preview {
    MBSDSViewWithTitle(title: "My Label") { Text("Hello World") }
}
