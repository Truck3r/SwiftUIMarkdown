//
//  MarkdownInlineContainer.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A protocol for Markdown inline container elements that can be rendered as SwiftUI views.
///
/// Types conforming to this protocol represent Markdown elements that contain
/// other inline elements, such as emphasis, strong text, or links.
///
/// This protocol extends ``Markdown/InlineContainer`` and provides a default
/// implementation for building a SwiftUI `Text` view from the container's children.
protocol MarkdownInlineContainer: Markdown.InlineContainer {}

@MainActor
extension MarkdownInlineContainer {
    /// Builds a SwiftUI `Text` view by concatenating the views of all child elements.
    ///
    /// This method iterates through all children of the inline container and
    /// combines their text representations into a single `Text` view.
    ///
    /// - Returns: A `Text` view representing the concatenated content of all
    ///   child inline elements.
    ///
    /// - Note: Children that conform to ``MarkdownInline`` are rendered using
    ///   their `view` property. Children that don't conform to this protocol
    ///   are rendered using their `unsupported` fallback representation.
    func buildView() -> SwiftUI.Text {
        var text = SwiftUI.Text("")
        for child in children {
            if let leaf = child as? MarkdownInline {
                text += leaf.view
            } else {
                text += child.unsupported
            }
        }
        return text
    }
}
