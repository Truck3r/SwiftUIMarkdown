//
//  MarkdownOrderedList.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.OrderedList: MarkdownBlock {
    @ViewBuilder
    var view: some SwiftUI.View {
        OrderedListView(list: self)
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

private struct OrderedListView: View {
    @Environment(\.markdownStyle) private var markdownStyle
    @Environment(\.markdownAccessibility) private var markdownAccessibility
    @ScaledMetric(relativeTo: .body) private var indent: CGFloat = 10.0

    private let list: Markdown.OrderedList

    init(list: Markdown.OrderedList) {
        self.list = list
        let maxnumber = Int(list.startIndex) + list.listItems.underestimatedCount
        _indent = .init(wrappedValue: 5.0 + 12.0 * CGFloat(String(maxnumber).count), relativeTo: .body)
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { offset, item in
                HStack(alignment: .top) {
                    bullet("\(UInt(offset) + list.startIndex)", offset: offset)
                        .frame(width: indent, alignment: .trailing)
                    BlockView(blockContainer: item,
                              accessibilityListElementQualifier: markdownAccessibility.listCounter(offset + 1, elementCount))
                        .markdownStyle(bullets: String(markdownStyle.bullets.dropFirst()))
                }
                .padding(.leading, 8.0)
                .padding(.bottom, 4.0)
            }
            Color.clear // announce end of list
                .frame(width: 0.1, height: 0.1)
                .accessibilityElement()
                .accessibilityLabel(markdownAccessibility.listEnd())
                .accessibilityHidden(false)
        }
    }

    private var elementCount: Int {
        Array(list.listItems).count
    }

    private func bullet(_ text: String, offset: Int) -> some View {
        if offset == 0 {
            Text("\(text).")
                .accessibilityLabel("\(text), \(markdownAccessibility.listBegin())")
        } else {
            Text("\(text).")
                .accessibilityLabel("\(text)")
        }
    }
}
