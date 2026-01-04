//
//  MarkdownImage.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import Markdown

/// An extension that provides SwiftUI view rendering for Markdown images.
///
/// This extension enables `Markdown.Image` elements to be rendered as SwiftUI `Text` views
/// containing embedded images. It supports two image source formats:
///
/// - **Remote images**: URLs starting with `http` or `https`
/// - **Base64-encoded images**: Inline data URIs or raw Base64 strings
///
/// ## Usage
///
/// The extension conforms to ``MarkdownInline`` and ``MarkdownInlineContainer``,
/// allowing Markdown images to be seamlessly integrated into the inline rendering pipeline.
///
/// ## Limitations
///
/// - Remote images are currently fetched synchronously on the main thread, which can
///   cause UI blocking. This should be addressed in a future update.
/// - Local file paths are not supported.
///
@MainActor
extension Markdown.Image: MarkdownInline, MarkdownInlineContainer {
    /// The SwiftUI `Text` view representing this Markdown image.
    ///
    /// Returns a `Text` view containing the rendered image, or an unsupported
    /// placeholder if the image cannot be loaded.
    @ViewBuilder
    var view: SwiftUI.Text {
        internalText
    }

    /// Creates the internal `Text` representation of the image.
    ///
    /// - Returns: A `Text` view with the embedded image, or an unsupported placeholder
    ///   if the image is `nil`.
    private var internalText: SwiftUI.Text {
        if let image {
            SwiftUI.Text(Image(uiImage: image))
        } else {
            unsupported
        }
    }

    /// Attempts to load the image from the source URL or Base64 data.
    ///
    /// This property handles two types of image sources:
    ///
    /// 1. **HTTP/HTTPS URLs**: Fetches the image data synchronously from the remote URL.
    ///    > Warning: This operation blocks the main thread and should be refactored
    ///    > to use asynchronous loading.
    ///
    /// 2. **Base64-encoded data**: Decodes the Base64 string, automatically stripping
    ///    any data URI prefix (e.g., `data:image/png;base64,`).
    ///
    /// - Returns: A `UIImage` if the source can be successfully decoded, or `nil` if
    ///   the source is missing, invalid, or the data cannot be converted to an image.
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
