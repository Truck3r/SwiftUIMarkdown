//
//  MarkdownStrikethrough.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that provides SwiftUI rendering support for Markdown strikethrough elements.
///
/// This extension conforms ``Markdown/Strikethrough`` to ``MarkdownInline`` and
/// ``MarkdownInlineContainer``, enabling strikethrough text from parsed Markdown
/// to be rendered as SwiftUI ``SwiftUI/Text`` views with the strikethrough modifier applied.
///
/// ## Example
///
/// In Markdown, strikethrough text is typically written using double tildes:
///
/// ```markdown
/// This is ~~deleted~~ text.
/// ```
///
/// When rendered, the text between the tildes will appear with a horizontal line through it.
@MainActor
extension Markdown.Strikethrough: MarkdownInline, MarkdownInlineContainer {
    /// A SwiftUI text view representing the strikethrough content.
    ///
    /// This property builds the view from the strikethrough element's inline children
    /// and applies the ``SwiftUI/Text/strikethrough(_:pattern:color:)`` modifier
    /// to render the text with a line through it.
    @ViewBuilder
    var view: SwiftUI.Text {
        buildView().strikethrough()
    }
}
