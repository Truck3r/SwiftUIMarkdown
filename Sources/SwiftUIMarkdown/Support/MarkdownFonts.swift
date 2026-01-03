//
//  MarkdownFonts.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

public extension View {
    /// Apply a complete MarkdownFonts
    internal func markdownFonts(_ fonts: MarkdownFonts) -> some View {
        environment(\.markdownFonts, fonts)
    }

    /// Override selected fonts values (others fall back to defaults)
    func markdownFonts(
        body: Font? = nil,
        heading1: Font? = nil,
        heading2: Font? = nil,
        heading3: Font? = nil,
        heading4: Font? = nil,
        heading5: Font? = nil,
        heading6: Font? = nil
    ) -> some View {
        modifier(MarkdownFontsOverride(
            body: body,
            heading1: heading1,
            heading2: heading2,
            heading3: heading3,
            heading4: heading4,
            heading5: heading5,
            heading6: heading6
        ))
    }
}

struct MarkdownFonts {
    private enum Defaults {
        static let body: Font = .body
        static let heading1: Font = .largeTitle
        static let heading2: Font = .title
        static let heading3: Font = .title2
        static let heading4: Font = .title3
        static let heading5: Font = .headline
        static let heading6: Font = .subheadline
    }

    var body: Font
    var heading1: Font
    var heading2: Font
    var heading3: Font
    var heading4: Font
    var heading5: Font
    var heading6: Font

    init(
        body: Font? = Defaults.body,
        heading1: Font? = Defaults.heading1,
        heading2: Font? = Defaults.heading2,
        heading3: Font? = Defaults.heading3,
        heading4: Font? = Defaults.heading4,
        heading5: Font? = Defaults.heading5,
        heading6: Font? = Defaults.heading6
    ) {
        self.body = body ?? Defaults.body
        self.heading1 = heading1 ?? Defaults.heading1
        self.heading2 = heading2 ?? Defaults.heading2
        self.heading3 = heading3 ?? Defaults.heading3
        self.heading4 = heading4 ?? Defaults.heading4
        self.heading5 = heading5 ?? Defaults.heading5
        self.heading6 = heading6 ?? Defaults.heading6
    }
}

// - MARK: Environment setup
private struct MarkdownFontsKey: EnvironmentKey {
    static let defaultValue = MarkdownFonts()
}

extension EnvironmentValues {
    var markdownFonts: MarkdownFonts {
        get { self[MarkdownFontsKey.self] }
        set { self[MarkdownFontsKey.self] = newValue }
    }
}

private struct MarkdownFontsOverride: ViewModifier {
    @Environment(\.markdownFonts) private var current

    let body: Font?
    let heading1: Font?
    let heading2: Font?
    let heading3: Font?
    let heading4: Font?
    let heading5: Font?
    let heading6: Font?

    func body(content: Content) -> some View {
        let merged = MarkdownFonts(
            body: body ?? current.body,
            heading1: heading1 ?? current.heading1,
            heading2: heading2 ?? current.heading2,
            heading3: heading3 ?? current.heading3,
            heading4: heading4 ?? current.heading4,
            heading5: heading5 ?? current.heading5,
            heading6: heading6 ?? current.heading6
        )
        return content.environment(\.markdownFonts, merged)
    }
}
