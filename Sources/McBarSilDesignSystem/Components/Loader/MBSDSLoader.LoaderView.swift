//
//  MBSDSLoader.LoaderView.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

public extension MBSDSLoader {

    struct LoaderView: View, Animatable {

        var width: CGFloat
        var height: CGFloat

        public init(width: CGFloat, height: CGFloat) {
            self.width = width
            self.height = height
        }

        public var body: some View {

            ActivityIndicator(isAnimating: .constant(true), style: .large)
                .frame(width: width, height: height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
        }
    }
}

extension MBSDSLoader {

    struct ActivityIndicator: UIViewRepresentable {
        @Binding var isAnimating: Bool
        let style: UIActivityIndicatorView.Style

        func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style: style)
        }

        func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
            isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        }
    }
}

