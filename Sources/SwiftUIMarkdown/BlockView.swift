//
//  BlockView.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

struct BlockView: View {
    private let blockContainer: BlockContainer

    private let accessibilityListElementQualifier: String?

    @Environment(\.markdownFonts) var markdownFonts: MarkdownFonts

    init(blockContainer: BlockContainer, accessibilityListElementQualifier: String? = nil) {
        self.blockContainer = blockContainer
        self.accessibilityListElementQualifier = accessibilityListElementQualifier
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(mappedChildren.enumerated()), id: \.offset) { offset, child in
                renderChild(child, at: offset)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private func renderChild(_ child: Markup, at offset: Int) -> some View {
        switch child {
        case let blockContainer as MarkdownBlockInlineContainer:
            VStack(spacing: 0) {
                render(blockInlineContainer: blockContainer, isLastElement: offset + 1 == mappedChildren.count)
            }
            .if(isPreviousElementParagraph(index: offset)) {
                $0.padding(.top, 12.0)
            }
        case let inline as MarkdownInline:
            inline.view.font(markdownFonts.body)
                .background(.red)
        case let thematicBreak as Markdown.ThematicBreak:
            thematicBreak.view
        case let unorderedList as Markdown.UnorderedList:
            unorderedList.view
        case let orderedList as Markdown.OrderedList:
            orderedList.view
        case let image as Markdown.Image:
            image.view
        default:
            child.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }

    private func isPreviousElementParagraph(index: Int) -> Bool {
        guard index > 0 else {
            return false
        }
        return mappedChildren[index - 1] is Markdown.Paragraph
    }

    @ViewBuilder
    private func render(blockInlineContainer: MarkdownBlockInlineContainer, isLastElement: Bool = false) -> some View {
        switch blockInlineContainer {
        case let paragraph as Markdown.Paragraph:
            if isLastElement, let accessibilityListElementQualifier {
                VStack(spacing: 0) {
                    paragraph.view

                    // Invisible supplementary info
                    Color.clear
                        .frame(width: 0.1, height: 0.1)
                        .accessibilityElement()
                        .accessibilityLabel(accessibilityListElementQualifier)
                        .accessibilityHidden(false)
                }
                .accessibilityElement(children: .combine)
            } else {
                paragraph.view
            }
        case let heading as Markdown.Heading:
            heading.view
        default:
            blockInlineContainer.unsupported
                .padding(.vertical, 2.0)
                .border(Color(red: 1.0, green: 0.6, blue: 0.6))
        }
    }

    private var mappedChildren: [Markup] {
        blockContainer.blockChildren.map(\.self)
    }
}
