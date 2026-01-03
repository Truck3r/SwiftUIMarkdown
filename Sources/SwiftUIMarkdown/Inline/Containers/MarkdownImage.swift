//
//  MarkdownImage.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

@MainActor
extension Markdown.Image: MarkdownInline, MarkdownInlineContainer {
    @ViewBuilder
    var view: SwiftUI.Text {
        internalText
    }

    private var internalText: SwiftUI.Text {
        if let image {
            SwiftUI.Text(Image(uiImage: image))
        } else {
            unsupported
        }
    }

    private var image: UIImage? {
        guard let source else {
            return nil
        }
        var data: Data?
        if source.starts(with: "http") {
            // support for http/https referenced image
            if let url = URL(string: source) {
                data = try? Data(contentsOf: url)
            }
        } else {
            // support for inline base64 encoded image
            // If the string contains "base64,", strip everything before it
            let cleanBase64: String
            if let range = source.range(of: "base64,") {
                cleanBase64 = String(source[range.upperBound...])
            } else {
                cleanBase64 = source
            }
            // Decode and create the image
            data = Data(base64Encoded: cleanBase64)
        }

        guard let data, let image = UIImage(data: data) else {
            assertionFailure("❌ Could not create UIImage from data")
            return nil
        }
        return image
    }
}
