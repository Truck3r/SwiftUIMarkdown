//
//  MarkdownParagraph.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Conformance of `Markdown.Paragraph` to ``MarkdownBlockInlineContainer`` for rendering paragraphs as SwiftUI views.
@MainActor
extension Markdown.Paragraph: MarkdownBlockInlineContainer {
    /// A SwiftUI view representing the rendered paragraph.
    ///
    /// This view wraps the paragraph's inline content in a ``ParagraphView`` and applies
    /// bottom padding for visual separation from subsequent content.
    @ViewBuilder
    var view: some SwiftUI.View {
        ParagraphView {
            buildView()
        }
        .padding(.bottom, 4)
    }
}

/// A view that displays a paragraph of Markdown text with appropriate styling.
///
/// `ParagraphView` applies the body font from the current Markdown fonts environment,
/// adds line spacing for readability, and ensures the text aligns to the leading edge
/// of the available width.
private struct ParagraphView: View {
    /// The Markdown font configuration from the environment.
    @Environment(\.markdownFonts) private var markdownFonts

    /// Creates a new paragraph view with the specified content.
    ///
    /// - Parameter content: A closure that returns the `Text` content to display.
    init(content: @escaping () -> SwiftUI.Text) {
        self.content = content
    }

    /// The closure that produces the text content for this paragraph.
    let content: () -> SwiftUI.Text

    var body: some View {
        content()
            .lineLimit(nil)
            .font(markdownFonts.body)
            .lineSpacing(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
