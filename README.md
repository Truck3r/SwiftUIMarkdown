# SwiftUIMarkdown

A SwiftUI library for rendering Markdown natively — no WebViews required.  
This package uses Apple’s [`Markdown`](https://github.com/swiftlang/swift-markdown) (Swift Markdown) types to parse Markdown into an AST, and renders that AST with pure SwiftUI views.

---

## Features

- Native SwiftUI rendering (no WebView)
- Renders common Markdown blocks/inlines such as headings, paragraphs, emphasis, lists, links, images, and thematic breaks (depending on what’s implemented in this package)
- Environment-driven customization via **SwiftUI modifiers**:
  - `markdownFonts(...)` — customize body + heading fonts
  - `markdownStyle(...)` — customize link color + list bullets
  - `Environment(\.markdownAccessibility, ...)` — customize VoiceOver list announcements

---

## Requirements

- SwiftUI (iOS, iPadOS, macOS, etc. depending on your app)
- Swift Markdown (`import Markdown`) is used internally for parsing

---

## Installation (Swift Package Manager)

### Xcode
1. **File → Add Packages…**
2. Paste the repository URL
3. Add the `SwiftUIMarkdown` product to your target

---

## Basic usage

Render a Markdown string using `MarkdownView`:

```swift
import SwiftUI
import SwiftUIMarkdown

struct ContentView: View {
    var body: some View {
        ScrollView {
            MarkdownView("""
            # SwiftUIMarkdown
            **Hello, world!**
            `code here`

            - _Works_ **natively** in SwiftUI
            - No WebViews
            [OpenAI](https://openai.com "OpenAI Homepage")
            """)
            .padding()
        }
    }
}
