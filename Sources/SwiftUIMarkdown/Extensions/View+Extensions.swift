//
//  View+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//
import SwiftUI

extension View {
    /// Conditionally applies a transformation to the view.
    ///
    /// Use this modifier to apply a transformation only when a condition is met,
    /// while leaving the view unchanged when the condition is false.
    ///
    /// ```swift
    /// Text("Hello, World!")
    ///     .if(isHighlighted) { view in
    ///         view.foregroundStyle(.yellow)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - condition: A Boolean value that determines whether to apply the transformation.
    ///   - transform: A closure that takes the current view and returns a modified view.
    ///
    /// - Returns: Either the transformed view if `condition` is `true`,
    ///   or the original view if `condition` is `false`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
