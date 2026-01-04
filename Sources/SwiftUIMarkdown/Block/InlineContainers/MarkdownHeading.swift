//
//  MarkdownHeading.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Extends `Markdown.Heading` to conform to ``MarkdownBlockInlineContainer``,
/// enabling headings to be rendered as SwiftUI views.
@MainActor
extension Markdown.Heading: MarkdownBlockInlineContainer {
    /// A SwiftUI view representation of the Markdown heading.
    ///
    /// This property builds a heading view with the appropriate styling based on the heading level (1-6).
    /// The resulting view includes accessibility traits marking it as a header element.
    @ViewBuilder
    var view: some SwiftUI.View {
        VStack(alignment: .leading, spacing: .zero) {
            HeadingView(level: self.level) {
                buildView()
            }
            .accessibilityAddTraits(.isHeader)
            .padding(.bottom)
        }
    }
}

/// A private view that renders heading text with the appropriate font based on heading level.
///
/// `HeadingView` reads the current ``MarkdownFonts`` from the environment and applies
/// the corresponding font for heading levels 1 through 6.
private struct HeadingView: View {
    /// The fonts configuration from the environment.
    @Environment(\.markdownFonts) private var markdownFonts

    /// The heading level, typically 1-6.
    private let level: Int

    /// Creates a new heading view with the specified level and content.
    ///
    /// - Parameters:
    ///   - level: The heading level (1-6). Levels outside this range display a fallback.
    ///   - content: A closure that returns the `Text` content to display.
    init(level: Int, content: @escaping () -> SwiftUI.Text) {
        self.level = level
        self.content = content
    }

    /// A closure that produces the heading's text content.
    let content: () -> SwiftUI.Text

    /// The body of the heading view, applying the appropriate font based on level.
    ///
    /// - Returns: A `Text` view styled with the font corresponding to the heading level:
    ///   - Level 1: ``MarkdownFonts/heading1``
    ///   - Level 2: ``MarkdownFonts/heading2``
    ///   - Level 3: ``MarkdownFonts/heading3``
    ///   - Level 4: ``MarkdownFonts/heading4``
    ///   - Level 5: ``MarkdownFonts/heading5``
    ///   - Level 6: ``MarkdownFonts/heading6``
    ///   - Other levels: A gray placeholder indicating an unsupported level
    var body: some View {
        switch level {
        case 1:
            return content().font(markdownFonts.heading1)
        case 2:
            return content().font(markdownFonts.heading2)
        case 3:
            return content().font(markdownFonts.heading3)
        case 4:
            return content().font(markdownFonts.heading4)
        case 5:
            return content().font(markdownFonts.heading5)
        case 6:
            return content().font(markdownFonts.heading6)
        default:
            return SwiftUI.Text("[Heading]").foregroundColor(.gray) + Text(" level \(level)")
        }
    }
}
