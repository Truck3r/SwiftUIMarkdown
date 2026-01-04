//
//  MarkdownStrong.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that conforms `Markdown.Strong` to ``MarkdownInline`` and ``MarkdownInlineContainer``.
///
/// This extension enables strong (bold) text elements from a parsed Markdown document
/// to be rendered as SwiftUI `Text` views with bold formatting applied.
///
/// ## Overview
///
/// When the Markdown parser encounters text wrapped in double asterisks (`**text**`)
/// or double underscores (`__text__`), it creates a `Strong` node. This extension
/// provides the rendering logic to convert that node into a bold SwiftUI `Text` view.
///
/// The extension builds its child inline content using ``MarkdownInlineContainer/buildView()``
/// and then applies the `.bold()` modifier to produce the final styled text.
@MainActor
extension Markdown.Strong: MarkdownInline, MarkdownInlineContainer {
    /// The SwiftUI `Text` view representing this strong element with bold formatting.
    ///
    /// This property builds the view for all child inline elements and applies
    /// bold styling to the resulting text.
    @ViewBuilder
    var view: SwiftUI.Text {
        buildView().bold()
    }
}
