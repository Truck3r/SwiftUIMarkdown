# SwiftUIMarkdown

A SwiftUI library for rendering Markdown natively — no WebViews required.
> This package uses Apple’s `Markdown` (Swift Markdown) types to parse Markdown into an AST, and renders that AST with pure SwiftUI views.

---

## Features

- Native SwiftUI rendering (no WebView)
- Supports headings, paragraphs, inline emphasis, lists, links, images, thematic breaks, and more (depending on what blocks are implemented)
- Environment-driven customization via **modifiers**:
  - `markdownFonts(...)` (font set for body + headings)
  - `markdownStyle(...)` (link color + bullet characters)
  - `Environment(\.markdownAccessibility, ...)` (VoiceOver/list announcements)

---

## Installation

Add SwiftUIMarkdown using Swift Package Manager.

- In Xcode: **File → Add Packages…**
- Paste the repository URL
- Add the `SwiftUIMarkdown` product to your target

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

