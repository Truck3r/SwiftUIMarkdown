//
//  MarkdownLineBreak.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Conformance of `Markdown.LineBreak` to ``MarkdownInline`` for rendering line breaks in SwiftUI.
///
/// This extension enables Markdown line break elements to be converted into SwiftUI `Text` views
/// containing a newline character.
///
/// ## Overview
///
/// In Markdown, a line break (often represented by two trailing spaces followed by a newline,
/// or a backslash at the end of a line) creates a hard break within a paragraph. This extension
/// handles the conversion of such line breaks into their SwiftUI equivalent.
///
/// ## Example
///
/// Given Markdown content like:
/// ```markdown
/// First line\
/// Second line
/// ```
///
/// The `LineBreak` element between "First line" and "Second line" will render as a newline
/// character in the resulting SwiftUI `Text`.
@MainActor
extension Markdown.LineBreak: MarkdownInline {
    /// A SwiftUI `Text` view representing the line break.
    ///
    /// Returns a `Text` view containing a single newline character (`\n`),
    /// which produces a visible line break when rendered.
    @ViewBuilder
    var view: SwiftUI.Text {
        Text("\n")
    }
}
