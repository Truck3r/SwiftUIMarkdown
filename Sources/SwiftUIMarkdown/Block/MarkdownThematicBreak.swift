//
//  MarkdownThematicBreak.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.ThematicBreak: MarkdownBlock {
    @ViewBuilder
    var view: some SwiftUI.View {
        SwiftUI.Divider()
            .padding(.vertical, 4.0)
    }
}
