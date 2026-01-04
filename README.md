# SwiftUIMarkdown

A SwiftUI library for rendering Markdown natively — no WebViews required.

This package uses Apple's [`swift-markdown`](https://github.com/swiftlang/swift-markdown) to parse Markdown into an AST, then renders that AST with pure SwiftUI views.

---

## Features

- **Native SwiftUI rendering** — no WebView overhead or security concerns
- **CommonMark support** — headings, paragraphs, emphasis (bold/italic), strikethrough, links, images, lists (ordered & unordered), blockquotes, code (inline & fenced), thematic breaks, and more
- **Environment-driven customization** — easily override fonts, colors, and bullet styles via SwiftUI modifiers
- **Accessibility built-in** — VoiceOver support with customizable list announcements
- **Cross-platform** — works on iOS, iPadOS, macOS, watchOS, and visionOS

---

## Requirements

- Swift 6.0+
- SwiftUI (iOS 15+, macOS 12+, watchOS 8+, visionOS 1+)
- [Swift Markdown](https://github.com/swiftlang/swift-markdown) (included as a dependency)

---

## Installation

### Swift Package Manager (Xcode)

1. In Xcode, go to **File → Add Packages…**
2. Enter the repository URL for SwiftUIMarkdown
3. Select the version or branch you want
4. Add the `SwiftUIMarkdown` product to your target

### Swift Package Manager (Package.swift)

Add SwiftUIMarkdown to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/SwiftUIMarkdown.git", from: "0.1.0")
]

