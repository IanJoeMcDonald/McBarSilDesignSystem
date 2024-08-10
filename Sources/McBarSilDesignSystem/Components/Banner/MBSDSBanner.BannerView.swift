//
//  MBSDSBanner.BannerView.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSBanner {

    public struct BannerView: ViewModifier {

        // MARK: Initializers
        public init(type: Binding<BannerType?>) {
            self._type = type
        }

        // MARK: Binding
        @Binding private var type: BannerType?

        // MARK: Body
        public func body(content: Content) -> some View {
            ZStack {
                content
                if let type {
                    VStack {
                        bannerContent(for: type)
                    }
                    .onAppear {
                        guard type.isAutoDismiss else { return }
                        DispatchQueue.main.asyncAfter(deadline: .now() + type.autoDismissTime) {
                            withAnimation {
                                self.type = nil
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            self.type = nil
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.horizontal)
                }
            }
        }

        private func bannerContent(for banner: BannerType) -> some View {
                HStack(spacing: 10) {
                    banner.image
                        .padding(5)
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.2), radius: 3.0, x: -3, y: 4)
                    Text(banner.message)
                        .foregroundStyle(.black)
                        .fontWeight(.light)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    if banner.isAutoDismiss {
                        Button {
                            withAnimation {
                                self.type = nil
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .shadow(color: .black.opacity(0.2), radius: 3.0, x: 3, y: 4)
                    }
                }

                .foregroundColor(.white)
                .padding(8)
                .padding(.trailing, 2)
                .padding(.vertical, 15)
                .background(banner.backgroundColor)
                .cornerRadius(10)
                .shadow(radius: 3.0, x: -2, y:2)
        }
    }
}

// MARK: Preview
#Preview {
    struct Preview: View {

        @State private var bannerType: MBSDSBanner.BannerType?

        var body: some View {

            VStack {
                Button("Show Error") {
                    self.bannerType = .error(message: "This is a Error banner\n\nWith multiline message", image: .noImage)
                }
                Button("Show Info") {
                    self.bannerType = .info(message: "This is a Info banner\n\nWith multiline message", image: .defaultImage)
                }
                Button("Show Success") {
                    self.bannerType = .success(message: "This is a Success banner\n\nWith multiline message", image: .defaultImage)
                }
                Button("Show Warning") {
                    self.bannerType = .warning(message: "This is a Warning banner\n\nWith multiline message and a very long distance to see how wide the message should be", image: .defaultImage)
                }
            }
            .modifier(MBSDSBanner.BannerView(type: $bannerType))
        }
    }

    return Preview()
}
