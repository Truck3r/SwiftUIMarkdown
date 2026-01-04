//
//  MarkdownDebug.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

// MARK: - Environment setup

/// An environment key that controls whether debug mode is enabled for Markdown rendering.
///
/// Use this key to access the underlying storage for the ``EnvironmentValues/markdownDebug`` property.
struct MarkdownDebugKey: EnvironmentKey {
    static let defaultValue = false
}

@MainActor
public extension EnvironmentValues {
    /// A Boolean value that indicates whether debug mode is enabled for Markdown rendering.
    ///
    /// When set to `true`, Markdown views may display additional diagnostic information
    /// to help with debugging layout or rendering issues.
    ///
    /// The default value is `false`.
    ///
    /// ## Setting the Debug Mode
    ///
    /// You can enable debug mode for a view hierarchy using the `environment(_:_:)` modifier:
    ///
    /// ```swift
    /// MarkdownView(content: "# Hello, World!")
    ///     .environment(\.markdownDebug, true)
    /// ```
    ///
    /// ## Reading the Debug Mode
    ///
    /// To read the current debug mode value within a view, use the `@Environment` property wrapper:
    ///
    /// ```swift
    /// struct MyMarkdownView: View {
    ///     @Environment(\.markdownDebug) private var isDebugEnabled
    ///
    ///     var body: some View {
    ///         // Use isDebugEnabled to conditionally show debug information
    ///     }
    /// }
    /// ```
    var markdownDebug: Bool {
        get { self[MarkdownDebugKey.self] }
        set { self[MarkdownDebugKey.self] = newValue }
    }
}
