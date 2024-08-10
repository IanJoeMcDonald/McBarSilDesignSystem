//
//  MBSDSSize.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import Foundation

public enum MBSDSSize: Double, CaseIterable, CustomStringConvertible {

    case size0 = 0
    case size16 = 16
    case size24 = 24
    case size32 = 32
    case size40 = 40
    case size48 = 48
    case size64 = 64
    case size80 = 80
    case size112 = 112
    case size160 = 160
    case size240 = 240
    case size264 = 264

    public var description: String {
        switch self {
            
        case .size0: "size-0-\(self.rawValue)"
        case .size16: "size-16-\(self.rawValue)"
        case .size24: "size-24-\(self.rawValue)"
        case .size32: "size-32-\(self.rawValue)"
        case .size40: "size-40-\(self.rawValue)"
        case .size48: "size-48-\(self.rawValue)"
        case .size64: "size-64-\(self.rawValue)"
        case .size80: "size-80-\(self.rawValue)"
        case .size112: "size-112-\(self.rawValue)"
        case .size160: "size-160-\(self.rawValue)"
        case .size240: "size-240-\(self.rawValue)"
        case .size264: "size-264-\(self.rawValue)"
        }
    }
}
