//
//  MarkdownOrderedList.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Extends `Markdown.OrderedList` to conform to ``MarkdownBlock`` and provide
/// SwiftUI rendering capabilities.
///
/// This extension enables ordered (numbered) lists from parsed Markdown content
/// to be rendered as native SwiftUI views. Ordered lists display items with
/// sequential numbers starting from a configurable start index.
///
/// ## Overview
///
/// When a Markdown document contains an ordered list, such as:
///
/// ```markdown
/// 1. First item
/// 2. Second item
/// 3. Third item
/// ```
///
/// This extension provides the `view` property that renders it as a properly
/// formatted SwiftUI view with numbered bullets and appropriate indentation.
///
/// ## Features
///
/// - **Dynamic numbering**: Supports custom start indices (e.g., starting from 5 instead of 1)
/// - **Adaptive indentation**: Automatically adjusts bullet width based on the number of digits
/// - **Accessibility**: Full VoiceOver support with list begin/end announcements and item counters
/// - **Nested content**: Supports paragraphs, headings, and nested lists within list items
///
/// ## Example
///
/// ```swift
/// let markdown = """
/// 1. First item
/// 2. Second item with **bold text**
/// 3. Third item
/// """
/// let document = Document(parsing: markdown)
/// BlockView(blockContainer: document)
/// ```
///
/// ## See Also
///
/// - ``MarkdownBlock``
/// - ``Markdown/UnorderedList``
/// - ``BlockView``
@MainActor
extension Markdown.OrderedList: MarkdownBlock {
    /// A SwiftUI view that renders this ordered list.
    ///
    /// The view displays each list item with a numbered bullet, proper indentation,
    /// and full accessibility support for screen readers.
    @ViewBuilder
    var view: some SwiftUI.View {
        OrderedListView(list: self)
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

/// A private view that renders an ordered Markdown list with numbered bullets.
///
/// `OrderedListView` handles the layout and accessibility of ordered lists,
/// including:
/// - Calculating appropriate indentation based on the maximum number width
/// - Rendering numbered bullets with proper alignment
/// - Providing accessibility labels for list navigation
/// - Announcing list boundaries to screen readers
private struct OrderedListView: View {
    /// The current Markdown style from the environment.
    @Environment(\.markdownStyle) private var markdownStyle

    /// The current Markdown accessibility settings from the environment.
    @Environment(\.markdownAccessibility) private var markdownAccessibility

    /// The scaled indentation width for bullet alignment.
    ///
    /// This value is calculated based on the number of digits in the largest
    /// list number and scales with Dynamic Type settings.
    @ScaledMetric(relativeTo: .body) private var indent: CGFloat = 10.0

    /// The ordered list being rendered.
    private let list: Markdown.OrderedList

    /// Creates an ordered list view for the specified list.
    ///
    /// The initializer calculates the appropriate indentation width based on
    /// the maximum number that will be displayed, ensuring proper alignment
    /// for lists with varying digit counts.
    ///
    /// - Parameter list: The `Markdown.OrderedList` to render.
    init(list: Markdown.OrderedList) {
        self.list = list
        let maxnumber = Int(list.startIndex) + list.listItems.underestimatedCount
        _indent = .init(wrappedValue: 5.0 + 12.0 * CGFloat(String(maxnumber).count), relativeTo: .body)
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { offset, item in
                HStack(alignment: .top) {
                    bullet("\(UInt(offset) + list.startIndex)", offset: offset)
                        .frame(width: indent, alignment: .trailing)
                    BlockView(blockContainer: item,
                              accessibilityListElementQualifier: markdownAccessibility.listCounter(offset + 1, elementCount))
                        .markdownStyle(bullets: String(markdownStyle.bullets.dropFirst()))
                }
                .padding(.leading, 8.0)
                .padding(.bottom, 4.0)
            }
            Color.clear // announce end of list
                .frame(width: 0.1, height: 0.1)
                .accessibilityElement()
                .accessibilityLabel(markdownAccessibility.listEnd())
                .accessibilityHidden(false)
        }
    }

    /// The total number of items in the list.
    ///
    /// Used for accessibility announcements to inform users of their
    /// position within the list (e.g., "item 2 of 5").
    private var elementCount: Int {
        Array(list.listItems).count
    }

    /// Creates a numbered bullet text view with accessibility support.
    ///
    /// The first bullet in the list includes an accessibility label that
    /// announces the beginning of the list. Subsequent bullets only
    /// announce their number.
    ///
    /// - Parameters:
    ///   - text: The number to display as the bullet.
    ///   - offset: The zero-based index of this item in the list.
    /// - Returns: A `Text` view displaying the numbered bullet with a period.
    private func bullet(_ text: String, offset: Int) -> some View {
        if offset == 0 {
            Text("\(text).")
                .accessibilityLabel("\(text), \(markdownAccessibility.listBegin())")
        } else {
            Text("\(text).")
                .accessibilityLabel("\(text)")
        }
    }
}
