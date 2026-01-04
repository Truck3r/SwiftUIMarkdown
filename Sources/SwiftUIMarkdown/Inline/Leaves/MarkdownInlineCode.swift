//
//  MarkdownInlineCode.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that conforms `Markdown.InlineCode` to ``MarkdownInline``,
/// enabling inline code elements to be rendered as SwiftUI views.
///
/// This extension provides the ability to convert Markdown inline code spans
/// (text surrounded by backticks) into styled `Text` views with a monospaced font.
///
/// ## Example
///
/// When parsing Markdown like this:
/// ```markdown
/// Use the `print()` function to output text.
/// ```
///
/// The word `print()` will be rendered with a monospaced font to visually
/// distinguish it as code.
@MainActor
extension Markdown.InlineCode: MarkdownInline {
    /// A SwiftUI `Text` view representing the inline code.
    ///
    /// The text is rendered with a monospaced font to visually indicate
    /// that it represents code.
    @ViewBuilder
    var view: SwiftUI.Text {
        internalText
    }

    /// Creates the styled text representation of the inline code.
    ///
    /// On iOS 16.4 and later, this uses the `monospaced()` modifier for
    /// cleaner rendering. On earlier versions, it falls back to using
    /// a monospaced system font design.
    private var internalText: SwiftUI.Text {
        if #available(iOS 16.4, *) {
            Text(code).monospaced()
        } else {
            Text(code).font(.system(.body, design: .monospaced))
        }
    }
}
