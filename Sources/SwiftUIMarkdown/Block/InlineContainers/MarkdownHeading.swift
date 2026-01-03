//
//  MarkdownHeading.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

extension Heading: @retroactive BlockContainer {}
@MainActor
extension Markdown.Heading: MarkdownBlockInlineContainer {
    @ViewBuilder
    var view: some SwiftUI.View {
        VStack(alignment: .leading, spacing: 0.0) {
            HeadingView(level: self.level) {
                buildView()
            }
            .accessibilityAddTraits(.isHeader)
            .padding(.bottom, 8.0)
        }
    }
}

private struct HeadingView: View {
    @Environment(\.markdownFonts) private var markdownFonts

    private let level: Int

    init(level: Int, content: @escaping () -> SwiftUI.Text) {
        self.level = level
        self.content = content
    }

    let content: () -> SwiftUI.Text

    var body: some View {
        switch level {
        case 1:
            return content().font(markdownFonts.heading1)
        case 2:
            return content().font(markdownFonts.heading2)
        case 3:
            return content().font(markdownFonts.heading3)
        case 4:
            return content().font(markdownFonts.heading4)
        case 5:
            return content().font(markdownFonts.heading5)
        case 6:
            return content().font(markdownFonts.heading6)
        default:
            return SwiftUI.Text("[Heading]").foregroundColor(.gray) + Text(" level \(level)")
        }
    }
}
