//
//  MarkdownInlineContainer.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

protocol MarkdownInlineContainer: Markdown.InlineContainer {
}

@MainActor
extension MarkdownInlineContainer {
    func buildView() -> SwiftUI.Text {
        var text = SwiftUI.Text("")
        children.forEach { child in
            if let leaf = child as? MarkdownInline {
                text += leaf.view
            } else {
                text += child.unsupported
            }
        }
        return text
    }
}
