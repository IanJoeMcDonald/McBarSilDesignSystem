//
//  MBSDSColor.Theme.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
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
