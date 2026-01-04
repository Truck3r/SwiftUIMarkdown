//
//  MarkdownView.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

public struct MarkdownView: View {
    private let document: Document

    @Environment(\.markdownDebug) private var debugEnabled

    public init(_ markdownText: String) {
        document = Document(parsing: markdownText)
    }

    public var body: some View {
        BlockView(blockContainer: document)
            .background(debugEnabled ? Color.yellow.opacity(0.7) : nil)
    }
}

#Preview {
    ScrollView {
        MarkdownView("Hello world!!")
            .padding()
            .environment(\.openURL, OpenURLAction { url in
                print("Handled the URL: \(url)")
                return .handled
            })
    }
    .markdownFonts(body: .title,
                   heading1: .largeTitle,
                   heading2: .title,
                   heading3: .title2,
                   heading4: .title3,
                   heading5: .headline,
                   heading6: .subheadline)
    .markdownStyle(linkColor: .red,
                   bullets: "-+*o")

    // .environment(\.markdownAccessibilitySupport, MarkdownAccessibilitySupport(listBegin: { "list start" }, listCounter: { "\($0) of \($1)" }, listEnd: { "list end" }))
}
