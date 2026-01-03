//
//  MarkdownStyle.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

public extension View {
    /// Apply a complete MarkdownStyle
    internal func markdownStyle(_ style: MarkdownStyle) -> some View {
        environment(\.markdownStyle, style)
    }

    /// Override selected style values (others fall back to defaults)
    func markdownStyle(
        linkColor: Color? = nil,
        bullets: String? = nil
    ) -> some View {
        modifier(MarkdownStyleOverride(
            linkColor: linkColor,
            bullets: bullets
        ))
    }
}

struct MarkdownStyle {
    private enum Defaults {
        static let linkColor: Color = .blue
        static let bullets: String = "•◦▪︎▫"
    }

    var linkColor: Color
    var bullets: String

    init(
        linkColor: Color? = Defaults.linkColor,
        bullets: String? = Defaults.bullets
    ) {
        self.linkColor = linkColor ?? Defaults.linkColor
        self.bullets = bullets ?? Defaults.bullets
    }
}

// - MARK: Environment setup
private struct MarkdownStyleKey: EnvironmentKey {
    static let defaultValue = MarkdownStyle()
}

extension EnvironmentValues {
    var markdownStyle: MarkdownStyle {
        get { self[MarkdownStyleKey.self] }
        set { self[MarkdownStyleKey.self] = newValue }
    }
}

private struct MarkdownStyleOverride: ViewModifier {
    @Environment(\.markdownStyle) private var current

    let linkColor: Color?
    let bullets: String?

    func body(content: Content) -> some View {
        let merged = MarkdownStyle(
            linkColor: linkColor ?? current.linkColor,
            bullets: bullets ?? current.bullets
        )
        return content.environment(\.markdownStyle, merged)
    }
}
