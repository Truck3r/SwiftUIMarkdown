//
//  MarkdownView.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// A SwiftUI view that renders Markdown-formatted text.
///
/// Use `MarkdownView` to display rich text content parsed from Markdown syntax.
/// The view automatically converts Markdown elements like headings, emphasis,
/// links, and lists into native SwiftUI views.
///
/// ## Overview
///
/// Create a `MarkdownView` by passing a string containing Markdown-formatted text:
///
/// ```swift
/// MarkdownView("# Hello World\n\nThis is **bold** and *italic* text.")
/// ```
///
/// ## Customizing Appearance
///
/// You can customize the appearance of rendered Markdown using environment modifiers:
///
/// ### Fonts
///
/// Use ``SwiftUI/View/markdownFonts(body:heading1:heading2:heading3:heading4:heading5:heading6:)``
/// to customize the fonts used for body text and headings:
///
/// ```swift
/// MarkdownView(content)
///     .markdownFonts(
///         body: .body,
///         heading1: .largeTitle,
///         heading2: .title
///     )
/// ```
///
/// ### Link Styling
///
/// Use ``SwiftUI/View/markdownStyle(linkColor:bullets:)`` to customize link colors
/// and bullet characters:
///
/// ```swift
/// MarkdownView(content)
///     .markdownStyle(linkColor: .blue, bullets: "•-*")
/// ```
///
/// ### Debugging
///
/// Enable debug mode to visualize the view's bounds:
///
/// ```swift
/// MarkdownView(content)
///     .environment(\.markdownDebug, true)
/// ```
///
/// ## Topics
///
/// ### Creating a Markdown View
///
/// - ``init(_:)``
public struct MarkdownView: View {
    /// The parsed Markdown document.
    private let document: Document

    @Environment(\.markdownDebug) private var debugEnabled

    /// Creates a new Markdown view with the specified Markdown text.
    ///
    /// The initializer parses the provided Markdown string into a document
    /// structure that is then rendered as SwiftUI views.
    ///
    /// - Parameter markdownText: A string containing Markdown-formatted text
    ///   to be rendered.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let markdown = """
    /// # Welcome
    ///
    /// This is a paragraph with **bold** and *italic* text.
    ///
    /// - Item 1
    /// - Item 2
    /// """
    ///
    /// MarkdownView(markdown)
    /// ```
    public init(_ markdownText: String) {
        document = Document(parsing: markdownText)
        if debugEnabled {
            print(document.debugDescription())
        }
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
