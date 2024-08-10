//
//  MBSDSSpacing.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

import Foundation

public enum MBSDSSpacing: Double, CaseIterable, CustomStringConvertible {

    /// zero = 0
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case zero = 0

    /// xxxs = 4
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case xxxs = 4

    /// xxs = 8
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case xxs = 8

    /// xs = 12
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case xs = 12

    /// sm = 16
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case sm = 16

    /// md = 24
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case md = 24

    /// lg = 32
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case lg = 32

    /// xl = 48
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case xl = 48

    /// xxl = 64
    /// ```
    /// zero = 0
    /// xxxs = 4
    /// xxs = 8
    /// xs = 12
    /// sm = 16
    /// md = 24
    /// lg = 32
    /// xl = 48
    /// xxl = 64
    case xxl = 64

    public var description: String {
        switch self {
        case .zero: "spacing-zero-\(self.rawValue)"
        case .xxxs: "spacing-xxxs-\(self.rawValue)"
        case .xxs: "spacing-xxs-\(self.rawValue)"
        case .xs: "spacing-xs-\(self.rawValue)"
        case .sm: "spacing-sm-\(self.rawValue)"
        case .md: "spacing-md-\(self.rawValue)"
        case .lg: "spacing-lg-\(self.rawValue)"
        case .xl: "spacing-xl-\(self.rawValue)"
        case .xxl: "spacing-xxl-\(self.rawValue)"
        }
    }
}
