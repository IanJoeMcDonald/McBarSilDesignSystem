//
//  Color+Extension.swift
//
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension Color {

    init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(
            UIColor(light: UIColor(lightModeColor()), dark: UIColor(darkModeColor()))
        )
    }

    init(hex: String) {
        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red = Double((hexNumber & 0xff000000) >> 24) / 255
                    green = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = Double((hexNumber & 0x000000ff)) / 255

                    self.init(red: red, green: green, blue: blue, opacity: alpha)
                    return
                }
            }
        }

        self.init(red: 0, green: 0, blue: 0, opacity: 100)
    }
}
