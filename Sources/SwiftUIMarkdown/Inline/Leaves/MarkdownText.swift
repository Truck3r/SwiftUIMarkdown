//
//  MarkdownText.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.Text: MarkdownInline {
    /// A SwiftUI `Text` view representing the plain text content of this Markdown text element.
    ///
    /// This property converts the Markdown `Text` node's string content into a SwiftUI `Text` view,
    /// allowing it to be rendered as part of a SwiftUI view hierarchy.
    ///
    /// - Returns: A `Text` view displaying the raw string content of this Markdown text node.
    @ViewBuilder
    var view: SwiftUI.Text {
        Text(string)
    }
}
