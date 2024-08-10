//
//  MBSDSController.RadioButtonItem.swift
//  McBarSilDesignSystem
//
//  Created by Ian McDonald on 01/03/25.
//

import SwiftUI

extension MBSDSController {

    public protocol RadioButtonItem {

        var id: String { get }
        var description: LocalizedStringResource { get }

        func isEqualTo(_ other: RadioButtonItem) -> Bool
        func asEquatable() -> AnyEquatableRadioButtonItem
    }
}

extension MBSDSController.RadioButtonItem where Self: Equatable {

    public func isEqualTo(_ other: MBSDSController.RadioButtonItem) -> Bool {
        guard let otherRBI = other as? Self else { return false }
        return self == otherRBI
    }

    public func asEquatable() -> AnyEquatableRadioButtonItem {
        return AnyEquatableRadioButtonItem(self)
    }
}

public struct AnyEquatableRadioButtonItem: MBSDSController.RadioButtonItem, Equatable {

    // MARK: Initializers
    init(_ value: MBSDSController.RadioButtonItem) { self.value = value }

    // MARK: Constants
    private let value: MBSDSController.RadioButtonItem

    // MARK: Variables
    public var description: LocalizedStringResource { value.description }
    public var id: String { value.id}

    // MARK: Custom Methods
    public static func ==(lhs: AnyEquatableRadioButtonItem, rhs: AnyEquatableRadioButtonItem) -> Bool {
        return lhs.value.isEqualTo(rhs.value)
    }
}
