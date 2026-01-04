//
//  MarkdownThematicBreak.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// Extends `Markdown.ThematicBreak` to conform to ``MarkdownBlock`` and provide
/// SwiftUI rendering capabilities.
///
/// This extension enables thematic breaks (horizontal rules) from parsed Markdown
/// content to be rendered as native SwiftUI `Divider` views. Thematic breaks are
/// used to create visual separation between sections of content.
///
/// ## Overview
///
/// When a Markdown document contains a thematic break, such as:
///
/// ```markdown
/// Some content above
///
/// ---
///
/// Some content below
/// ```
///
/// This extension provides the `view` property that renders it as a SwiftUI
/// `Divider` with appropriate vertical padding.
///
/// ## Markdown Syntax
///
/// Thematic breaks can be created in Markdown using any of the following:
/// - Three or more hyphens: `---`
/// - Three or more asterisks: `***`
/// - Three or more underscores: `___`
///
/// ## Example
///
/// ```swift
/// let markdown = """
/// First section
///
/// ---
///
/// Second section
/// """
/// let document = Document(parsing: markdown)
/// BlockView(blockContainer: document)
/// ```
///
/// ## See Also
///
/// - ``MarkdownBlock``
/// - ``BlockView``
@MainActor
extension Markdown.ThematicBreak: MarkdownBlock {
    /// A SwiftUI view that renders this thematic break as a horizontal divider.
    ///
    /// The view displays a standard SwiftUI `Divider` with 4 points of vertical
    /// padding on both top and bottom to provide visual separation from
    /// surrounding content.
    @ViewBuilder
    var view: some SwiftUI.View {
        SwiftUI.Divider()
            .padding(.vertical, 4.0)
    }
}
