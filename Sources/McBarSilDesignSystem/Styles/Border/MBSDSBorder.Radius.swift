//
//  MBSDSBorder.Radius.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

extension MBSDSBorder {
    
    enum Radius: Double, CaseIterable, CustomStringConvertible {

        /// zero = 0
        /// ```
        /// zero = 0
        /// sm = 4
        /// md = 8
        /// lg = 16
        case zero = 0

        /// sm = 4
        /// ```
        /// zero = 0
        /// sm = 4
        /// md = 8
        /// lg = 16
        case sm = 4

        /// md = 8
        /// ```
        /// zero = 0
        /// sm = 4
        /// md = 8
        /// lg = 16
        case md = 8

        /// lg = 16
        /// ```
        /// zero = 0
        /// sm = 4
        /// md = 8
        /// lg = 16
        case lg = 16

        public var description: String {
            switch self {
            case .zero: "border-radius-zero-\(self.rawValue)"
            case .sm: "border-radius-sm-\(self.rawValue)"
            case .md: "border-radius-md-\(self.rawValue)"
            case .lg: "border-radius-lg-\(self.rawValue)"
            }
        }
    }
}
