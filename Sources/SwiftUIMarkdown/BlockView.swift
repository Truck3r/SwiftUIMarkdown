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
                ZStack {
                    if let blockContainer = child as? MarkdownBlockInlineContainer {
                        VStack(spacing: 0) {
                            render(blockInlineContainer: blockContainer, isLastElement: offset + 1 == mappedChildren.count)
                        }
                        .padding(if: isPreviousElementParagraph(index: offset)) {
                            $0.padding(.top, 12.0)
                        }
                    } else if let inline = child as? MarkdownInline {
                        inline.view.font(markdownFonts.body)
                            .background(.red)
                    } else if let thematicBreak = child as? Markdown.ThematicBreak {
                        thematicBreak.view
                    } else if let unorderedList = child as? Markdown.UnorderedList {
                        unorderedList.view
                    } else if let orderedList = child as? Markdown.OrderedList {
                        orderedList.view
                    } else if let image = child as? Markdown.Image {
                        image.view
                    } else {
                        child.unsupported
                            .padding(.vertical, 2.0)
                            .border(Color(red: 1.0, green: 0.6, blue: 0.6))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
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

extension View {
    @ViewBuilder
    func padding<Content: View>(if condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
