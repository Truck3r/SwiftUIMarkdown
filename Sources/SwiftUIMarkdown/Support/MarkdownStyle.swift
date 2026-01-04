//
//  MarkdownStyle.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

public extension View {
    /// Applies a complete ``MarkdownStyle`` to the view hierarchy.
    ///
    /// Use this modifier to set all markdown styling options at once.
    ///
    /// - Parameter style: The ``MarkdownStyle`` to apply.
    /// - Returns: A view with the specified markdown style applied.
    internal func markdownStyle(_ style: MarkdownStyle) -> some View {
        environment(\.markdownStyle, style)
    }

    /// Customizes the appearance of rendered markdown content.
    ///
    /// Use this modifier to override specific markdown styling options while
    /// preserving other values from the current environment. Any parameters
    /// left as `nil` will inherit their values from the parent view's style.
    ///
    /// ```swift
    /// MarkdownView("Check out [SwiftUI](https://apple.com)")
    ///     .markdownStyle(linkColor: .purple)
    /// ```
    ///
    /// You can also customize bullet characters for unordered lists:
    ///
    /// ```swift
    /// MarkdownView("""
    /// - First item
    ///   - Nested item
    ///     - Deeply nested
    /// """)
    /// .markdownStyle(bullets: "→-*")
    /// ```
    ///
    /// - Parameters:
    ///   - linkColor: The color to use for hyperlinks. Pass `nil` to use the
    ///     inherited value or the default (blue).
    ///   - bullets: A string of characters to use as bullet points for unordered
    ///     lists. Each character corresponds to a nesting level. Pass `nil` to
    ///     use the inherited value or the default (`"•◦▪︎▫"`).
    /// - Returns: A view with the specified markdown style overrides applied.
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

/// A configuration object that defines the visual appearance of rendered markdown.
///
/// `MarkdownStyle` provides customization options for how markdown content
/// is displayed, including link colors and bullet point characters.
///
/// ## Overview
///
/// You typically don't create a `MarkdownStyle` directly. Instead, use the
/// ``SwiftUICore/View/markdownStyle(linkColor:bullets:)`` modifier to customize
/// markdown rendering in your views.
///
/// ## Topics
///
/// ### Style Properties
/// - ``linkColor``
/// - ``bullets``
struct MarkdownStyle {
    /// Default values for markdown styling.
    private enum Defaults {
        /// The default link color (blue).
        static let linkColor: Color = .blue
        /// The default bullet characters for nested list levels.
        static let bullets: String = "•◦▪︎▫"
    }

    /// The color used to render hyperlinks in markdown content.
    ///
    /// Defaults to ``SwiftUICore/Color/blue``.
    var linkColor: Color

    /// The characters used as bullet points for unordered lists.
    ///
    /// Each character in this string corresponds to a nesting level in the list.
    /// For example, with the default value `"•◦▪︎▫"`:
    /// - Top-level items use `•`
    /// - Second-level items use `◦`
    /// - Third-level items use `▪︎`
    /// - Fourth-level and deeper items use `▫`
    ///
    /// When the nesting level exceeds the number of characters, the last
    /// character is repeated.
    var bullets: String

    /// Creates a new markdown style with the specified configuration.
    ///
    /// - Parameters:
    ///   - linkColor: The color for hyperlinks. Defaults to blue.
    ///   - bullets: The bullet characters for list items. Defaults to `"•◦▪︎▫"`.
    init(
        linkColor: Color? = Defaults.linkColor,
        bullets: String? = Defaults.bullets
    ) {
        self.linkColor = linkColor ?? Defaults.linkColor
        self.bullets = bullets ?? Defaults.bullets
    }
}

// MARK: - Environment Setup

/// The environment key for accessing the current markdown style.
private struct MarkdownStyleKey: EnvironmentKey {
    static let defaultValue = MarkdownStyle()
}

extension EnvironmentValues {
    /// The markdown style to use when rendering markdown content.
    ///
    /// You can read this value from within a view to access the current
    /// markdown styling configuration:
    ///
    /// ```swift
    /// @Environment(\.markdownStyle) private var style
    /// ```
    var markdownStyle: MarkdownStyle {
        get { self[MarkdownStyleKey.self] }
        set { self[MarkdownStyleKey.self] = newValue }
    }
}

/// A view modifier that merges style overrides with the current environment style.
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
