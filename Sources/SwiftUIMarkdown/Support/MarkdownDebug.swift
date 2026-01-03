//
//  MarkdownDebug.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

// - MARK: Environment setup
struct MarkdownDebugKey: EnvironmentKey {
    static let defaultValue = false
}

@MainActor
public extension EnvironmentValues {
    var markdownDebug: Bool {
        get { self[MarkdownDebugKey.self] }
        set { self[MarkdownDebugKey.self] = newValue }
    }
}
