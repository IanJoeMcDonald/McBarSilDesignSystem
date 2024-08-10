//
//  MBSDSTextField.swift
//  McBarSilDesignSystem
//
//  Created by Roberta McDonald on 29/11/24.
//

import SwiftUI

public struct MBSDSTextField: View {

    public enum Message {

        case error(String)
        case info(String)
        case success(String)
        case warning(String)
    }

    // MARK: Initializers
    public init(
        _ title: String,
        text: Binding<String>,
        message: Binding<Message?>,
        isInverse: Bool = false,
        style: MBSDSBorder.Style = .primary,
        backgroundColor: MBSDSColor = .background(.base)
    ) {
        self.title = title
        self.isInverse = isInverse
        self.style = style
        self.backgroundColor = backgroundColor.color
        self._text = text
        self._message = message
    }

    // MARK: Binding
    @Binding private var text: String
    @Binding private var message: MBSDSTextField.Message?

    // MARK: State
    @State private var isEmpty: Bool = true
    @State private var height: Double = .zero

    // MARK: Variables
    public var title: String
    public var isInverse: Bool
    public var style: MBSDSBorder.Style
    private var backgroundColor: Color

    // MARK: Body
    public var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                HStack {
                    TextField("", text: $text)
                        .onChange(of: text, perform: { _ in
                            isEmpty = text.isEmpty

                        })
                        .padding(.leading)
                        .padding(.vertical)
                        .saveHeight(in: $height)
                }
                .background(
                    BorderWithTitle(
                        title: title,
                        isInverse: isInverse,
                        style: style,
                        backgroundColor: backgroundColor,
                        isEmpty: $isEmpty,
                        height: $height)
                )
            }
            if let message {
                let messageText = switch message {
                case let .error(error): error
                case let .info(info): info
                case let .success(success): success
                case let .warning(warning): warning
                }

                let icon = switch message {
                case .error:
                    Image(systemName: "xmark.shield.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(MBSDSColor.neutral(.base).color,MBSDSColor.status(.error).color)
                case .info:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.informative).color)
                case .success:
                    Image(systemName: "checkmark.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.success).color)
                case .warning:
                    Image(systemName: "exclamationmark.shield.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(MBSDSColor.neutral(.base).color, MBSDSColor.status(.warning).color)
                }
                HStack {
                    icon
                        .padding(.leading, MBSDSSpacing.sm.rawValue)
                    MBSDSLabel(text: messageText, font: .heading(.md), onColor: .emphasis(.medium))
                    Spacer()
                }
            } else {
                MBSDSLabel(text: " ", font: .heading(.md), onColor: .emphasis(.disabled))
            }
        }
    }
}

// MARK: Extension - Border With Title
extension MBSDSTextField {

    struct BorderWithTitle: View {

        // MARK: Initializer
        init(
            title: String,
            isInverse: Bool,
            style: MBSDSBorder.Style,
            backgroundColor: Color,
            isEmpty: Binding<Bool>,
            height: Binding<Double>
        ) {
            self.title = title
            self.isInverse = isInverse
            self.style = style
            self.backgroundColor = backgroundColor
            self._isEmpty = isEmpty
            self._height = height
        }

        // MARK: Binding
        @Binding var isEmpty: Bool
        @Binding var height: Double

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: Variables
        var title: String
        var isInverse: Bool
        var style: MBSDSBorder.Style
        var backgroundColor: Color

