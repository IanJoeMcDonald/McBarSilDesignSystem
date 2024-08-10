//
//  MBSDSBorder.Stroke.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

extension MBSDSBorder {

    enum Stroke: Double, CaseIterable, CustomStringConvertible {

        /// zero = 0
        /// ```
        /// zero = 0
        /// hairline = 0.5
        /// thin = 1
        /// medium = 1.5
        /// thick = 2
        case zero = 0

        /// hairline = 0.5
        /// ```
        /// zero = 0
        /// hairline = 0.5
        /// thin = 1
        /// medium = 1.5
        /// thick = 2
        case hairline = 0.5

        /// thin = 1
        /// ```
        /// zero = 0
        /// hairline = 0.5
        /// thin = 1
        /// medium = 1.5
        /// thick = 2
        case thin = 1

        /// medium = 1.5
        /// ```
        /// zero = 0
        /// hairline = 0.5
        /// thin = 1
        /// medium = 1.5
        /// thick = 2
        case medium = 1.5

        /// thick = 2
        /// ```
        /// zero = 0
        /// hairline = 0.5
        /// thin = 1
        /// medium = 1.5
        /// thick = 2
        case thick = 2

        public var description: String {
            switch self {
            case .zero: "border-stroke-zero-\(self.rawValue)"
            case .hairline: "border-stroke-hairline-\(self.rawValue)"
            case .thin: "border-stroke-thin-\(self.rawValue)"
            case .medium: "border-stroke-medium-\(self.rawValue)"
            case .thick: "border-stroke-thick-\(self.rawValue)"
            }
        }
    }
}
