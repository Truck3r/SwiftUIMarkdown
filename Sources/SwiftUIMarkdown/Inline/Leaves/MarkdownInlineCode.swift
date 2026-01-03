//
//  MarkdownInlineCode.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.InlineCode: MarkdownInline {
    @ViewBuilder
    var view: SwiftUI.Text {
        internalText
    }

    private var internalText: SwiftUI.Text {
        if #available(iOS 16.4, *) {
            Text(code).monospaced()
        } else {
            Text(code).font(.system(.body, design: .monospaced))

        }
    }
}

