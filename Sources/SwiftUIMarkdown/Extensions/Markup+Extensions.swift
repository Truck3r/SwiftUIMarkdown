//
//  Markup+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//

import SwiftUI
import Markdown

extension Markup {
    /// The simple type name of this markup element.
    ///
    /// Extracts the type name from the markup element's string representation
    /// by splitting on the first parenthesis. For example, a `Paragraph` element
    /// would return `"Paragraph"`.
    var typeName: String {
        guard let split = "\(self)".split(separator: "(").first else {
            return "\(self)"
        }
        return "\(split)"
    }

    /// A placeholder `Text` view indicating an unsupported markup element.
    ///
    /// Returns a gray-colored text view displaying the element's type name
    /// in brackets, such as `[Table]`. Use this to visually indicate
    /// markup elements that are not yet supported by the renderer.
    var unsupported: SwiftUI.Text {
        SwiftUI.Text("[\(typeName)]").foregroundColor(.gray)
    }
}
