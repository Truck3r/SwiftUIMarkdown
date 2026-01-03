//
//  MarkdownEmphasis.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.Emphasis: MarkdownInline, MarkdownInlineContainer {
    @ViewBuilder
    var view: SwiftUI.Text {
        buildView().italic()
    }
}
