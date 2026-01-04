//
//  MarkdownLink.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.Link: MarkdownInline {
    // This is a bit weird. To get the link rendered inline with the text, we need to recreate the Markdown formatted link and put it through an AttributedString.
    // The trick is that AttributedString + SwiftUI.Text handles primitive markdown - not Images, Headings, Tables etc., but simple inline content.
    @ViewBuilder
    var view: SwiftUI.Text {
        text.underline()
    }

    var text: SwiftUI.Text {
        if let attributed = try? AttributedString(markdown: makeLinkText()) {
            return SwiftUI.Text(attributed)
        } else {
            return SwiftUI.Text(makeLinkText())
        }
    }

    private func makeLinkText() -> String {
        var linkText = "[\(plainText)]"
        if let destination {
            let linkTitle = title == nil ? "" : " \"\(title ?? "")\""
            linkText += "(\(destination)\(linkTitle))"
        }
        return linkText
    }
}
