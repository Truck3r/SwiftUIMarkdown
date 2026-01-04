//
//  MarkdownFonts.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

public extension View {
    /// Applies a complete ``MarkdownFonts`` configuration to the view hierarchy.
    ///
    /// - Parameter fonts: The ``MarkdownFonts`` configuration to apply.
    /// - Returns: A view with the specified markdown fonts applied.
    internal func markdownFonts(_ fonts: MarkdownFonts) -> some View {
        environment(\.markdownFonts, fonts)
    }

    /// Customizes the fonts used for rendering Markdown content.
    ///
    /// Use this modifier to override specific font values while allowing others
    /// to fall back to their defaults or previously set values in the environment.
    ///
    /// ```swift
    /// MarkdownView(content: "# Hello World")
    ///     .markdownFonts(
    ///         heading1: .system(size: 32, weight: .bold),
    ///         body: .system(size: 14)
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - body: The font for body text. Defaults to `Font.body`.
    ///   - heading1: The font for level 1 headings (`#`). Defaults to `Font.largeTitle`.
    ///   - heading2: The font for level 2 headings (`##`). Defaults to `Font.title`.
    ///   - heading3: The font for level 3 headings (`###`). Defaults to `Font.title2`.
    ///   - heading4: The font for level 4 headings (`####`). Defaults to `Font.title3`.
    ///   - heading5: The font for level 5 headings (`#####`). Defaults to `Font.headline`.
    ///   - heading6: The font for level 6 headings (`######`). Defaults to `Font.subheadline`.
    /// - Returns: A view with the specified markdown fonts applied.
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

/// A configuration type that defines fonts for rendering Markdown content.
///
/// `MarkdownFonts` provides a centralized way to customize the typography
/// used when displaying Markdown elements. Each heading level and body text
/// can have its own font specification.
///
/// ## Default Font Mappings
///
/// | Markdown Element | Default Font |
/// |-----------------|--------------|
/// | Body text | `.body` |
/// | Heading 1 (`#`) | `.largeTitle` |
/// | Heading 2 (`##`) | `.title` |
/// | Heading 3 (`###`) | `.title2` |
/// | Heading 4 (`####`) | `.title3` |
/// | Heading 5 (`#####`) | `.headline` |
/// | Heading 6 (`######`) | `.subheadline` |
///
/// ## Topics
///
/// ### Creating Font Configurations
///
/// - ``init(body:heading1:heading2:heading3:heading4:heading5:heading6:)``
///
/// ### Font Properties
///
/// - ``body``
/// - ``heading1``
/// - ``heading2``
/// - ``heading3``
/// - ``heading4``
/// - ``heading5``
/// - ``heading6``
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

    /// The font used for body text in Markdown content.
    var body: Font

    /// The font used for level 1 headings (`#`).
    var heading1: Font

    /// The font used for level 2 headings (`##`).
    var heading2: Font

    /// The font used for level 3 headings (`###`).
    var heading3: Font

    /// The font used for level 4 headings (`####`).
    var heading4: Font

    /// The font used for level 5 headings (`#####`).
    var heading5: Font

    /// The font used for level 6 headings (`######`).
    var heading6: Font

    /// Creates a new Markdown fonts configuration.
    ///
    /// Any parameter set to `nil` will use its default value.
    ///
    /// - Parameters:
    ///   - body: The font for body text. Defaults to `Font.body`.
    ///   - heading1: The font for level 1 headings. Defaults to `Font.largeTitle`.
    ///   - heading2: The font for level 2 headings. Defaults to `Font.title`.
    ///   - heading3: The font for level 3 headings. Defaults to `Font.title2`.
    ///   - heading4: The font for level 4 headings. Defaults to `Font.title3`.
    ///   - heading5: The font for level 5 headings. Defaults to `Font.headline`.
    ///   - heading6: The font for level 6 headings. Defaults to `Font.subheadline`.
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
    /// The current Markdown fonts configuration in the environment.
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
