//
//  MBSDSLoader.Activity.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

public extension MBSDSLoader {

    struct Activity<V>: ViewModifier, Animatable where V: View {

        var isLoading: Bool
        var loaderView: V

        public init(isLoading: Bool, loaderView: V = LoaderView(width: 300, height: 200)) {
            self.isLoading = isLoading
            self.loaderView = loaderView
        }

        public var animatableData: Bool {
            get { isLoading }
            set { isLoading = newValue }
        }

        public func body(content: Content) -> some View {
            ZStack {
                if isLoading {
                    GeometryReader { geometry in
                        ZStack(alignment: .center) {
                            content
                                .disabled(self.isLoading)
                                .blur(radius: self.isLoading ? 3 : 0)
                            loaderView
                                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                        }
                    }
                } else {
                    content
                }
            }
        }
    }
}
