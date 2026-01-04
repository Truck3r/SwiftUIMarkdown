//
//  MarkdownAccessibility.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

/// A configuration type that provides accessibility labels for Markdown list elements.
///
/// Use `MarkdownAccessibility` to customize how VoiceOver and other assistive technologies
/// announce list structures in your Markdown content. This allows you to provide localized
/// and context-appropriate descriptions for list navigation.
///
/// ## Overview
///
/// The accessibility configuration consists of three closures that generate strings for:
/// - The beginning of a list
/// - Each item's position within the list
/// - The end of a list
///
/// ## Example
///
/// ```swift
/// let accessibility = MarkdownAccessibility(
///     listBegin: { "List with items:" },
///     listCounter: { index, total in "Item \(index) of \(total)" },
///     listEnd: { "End of list" }
/// )
/// ```
///
/// To apply this configuration to your Markdown views, use the environment modifier:
///
/// ```swift
/// MarkdownView(content: markdownString)
///     .environment(\.markdownAccessibility, accessibility)
/// ```
public struct MarkdownAccessibility: Sendable {
    /// A closure that returns a string to announce at the beginning of a list.
    public let listBegin: @Sendable () -> String
    
    /// A closure that returns a string describing an item's position within a list.
    ///
    /// - Parameters:
    ///   - index: The current item's one-based index in the list.
    ///   - total: The total number of items in the list.
    /// - Returns: A localized string describing the item's position.
    public let listCounter: @Sendable (Int, Int) -> String
    
    /// A closure that returns a string to announce at the end of a list.
    public let listEnd: @Sendable () -> String

    /// Creates a new Markdown accessibility configuration.
    ///
    /// - Parameters:
    ///   - listBegin: A closure that returns a string to announce at the beginning of a list.
    ///   - listCounter: A closure that returns a string describing an item's position.
    ///     The closure receives the current one-based index and the total count of items.
    ///   - listEnd: A closure that returns a string to announce at the end of a list.
    public init(
        listBegin: @escaping @Sendable () -> String,
        listCounter: @escaping @Sendable (Int, Int) -> String,
        listEnd: @escaping @Sendable () -> String
    ) {
        self.listBegin = listBegin
        self.listCounter = listCounter
        self.listEnd = listEnd
    }
}

// MARK: - Environment setup

/// The environment key for storing the Markdown accessibility configuration.
struct MarkdownAccessibilityKey: EnvironmentKey {
    static let defaultValue = MarkdownAccessibility(
        listBegin: { "" },
        listCounter: { _, _ in "" },
        listEnd: { "" }
    )
}

@MainActor
public extension EnvironmentValues {
    /// The accessibility configuration for Markdown list elements.
    ///
    /// Use this environment value to provide custom accessibility labels for lists
    /// rendered by Markdown views. The default value provides empty strings, which
    /// means no additional accessibility announcements are made.
    ///
    /// ```swift
    /// MarkdownView(content: "- Item 1\n- Item 2")
    ///     .environment(\.markdownAccessibility, MarkdownAccessibility(
    ///         listBegin: { "Beginning of list" },
    ///         listCounter: { index, total in "\(index) of \(total)" },
    ///         listEnd: { "End of list" }
    ///     ))
    /// ```
    var markdownAccessibility: MarkdownAccessibility {
        get { self[MarkdownAccessibilityKey.self] }
        set { self[MarkdownAccessibilityKey.self] = newValue }
    }
}
