//
//  Markup+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//

import SwiftUI
import Markdown

extension Markup {
    var typeName: String {
        guard let split = "\(self)".split(separator: "(").first else {
            return "\(self)"
        }
        return "\(split)"
    }

    var unsupported: SwiftUI.Text {
        SwiftUI.Text("[\(typeName)]").foregroundColor(.gray)
    }
}
