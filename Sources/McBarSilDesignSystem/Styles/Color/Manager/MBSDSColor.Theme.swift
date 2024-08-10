//
//  MBSDSColor.Theme.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

extension MBSDSColor {

    public enum Theme: String {
        case violet

        public var lightModeFilename: String {
            let name = self.rawValue.prefix(1).uppercased() + self.rawValue.lowercased().dropFirst()
            return name + "LightModeTheme.json"
        }

        public var darkModeFilename: String {
            let name = self.rawValue.prefix(1).uppercased() + self.rawValue.lowercased().dropFirst()
            return name + "DarkModeTheme.json"
        }
    }
}
