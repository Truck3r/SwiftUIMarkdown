//
//  MarkdownLink.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that provides SwiftUI rendering support for Markdown link elements.
///
/// This extension conforms ``Markdown/Link`` to ``MarkdownInline``, enabling
/// hyperlinks from parsed Markdown to be rendered as SwiftUI ``SwiftUI/Text`` views.
///
/// ## Overview
///
/// When a Markdown document contains link syntax, this extension renders it as
/// underlined text that preserves the link destination. The rendering leverages
/// SwiftUI's built-in support for attributed strings to handle the link formatting.
///
/// For example, the Markdown text `[Apple](https://apple.com)` will be rendered
/// as underlined "Apple" text with an embedded link.
///
/// ## Rendering Strategy
///
/// Because SwiftUI `Text` views handle primitive Markdown formatting through
/// `AttributedString`, this extension reconstructs the Markdown link syntax
/// and parses it into an attributed string. This approach allows the link to
/// render inline with surrounding text while preserving the hyperlink behavior.
///
/// ## Example
///
/// Links with optional titles are also supported:
/// ```markdown
/// [Apple](https://apple.com "Visit Apple")
/// ```
///
/// ## See Also
///
/// - ``MarkdownInline``
@MainActor
extension Markdown.Link: MarkdownInline {
    /// A SwiftUI text view representing this link element.
    ///
    /// This property returns the link text with an underline style applied,
    /// making the link visually distinguishable within the surrounding text.
    @ViewBuilder
    var view: SwiftUI.Text {
        text.underline()
    }

    /// Creates a SwiftUI `Text` view from the link's attributed string representation.
    ///
    /// This property attempts to parse the reconstructed Markdown link syntax
    /// into an `AttributedString`. If parsing succeeds, the attributed string
    /// preserves the link destination. If parsing fails, the plain text
    /// representation is used as a fallback.
    var text: SwiftUI.Text {
        if let attributed = try? AttributedString(markdown: makeLinkText()) {
            return SwiftUI.Text(attributed)
        } else {
            return SwiftUI.Text(makeLinkText())
        }
    }

    /// Reconstructs the Markdown link syntax from the element's properties.
    ///
    /// This method builds a Markdown-formatted link string that can be parsed
    /// by `AttributedString` to create a clickable link in SwiftUI.
    ///
    /// - Returns: A string in Markdown link format, such as `[text](url "title")`.
    ///
    /// The returned string includes:
    /// - The link's display text in square brackets
    /// - The destination URL in parentheses (if present)
    /// - An optional title in quotes after the URL
    private func makeLinkText() -> String {
        var linkText = "[\(plainText)]"
        if let destination {
            let linkTitle = title == nil ? "" : " \"\(title ?? "")\""
            linkText += "(\(destination)\(linkTitle))"
        }
        return linkText
    }
}