        // MARK: Body
        var body: some View {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: MBSDSBorder.Radius.sm.rawValue)
                    .stroke(generateStrokeColor(), lineWidth: MBSDSBorder.Stroke.medium.rawValue)
                FloatingTitle(
                    title: title,
                    isInverse: isInverse,
                    style: style,
                    backgroundColor: backgroundColor,
                    isEmpty: $isEmpty,
                    height: $height
                )
            }
        }

        // MARK: Private Custom Methods
        private func generateStrokeColor() -> Color {
            switch style {
            case .primary: generatePrimaryStrokeColor()
            case .neutral: generateNeutralStrokeColor()
            }
        }

        private func generatePrimaryStrokeColor() -> Color {
            if isEnabled {
                if isInverse {
                    MBSDSColor.action(.secondary(.enabled)).inverseColor
                } else {
                    MBSDSColor.action(.secondary(.enabled)).color
                }
            } else {
                if isInverse {
                    MBSDSColor.action(.secondary(.enabled)).color
                } else {
                    MBSDSColor.action(.secondary(.enabled)).inverseColor
                }
            }
        }

        private func generateNeutralStrokeColor() -> Color {
            if isEnabled {
                if isInverse {
                    MBSDSColor.action(.neutral(.enabled)).color
                } else {
                    MBSDSColor.action(.neutral(.enabled)).inverseColor
                }
            } else {
                if isInverse {
                    MBSDSColor.action(.disabled).inverseColor
                } else {
                    MBSDSColor.action(.disabled).color
                }
            }
        }
    }
}

// MARK: Extension - FloatingTitle
extension MBSDSTextField {

    struct FloatingTitle: View {

        // MARK: Initializers
        init(
            title: String,
            isInverse: Bool,
            style: MBSDSBorder.Style,
            backgroundColor: Color,
            isEmpty: Binding<Bool>,
            height: Binding<Double>
        ) {
            self.title = title
            self.isInverse = isInverse
            self.style = style
            self.backgroundColor = backgroundColor
            self._isEmpty = isEmpty
            self._height = height
        }

        // MARK: Binding
        @Binding var isEmpty: Bool
        @Binding var height: Double

        // MARK: Environment
        @Environment(\.isEnabled) private var isEnabled

        // MARK: Variables
        var title: String
        var isInverse: Bool
        var style: MBSDSBorder.Style
        var backgroundColor: Color

        private var scaleEffect: Double {
            isEmpty ? 1: 0.9
        }

        private var offset: CGSize {
            .init(
                width: 15,
                height: isEmpty ? 0 : -(height/2 + 5)
            )
        }

        private var paddingSize: Double {
            isEmpty ? 0: 5
        }

        private var animationDuration: Double {
            0.3
        }

        // MARK: Body
        var body: some View {

            Text(title)
                .foregroundColor(generateForegroundColor())
                .padding([.leading, .trailing], paddingSize)
                .offset(offset)
                .scaleEffect(scaleEffect, anchor: .leading)
                .background(
                    backgroundColor
                        .offset(offset)
                        .scaleEffect(scaleEffect, anchor: .leading)
                )
                .animation(.easeInOut(duration: animationDuration), value: scaleEffect)
                .animation(.easeInOut(duration: animationDuration), value: offset)
                .animation(.easeInOut(duration: animationDuration), value: paddingSize)
        }

        // MARK: Private Custom Methods
        private func generateForegroundColor() -> Color {
            let emphasis: MBSDSColor.OnColor.Emphasis = if self.isEnabled { .high } else { .disabled }

            let styleColor: MBSDSColor.OnColor = switch style {
            case .primary: .emphasis(emphasis)
            case .neutral: .emphasis(emphasis)
            }

            return if isInverse {
                styleColor.inverseColor
            } else {
                styleColor.color
            }
        }
    }
}

// MARK: Preview
#Preview {
    struct Preview: View {
        @State var myString = ""
        @State var message1: MBSDSTextField.Message? = nil
        @State var message2: MBSDSTextField.Message? = .error("Error")
        @State var message3: MBSDSTextField.Message? = .info("Info")
        @State var message4: MBSDSTextField.Message? = .success("Success")
        @State var message5: MBSDSTextField.Message? = .warning("Warning")
        var body: some View {
            VStack(spacing: MBSDSSpacing.sm.rawValue) {
                MBSDSTextField("Title", text: $myString, message: $message1)
                MBSDSTextField("Title", text: $myString, message: $message2)
                MBSDSTextField("Title", text: $myString, message: $message3)
                MBSDSTextField("Title", text: $myString, message: $message4)
                MBSDSTextField("Title", text: $myString, message: $message5)
            }
        }
    }

    return Preview()
}
