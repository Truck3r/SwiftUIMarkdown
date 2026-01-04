//
//  MarkdownInline.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A protocol that defines how inline Markdown elements are rendered as SwiftUI `Text` views.
///
/// Types conforming to `MarkdownInline` represent inline-level Markdown content
/// such as plain text, emphasis, strong emphasis, links, and code spans.
/// Each conforming type provides its own SwiftUI `Text` representation
/// through the ``view`` property.
///
/// ## Conforming to MarkdownInline
///
/// To conform to `MarkdownInline`, implement the ``view`` property to return
/// the appropriate SwiftUI `Text` representation of the inline content:
///
/// ```swift
/// extension Markdown.Text: MarkdownInline {
///     var view: SwiftUI.Text {
///         SwiftUI.Text(plainText)
///     }
/// }
/// ```
///
/// ## Topics
///
/// ### Rendering Content
///
/// - ``view``
@MainActor
protocol MarkdownInline: Markup {
    /// The SwiftUI `Text` representation of this inline Markdown element.
    ///
    /// Implement this property to define how the inline content should be
    /// rendered. You can apply text modifiers such as bold, italic, or
    /// custom fonts to style the content appropriately.
    @ViewBuilder
    var view: SwiftUI.Text { get }
}
