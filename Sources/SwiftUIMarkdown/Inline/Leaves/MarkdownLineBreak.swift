//
//  MarkdownLineBreak.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.LineBreak: MarkdownInline {
    @ViewBuilder
    var view: SwiftUI.Text {
        Text("\n")
    }
}
