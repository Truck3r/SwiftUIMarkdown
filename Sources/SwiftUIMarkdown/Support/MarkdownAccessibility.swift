//
//  MarkdownAccessibility.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

public struct MarkdownAccessibility: Sendable {
    public let listBegin: @Sendable () -> String
    public let listCounter: @Sendable (Int, Int) -> String
    public let listEnd: @Sendable () -> String

    public init(listBegin: @escaping @Sendable () -> String, listCounter: @escaping @Sendable (Int, Int) -> String, listEnd: @escaping @Sendable () -> String) {
        self.listBegin = listBegin
        self.listCounter = listCounter
        self.listEnd = listEnd
    }
}

// - MARK: Environment setup
struct MarkdownAccessibilityKey: EnvironmentKey {
    static let defaultValue = MarkdownAccessibility(listBegin: { "" }, listCounter: { _, _ in "" }, listEnd: { "" })
}

@MainActor
public extension EnvironmentValues {
    var markdownAccessibility: MarkdownAccessibility {
        get { self[MarkdownAccessibilityKey.self] }
        set { self[MarkdownAccessibilityKey.self] = newValue }
    }
}
