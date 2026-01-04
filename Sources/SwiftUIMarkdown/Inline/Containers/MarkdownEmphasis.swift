//
//  MarkdownEmphasis.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that provides SwiftUI rendering support for Markdown emphasis elements.
///
/// This extension conforms ``Markdown/Emphasis`` to ``MarkdownInline`` and
/// ``MarkdownInlineContainer``, enabling emphasized (italic) text from parsed
/// Markdown to be rendered as SwiftUI ``SwiftUI/Text`` views.
///
/// ## Overview
///
/// When a Markdown document contains emphasis syntax (text surrounded by single
/// asterisks `*` or underscores `_`), this extension renders it as italic text
/// in SwiftUI.
///
/// For example, the Markdown text `*hello*` or `_hello_` will be rendered as
/// italic "hello" text.
///
/// ## See Also
///
/// - ``MarkdownInline``
/// - ``MarkdownInlineContainer``
@MainActor
extension Markdown.Emphasis: MarkdownInline, MarkdownInlineContainer {
    /// A SwiftUI text view representing this emphasis element.
    ///
    /// This property builds the view from the emphasis element's children
    /// using ``MarkdownInlineContainer/buildView()`` and applies the
    /// ``SwiftUI/Text/italic()`` modifier to render the text in italics.
    @ViewBuilder
    var view: SwiftUI.Text {
        buildView().italic()
    }
}
