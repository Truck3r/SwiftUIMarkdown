//
//  MarkdownBlockInlineContainer.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A protocol for block-level Markdown elements that contain inline content.
///
/// `MarkdownBlockInlineContainer` combines the characteristics of both
/// ``MarkdownBlock`` and ``MarkdownInlineContainer``, representing block-level
/// elements that can contain inline children such as text, emphasis, links, and images.
///
/// Common examples of block inline containers include paragraphs and headings,
/// which are structural block elements that contain formatted inline text.
///
/// ## Overview
///
/// Types conforming to this protocol inherit:
/// - Block-level semantics from ``MarkdownBlock``
/// - The ability to build SwiftUI `Text` views from inline children via ``MarkdownInlineContainer``
///
/// ## Conforming Types
///
/// The following Markdown element types conform to `MarkdownBlockInlineContainer`:
///
/// - ``Markdown/Paragraph``
/// - ``Markdown/Heading``
///
/// ## Example
///
/// When rendering Markdown content, block inline containers are typically
/// rendered as `Text` views with appropriate styling:
///
/// ```swift
/// switch child {
/// case let paragraph as Markdown.Paragraph:
///     paragraph.view
/// case let heading as Markdown.Heading:
///     heading.view
/// default:
///     // Handle other block types
/// }
/// ```
///
/// ## See Also
///
/// - ``MarkdownBlock``
/// - ``MarkdownInlineContainer``
/// - ``MarkdownInline``
protocol MarkdownBlockInlineContainer: MarkdownBlock, MarkdownInlineContainer {}
