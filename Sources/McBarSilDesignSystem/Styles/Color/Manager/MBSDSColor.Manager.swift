//
//  MBSDSColor.Manager.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 28/11/24.
//

import Foundation
import UIKit

extension MBSDSColor {

    public class Manager {

        public static var shared = Manager()

        var lightMode: Pallet
        var darkMode: Pallet

        init() {
            self.lightMode = Bundle.module.decode(MBSDSColor.Pallet.self, from: MBSDSColor.Theme.violet.lightModeFilename)
            self.darkMode = Bundle.module.decode(MBSDSColor.Pallet.self, from: MBSDSColor.Theme.violet.darkModeFilename)
        }

        public func loadColors(
            lightMode: String,
            darkMode: String
        ) {
            self.lightMode = Bundle.module.decode(MBSDSColor.Pallet.self, from: lightMode)
            self.darkMode = Bundle.module.decode(MBSDSColor.Pallet.self, from: darkMode)
        }
    }
}
