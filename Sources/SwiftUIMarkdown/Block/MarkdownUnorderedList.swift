//
//  MarkdownUnorderedList.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.UnorderedList: MarkdownBlock {
    @ViewBuilder
    var view: some SwiftUI.View {
        UnorderedListView(list: self)
    }

    @ViewBuilder
    private func render(blockInlineContainer: MarkdownBlockInlineContainer) -> some View {
        switch blockInlineContainer {
        case let paragraph as Markdown.Paragraph:
            paragraph.view
        case let heading as Markdown.Heading:
            heading.view
        default:
            blockInlineContainer.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }
}

private struct UnorderedListView: View {
    @Environment(\.markdownStyle) private var markdownStyle
    @Environment(\.markdownFonts) private var markdownFonts
    @Environment(\.markdownAccessibility) private var markdownAccessibility

    private let list: Markdown.UnorderedList

    init(list: Markdown.UnorderedList) {
        self.list = list
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { offset, item in
                HStack(alignment: .top) {
                    bulletFor(offset: offset)
                        .font(markdownFonts.body.monospaced())
                        .padding(.leading, 8.0)
                    BlockView(blockContainer: item, accessibilityListElementQualifier: markdownAccessibility.listCounter(offset + 1, elementCount))
                        .markdownStyle(bullets: String(markdownStyle.bullets.dropFirst()))
                }
                .padding(.bottom, 4.0)
            }
            Color.clear // announce end of list
                .frame(width: 0.1, height: 0.1)
                .accessibilityElement()
                .accessibilityLabel(markdownAccessibility.listEnd())
                .accessibilityHidden(false)
        }
    }

    private func bulletFor(offset: Int) -> SwiftUI.Text {
        if offset == 0 {
            return SwiftUI.Text(bullet)
                .accessibilityLabel("\(bullet), \(markdownAccessibility.listBegin())")
        } else {
            return SwiftUI.Text(bullet)
        }
    }

    private var elementCount: Int {
        Array(list.listItems).count
    }

    var bullet: String {
        guard let first = markdownStyle.bullets.first else {
            return "•"
        }
        return String(first)
    }
}
