//
//  MBSDSColor.swift
//
//
//  Created by Ian McDonald on 01/12/24.
//

import SwiftUI

public enum MBSDSColor: Colorable {

    case primary(Primary)
    case secondary(Secondary)
    case neutral(Neutral)
    case action(Action)
    case onColor(OnColor)
    case status(Status)
    case outline(Outline)
    case background(Background)
    case special(Special)

    public var color: Color {
        switch self {
        case let .primary(primary): primary.color
        case let .secondary(secondary): secondary.color
        case let .neutral(neutral): neutral.color
        case let .action(action): action.color
        case let .onColor(onColor): onColor.color
        case let .status(status): status.color
        case let .outline(outline): outline.color
        case let .background(background): background.color
        case let .special(special): special.color
        }
    }

    public var inverseColor: Color {
        switch self {
        case let .primary(primary): primary.inverseColor
        case let .secondary(secondary): secondary.inverseColor
        case let .neutral(neutral): neutral.inverseColor
        case let .action(action): action.inverseColor
        case let .onColor(onColor): onColor.inverseColor
        case let .status(status): status.inverseColor
        case let .outline(outline): outline.inverseColor
        case let .background(background): background.inverseColor
        case let .special(special): special.inverseColor
        }
    }
}

public protocol Colorable {

    var color: Color { get }
    var inverseColor: Color { get }
}
