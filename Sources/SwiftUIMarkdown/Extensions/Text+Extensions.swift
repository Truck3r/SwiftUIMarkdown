//
//  Text+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//
import SwiftUI

extension Text {
    /// Appends a `Text` view to another using compound assignment.
    ///
    /// This operator allows you to concatenate `Text` views in place,
    /// similar to how `+=` works with strings.
    ///
    /// ```swift
    /// var message = Text("Hello, ")
    /// message += Text("World!")
    /// // message now displays "Hello, World!"
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The `Text` view to append to.
    ///   - rhs: The `Text` view to append.
    static func += (lhs: inout SwiftUI.Text, rhs: SwiftUI.Text) {
        lhs = lhs + rhs
    }
}
