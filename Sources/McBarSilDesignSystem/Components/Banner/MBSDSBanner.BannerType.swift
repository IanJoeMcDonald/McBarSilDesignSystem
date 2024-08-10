//
//  MBSDSBanner.BannerType.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSBanner {

    public enum BannerType {

        case error(
            title: LocalizedStringResource? = nil,
            message: LocalizedStringResource,
            image: BannerImageType = .noImage,
            autoDismissTime: TimeInterval? = 5
        )
        case info(
            title: LocalizedStringResource? = nil,
            message: LocalizedStringResource,
            image: BannerImageType = .noImage,
            autoDismissTime: TimeInterval? = 5
        )
        case success(
            title: LocalizedStringResource? = nil,
            message: LocalizedStringResource,
            image: BannerImageType = .noImage,
            autoDismissTime: TimeInterval? = 5
        )
        case warning(
            title: LocalizedStringResource? = nil,
            message: LocalizedStringResource,
            image: BannerImageType = .noImage,
            autoDismissTime: TimeInterval? = 5
        )

        var backgroundColor: Color {
            switch self {
            case .error: MBSDSColor.status(.error).color
            case .info: MBSDSColor.status(.informative).color
            case .success: MBSDSColor.status(.success).color
            case .warning: MBSDSColor.status(.warning).color
            }
        }

        var image: some View {
            switch self {
            case let .error(_, _, image, _): Self.createView(for: image, type: self)
            case let .info(_, _, image, _): Self.createView(for: image, type: self)
            case let .success(_, _, image, _): Self.createView(for: image, type: self)
            case let .warning(_, _, image, _): Self.createView(for: image, type: self)
            }
        }

        var title: LocalizedStringResource {
            switch self {
            case let .error(title, _, _, _): title ?? LocalizedStringResource("Attention", bundle: .module)
            case let .info(title, _, _, _): title ?? LocalizedStringResource("Attention", bundle: .module)
            case let .success(title, _, _, _): title ?? LocalizedStringResource("Attention", bundle: .module)
            case let .warning(title, _, _, _): title ?? LocalizedStringResource("Attention", bundle: .module)
            }
        }

        var message: LocalizedStringResource {
            switch self {
            case let .error(_, message, _, _): message
            case let .info(_, message, _, _): message
            case let .success(_, message, _, _): message
            case let .warning(_, message, _, _): message
            }
        }

        var isAutoDismiss: Bool {
            switch self {
            case let .error(_, _, _, time): time != nil
            case let .info(_, _, _, time): time != nil
            case let .success(_, _, _, time): time != nil
            case let .warning(_, _, _, time): time != nil
            }
        }

        var autoDismissTime: TimeInterval {
            switch self {
            case let .error(_, _, _, time): time ?? 0
            case let .info(_, _, _, time): time ?? 0
            case let .success(_, _, _, time): time ?? 0
            case let .warning(_, _, _, time): time ?? 0
            }
        }

        // MARK: Private Static Methods
        @ViewBuilder
        private static func createView(for imageType: BannerImageType, type: Self) -> some View {
            switch imageType {
            case let .customImage(image): image
            case .defaultImage: Self.defaultSystemImage(for: type)
            case .noImage: Spacer().frame(width: 10, height: 20)
            }
        }

        @ViewBuilder
        private static func defaultSystemImage(for type: Self) -> some View {
            switch type {
            case .error:
                Image(systemName: "xmark.shield.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(MBSDSColor.neutral(.base).color,MBSDSColor.status(.error).color)
            case .info:
                Image(systemName: "exclamationmark.triangle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.informative).color)
            case .success:
                Image(systemName: "checkmark.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.success).color)
            case .warning:
                Image(systemName: "exclamationmark.shield.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.warning).color)
            }
        }
    }
}
