//
//  MarkdownInline.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
protocol MarkdownInline: Markup {
    @ViewBuilder
    var view: SwiftUI.Text { get }
}
