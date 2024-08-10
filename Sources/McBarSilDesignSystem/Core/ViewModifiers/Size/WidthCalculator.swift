//
//  WidthCalculator.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

struct WidthCalculator: ViewModifier {

    @Binding var width: Double

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            width = proxy.size.height
                        }
                }
            )
    }
}

extension View {
    func saveWidth(in size: Binding<Double>) -> some View {
        modifier(WidthCalculator(width: size))
    }
}
