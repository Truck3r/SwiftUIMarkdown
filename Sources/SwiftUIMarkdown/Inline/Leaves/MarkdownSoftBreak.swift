//
//  MarkdownSoftBreak.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Conformance of ``Markdown/SoftBreak`` to ``MarkdownInline`` for rendering soft breaks as SwiftUI views.
///
/// A soft break in Markdown represents a line break within a paragraph that is typically
/// rendered as a space rather than a hard line break. This extension provides the SwiftUI
/// representation of such breaks.
@MainActor
extension Markdown.SoftBreak: MarkdownInline {
    /// A SwiftUI `Text` view representing the soft break.
    ///
    /// Soft breaks are rendered as a single space character, allowing text to flow
    /// naturally within a paragraph while preserving the original line structure
    /// from the Markdown source.
    ///
    /// - Returns: A `Text` view containing a single space character.
    @ViewBuilder
    var view: SwiftUI.Text {
        Text(" ")
    }
}
