//
//  MarkdownUnorderedList.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Extends `Markdown.UnorderedList` to conform to ``MarkdownBlock`` and provide
/// SwiftUI rendering capabilities.
///
/// This extension enables unordered (bulleted) lists from parsed Markdown content
/// to be rendered as native SwiftUI views. Unordered lists display items with
/// bullet point characters that can be customized through the environment.
///
/// ## Overview
///
/// When a Markdown document contains an unordered list, such as:
///
/// ```markdown
/// - First item
/// - Second item
/// - Third item
/// ```
///
/// This extension provides the `view` property that renders it as a properly
/// formatted SwiftUI view with bullet characters and appropriate indentation.
///
/// ## Features
///
/// - **Customizable bullets**: Bullet characters are configurable via ``MarkdownStyle/bullets``
/// - **Nested list support**: Each nesting level uses the next character in the bullet string
/// - **Accessibility**: Full VoiceOver support with list begin/end announcements and item counters
/// - **Nested content**: Supports paragraphs, headings, and nested lists within list items
///
/// ## Example
///
/// ```swift
/// let markdown = """
/// - First item
/// - Second item with **bold text**
/// - Third item
/// """
/// let document = Document(parsing: markdown)
/// BlockView(blockContainer: document)
/// ```
///
/// ## See Also
///
/// - ``MarkdownBlock``
/// - ``Markdown/OrderedList``
/// - ``BlockView``
/// - ``MarkdownStyle``
@MainActor
extension Markdown.UnorderedList: MarkdownBlock {
    /// A SwiftUI view that renders this unordered list.
    ///
    /// The view displays each list item with a bullet character, proper indentation,
    /// and full accessibility support for screen readers.
    @ViewBuilder
    var view: some SwiftUI.View {
        UnorderedListView(list: self)
    }

    /// Renders a block inline container element within the list.
    ///
    /// This method handles the rendering of paragraph and heading elements
    /// that appear as direct children of list items. Unsupported elements
    /// are displayed with a debug border.
    ///
    /// - Parameter blockInlineContainer: The block inline container to render.
    /// - Returns: A view representing the rendered content.
    @ViewBuilder
    private func render(blockInlineContainer: MarkdownBlockInlineContainer) -> some View {
        switch blockInlineContainer {
        case let paragraph as Markdown.Paragraph:
            paragraph.view
        case let heading as Markdown.Heading:
            heading.view
        default:
            blockInlineContainer.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }
}

/// A private view that renders an unordered Markdown list with bullet characters.
///
/// `UnorderedListView` handles the layout and accessibility of unordered lists,
/// including:
/// - Rendering bullet characters from the configured style
/// - Supporting nested lists with different bullet characters at each level
/// - Providing accessibility labels for list navigation
/// - Announcing list boundaries to screen readers
private struct UnorderedListView: View {
    @Environment(\.markdownDebug) var debugEnabled: Bool

    /// The current Markdown style from the environment.
    ///
    /// Used to retrieve the bullet characters for list rendering. The first
    /// character of ``MarkdownStyle/bullets`` is used for this list level,
    /// with subsequent characters passed to nested lists.
    @Environment(\.markdownStyle) private var markdownStyle

    /// The current Markdown fonts from the environment.
    ///
    /// Used to apply the body font with monospaced styling to bullet characters
    /// for consistent alignment.
    @Environment(\.markdownFonts) private var markdownFonts

    /// The current Markdown accessibility settings from the environment.
    ///
    /// Used to generate accessibility labels for list navigation, including
    /// list begin/end announcements and item position counters.
    @Environment(\.markdownAccessibility) private var markdownAccessibility

    /// The unordered list being rendered.
    private let list: Markdown.UnorderedList

    /// Creates an unordered list view for the specified list.
    ///
    /// - Parameter list: The `Markdown.UnorderedList` to render.
    init(list: Markdown.UnorderedList) {
        self.list = list
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { offset, item in
                HStack(alignment: .top) {
                    bulletFor(offset: offset)
                        .font(markdownFonts.body.monospaced())
                        .padding(.leading, 8.0)
                    BlockView(blockContainer: item, accessibilityListElementQualifier: markdownAccessibility.listCounter(offset + 1, elementCount))
                        .markdownStyle(bullets: String(markdownStyle.bullets.dropFirst()))
                }
                .padding(.bottom, 4.0)
            }
            if debugEnabled {
                Color.red // announce end of list
                    .frame(width: 3.0, height: 3.0)
                    .accessibilityElement()
                    .accessibilityLabel(markdownAccessibility.listEnd())
            } else {
                Color.clear // announce end of list
                    .frame(width: 0.1, height: 0.1)
                    .accessibilityElement()
                    .accessibilityLabel(markdownAccessibility.listEnd())
            }
        }
    }

    /// Creates a bullet text view with accessibility support for the item at the given offset.
    ///
    /// The first bullet in the list includes an accessibility label that
    /// announces the beginning of the list. Subsequent bullets only
    /// display the bullet character without additional announcements.
    ///
    /// - Parameter offset: The zero-based index of this item in the list.
    /// - Returns: A `Text` view displaying the bullet character.
    private func bulletFor(offset: Int) -> SwiftUI.Text {
        if offset == 0 {
            return SwiftUI.Text(bullet)
                .accessibilityLabel("\(bullet), \(markdownAccessibility.listBegin())")
        } else {
            return SwiftUI.Text(bullet)
        }
    }

    /// The total number of items in the list.
    ///
    /// Used for accessibility announcements to inform users of their
    /// position within the list (e.g., "item 2 of 5").
    private var elementCount: Int {
        Array(list.listItems).count
    }

    /// The bullet character to use for this list level.
    ///
    /// Returns the first character from ``MarkdownStyle/bullets``. If the
    /// bullets string is empty, falls back to the standard bullet character (•).
    ///
    /// For nested lists, each level consumes one character from the bullets
    /// string, allowing different bullet styles at each nesting level.
    var bullet: String {
        guard let first = markdownStyle.bullets.first else {
            return "•"
        }
        return String(first)
    }
}
