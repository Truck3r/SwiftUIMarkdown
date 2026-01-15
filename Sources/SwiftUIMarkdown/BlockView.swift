//
//  BlockView.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A view that renders block-level Markdown elements.
///
/// `BlockView` takes a ``BlockContainer`` and iterates over its block children,
/// rendering each child according to its type. Supported block elements include:
///
/// - Paragraphs
/// - Headings
/// - Unordered lists
/// - Ordered lists
/// - Thematic breaks
/// - Images
///
/// Unsupported elements are displayed with a debug border to indicate
/// they are not yet implemented.
///
/// ## Example
///
/// ```swift
/// let document = Document(parsing: "# Hello\n\nThis is a paragraph.")
/// BlockView(blockContainer: document)
/// ```
///
/// ## Accessibility
///
/// When rendering list items, you can provide an optional accessibility qualifier
/// that will be appended to the last paragraph element. This helps screen readers
/// provide additional context about the list position.
struct BlockView: View {
    /// The block container whose children will be rendered.
    private let blockContainer: BlockContainer

    /// An optional accessibility label appended to the last element in a list item.
    ///
    /// When provided, this qualifier is added as an invisible accessibility element
    /// after the last paragraph, allowing screen readers to announce list position
    /// information (e.g., "item 1 of 5").
    private let accessibilityListElementQualifier: String?

    /// The fonts used for rendering Markdown content, obtained from the environment.
    @Environment(\.markdownFonts) var markdownFonts: MarkdownFonts

    /// Creates a new block view for the given block container.
    ///
    /// - Parameters:
    ///   - blockContainer: The block container whose children will be rendered.
    ///   - accessibilityListElementQualifier: An optional string that provides
    ///     additional context to screen readers about list item position.
    init(blockContainer: BlockContainer, accessibilityListElementQualifier: String? = nil) {
        self.blockContainer = blockContainer
        self.accessibilityListElementQualifier = accessibilityListElementQualifier
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(mappedChildren.enumerated()), id: \.offset) { offset, child in
                renderChild(child, at: offset)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    /// Renders a single child markup element at the specified offset.
    ///
    /// This method switches on the type of the child element and returns
    /// the appropriate view. Paragraphs receive additional top padding
    /// when they follow another paragraph or a heading.
    ///
    /// - Parameters:
    ///   - child: The markup element to render.
    ///   - offset: The index of the child within the block container.
    /// - Returns: A view representing the rendered child element.
    @ViewBuilder
    private func renderChild(_ child: Markup, at offset: Int) -> some View {
        switch child {
        case let blockContainer as MarkdownBlockInlineContainer:
            VStack(spacing: 0) {
                render(blockInlineContainer: blockContainer, isLastElement: offset + 1 == mappedChildren.count)
            }
            .if(isPreviousElementParagraph(index: offset)) {
                $0.padding(.top, 12.0)
            }
        case let inline as MarkdownInline:
            inline.view.font(markdownFonts.body)
                .background(.red)
        case let thematicBreak as Markdown.ThematicBreak:
            thematicBreak.view
        case let unorderedList as Markdown.UnorderedList:
            unorderedList.view
        case let orderedList as Markdown.OrderedList:
            orderedList.view
        case let image as Markdown.Image:
            image.view
        default:
            child.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }

    /// Determines whether the element at the previous index is a paragraph.
    ///
    /// Used to add spacing between consecutive paragraphs.
    ///
    /// - Parameter index: The current element's index.
    /// - Returns: `true` if the previous element is a paragraph; otherwise, `false`.
    private func isPreviousElementParagraph(index: Int) -> Bool {
        guard index > 0 else {
            return false
        }
        return mappedChildren[index - 1] is Markdown.Paragraph
    }

    /// Renders a block element that contains inline content.
    ///
    /// This method handles paragraphs and headings specifically.
    /// When rendering the last element with an accessibility qualifier,
    /// it appends an invisible accessibility element to provide
    /// additional context for screen readers.
    ///
    /// - Parameters:
    ///   - blockInlineContainer: The block element containing inline content.
    ///   - isLastElement: Whether this is the last element in the container.
    /// - Returns: A view representing the rendered block inline container.
    @ViewBuilder
    private func render(blockInlineContainer: MarkdownBlockInlineContainer, isLastElement: Bool = false) -> some View {
        switch blockInlineContainer {
        case let paragraph as Markdown.Paragraph:
            if isLastElement, let accessibilityListElementQualifier {
                VStack(spacing: 0) {
                    paragraph.view

                    // Invisible supplementary info
                    Color.clear
                        .frame(width: 0.1, height: 0.1)
                        .accessibilityElement()
                        .accessibilityLabel(accessibilityListElementQualifier)
                        .accessibilityHidden(false)
                }
                .accessibilityElement(children: .combine)
            } else {
                paragraph.view
            }
        case let heading as Markdown.Heading:
            heading.view
        default:
            blockInlineContainer.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }

    /// The block children of the container, mapped to an array for indexed access.
    private var mappedChildren: [Markup] {
        blockContainer.blockChildren.map(\.self)
    }
}
