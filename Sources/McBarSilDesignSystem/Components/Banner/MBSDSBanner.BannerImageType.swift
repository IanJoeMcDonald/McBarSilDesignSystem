//
//  MBSDSBanner.BannerImageType.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSBanner {

    public enum BannerImageType {

        case customImage(AnyView)
        case defaultImage
        case noImage
    }
}
