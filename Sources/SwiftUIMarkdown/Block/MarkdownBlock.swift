//
//  MarkdownBlock.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A protocol that identifies block-level Markdown elements.
///
/// `MarkdownBlock` serves as a marker protocol for Markdown elements that represent
/// block-level content, such as paragraphs, headings, lists, and thematic breaks.
/// Block elements are structural components that typically occupy their own line
/// or section in the rendered output.
///
/// This protocol extends `Markup` from the swift-markdown package and is used
/// throughout the SwiftUIMarkdown framework to identify and process block-level
/// elements during rendering.
///
/// ## Conforming Types
///
/// The following Markdown element types conform to `MarkdownBlock`:
///
/// - ``Markdown/UnorderedList``
/// - ``Markdown/OrderedList``
/// - ``Markdown/ThematicBreak``
///
/// Additionally, types conforming to ``MarkdownBlockInlineContainer`` also
/// implicitly conform to `MarkdownBlock`.
///
/// ## See Also
///
/// - ``MarkdownBlockInlineContainer``
/// - ``MarkdownInline``
protocol MarkdownBlock: Markup {}
