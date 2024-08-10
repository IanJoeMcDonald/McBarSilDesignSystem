//
//  HeightCalculator.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 03/12/24.
//

import SwiftUI

struct HeightCalculator: ViewModifier {

    @Binding var height: Double

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            height = proxy.size.height
                        }
                }
            )
    }
}

extension View {
    func saveHeight(in size: Binding<Double>) -> some View {
        modifier(HeightCalculator(height: size))
    }
}
