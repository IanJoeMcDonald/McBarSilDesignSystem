//
//  MBSDSFont.swift
//
//
//  Created by Ian McDonald on 01/08/24.
//

import SwiftUI

public enum MBSDSFont {

    case heading(Heading)
    case body(Body)
    case action(Action)
    case caption(Caption)

    public static func registerCustomFonts() {
        for font in [
            "Inter-Black.ttf",
            "Inter-Bold.ttf",
            "Inter-ExtraBold.ttf",
            "Inter-Medium.ttf",
            "Inter-Regular.ttf",
            "Inter-SemiBold.ttf"
        ] {
            guard let url = Bundle.module.url(forResource: font, withExtension: nil) else { return }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }

    public var font: Font {
        switch self {
        case let .heading(size): size.font
        case let .body(size): size.font
        case let .action(size): size.font
        case let .caption(size): size.font
        }
    }
}

public extension MBSDSFont {
    
    enum Heading: CaseIterable {
        
        case xl
        case lg
        case md
        case sm
        case xs
        
        var font: Font {
            switch self {
            case .xl: Font.custom("Inter-ExtraBold", size: 24, relativeTo: .largeTitle)
            case .lg: Font.custom("Inter-ExtraBold", size: 18, relativeTo: .title)
            case .md: Font.custom("Inter-ExtraBold", size: 16, relativeTo: .title2)
            case .sm: Font.custom("Inter-ExtraBold", size: 14, relativeTo: .title3)
            case .xs: Font.custom("Inter-Bold", size: 12, relativeTo: .largeTitle)
            }
        }
    }
}

public extension MBSDSFont {
    
    enum Body: CaseIterable {
        
        case xl
        case lg
        case md
        case sm
        case xs
        
        var font: Font {
            switch self {
            case .xl: Font.custom("Inter-Regular", size: 18, relativeTo: .body)
            case .lg: Font.custom("Inter-Regular", size: 16, relativeTo: .body)
            case .md: Font.custom("Inter-Regular", size: 14, relativeTo: .body)
            case .sm: Font.custom("Inter-Regular", size: 12, relativeTo: .body)
            case .xs: Font.custom("Inter-Medium", size: 10, relativeTo: .body)
            }
        }
    }
}

public extension MBSDSFont {
    
    enum Action: CaseIterable {
        
        case lg
        case md
        case sm
        
        var font: Font {
            switch self {
            case .lg: Font.custom("Inter-SemiBold", size: 14, relativeTo: .callout)
            case .md: Font.custom("Inter-SemiBold", size: 12, relativeTo: .callout)
            case .sm: Font.custom("Inter-SemiBold", size: 10, relativeTo: .callout)
            }
        }
    }
}

public extension MBSDSFont {
    
    enum Caption: CaseIterable {
        
        case md
        
        var font: Font {
            switch self {
            case .md: Font.custom("Inter-SemiBold", size: 10, relativeTo: .caption)
            }
        }
    }
}
