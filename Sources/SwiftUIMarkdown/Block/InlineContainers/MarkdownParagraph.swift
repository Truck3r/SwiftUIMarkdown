//
//  MarkdownParagraph.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Paragraph: @retroactive BlockContainer {}
@MainActor
extension Markdown.Paragraph: MarkdownBlockInlineContainer {
    @ViewBuilder
    var view: some SwiftUI.View {
        ParagraphView {
            buildView()
        }
        .padding(.bottom, 4)
    }
}

private struct ParagraphView: View {
    @Environment(\.markdownFonts) private var markdownFonts

    init(content: @escaping () -> SwiftUI.Text) {
        self.content = content
    }

    let content: () -> SwiftUI.Text

    var body: some View {
        content()
            .font(markdownFonts.body)
            .lineSpacing(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
