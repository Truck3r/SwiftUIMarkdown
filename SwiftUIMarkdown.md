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
```

---

## Customization

SwiftUIMarkdown uses SwiftUI's environment system for customization, making it easy to style Markdown content using familiar modifier patterns.

### Font Customization

Use `.markdownFonts(...)` to customize the fonts for body text and all six heading levels:

```swift
MarkdownView(content)
    .markdownFonts(
        body: .body,
        heading1: .largeTitle,
        heading2: .title,
        heading3: .title2,
        heading4: .title3,
        heading5: .headline,
        heading6: .subheadline
    )
```

You can override only the fonts you need — unspecified fonts inherit from the environment or use defaults:

```swift
MarkdownView(content)
    .markdownFonts(heading1: .system(size: 36, weight: .black))
```

### Style Customization

Use `.markdownStyle(...)` to customize link colors and bullet characters:

```swift
MarkdownView(content)
    .markdownStyle(
        linkColor: .purple,
        bullets: "→-*"
    )
```

### Link Color

The linkColor parameter sets the color for all hyperlinks in the rendered Markdown. The default is `.blue`.

### Bullet Characters

The bullets parameter is a string where each character represents the bullet for a nesting level:

• First character: top-level list items
• Second character: second-level nested items
• Third character: third-level nested items
• And so on...

If the nesting level exceeds the number of characters provided, the last character is repeated.

Default bullets: "•◦▪︎▫"

Example with custom bullets:
```swift
MarkdownView("""
- First level
  - Second level
    - Third level
      - Fourth level
""")
.markdownStyle(bullets: "→○■□")
```

---

## Accessibility

SwiftUIMarkdown includes built-in VoiceOver support. You can customize how lists are announced to screen readers using the `markdownAccessibility` environment value:

```swift
MarkdownView(content)
    .environment(\.markdownAccessibility, MarkdownAccessibility(
        listBegin: { "Beginning of list" },
        listCounter: { index, total in "Item \(index) of \(total)" },
        listEnd: { "End of list" }
    ))
```

### MarkdownAccessibility Properties

| Property    | Description                                      | Example Output        |
|-------------|--------------------------------------------------|-----------------------|
| listBegin   | Announced when entering a list                   | "Beginning of list"   |
| listCounter | Announced for each item (receives index & total) | "Item 2 of 5"         |
| listEnd     | Announced when exiting a list                    | "End of list"         |

This is particularly useful for localization — you can provide translated strings for different languages.

---

## Handling Links

Links in Markdown are rendered as tappable text. You can customize link handling using SwiftUI's openURL environment action:

```swift
MarkdownView("[Visit Example](https://example.com)")
    .environment(\.openURL, OpenURLAction { url in
        print("User tapped: \(url)")
        // Return .handled to prevent default behavior
        // Return .systemAction to use default browser
        return .systemAction
    })
```

---

## Debugging

Enable debug mode to visualize view boundaries:

```swift
MarkdownView(content)
    .environment(\.markdownDebug, true)
```

This overlays a semi-transparent yellow background on the `MarkdownView`, which can help diagnose layout issues.

---

## Supported Markdown Elements

| Element              | Markdown Syntax                    | Supported |
|----------------------|------------------------------------|-----------|
| Headings             | # H1 through ###### H6             | ✅        |
| Paragraphs           | Plain text with blank lines        | ✅        |
| Bold                 | **text** or __text__               | ✅        |
| Italic               | *text* or _text_                   | ✅        |
| Strikethrough        | ~~text~~                           | ✅        |
| Inline Code          | `code`                             | ✅        |
| Links                | [text](url) or [text](url "title") | ✅        |
| Images               | ![alt](url)                        | 🚧        |
| Unordered Lists      | - item or \* item                  | ✅        |
| Ordered Lists        | 1. item                            | ✅        |
| Nested Lists         | Indented list items                | ✅        |
| Thematic Breaks      | ---, \*\*\*, or \_\_\_             | ✅        |
| Blockquotes          | > quote                            | ❌        |
| Fenced Code Blocks   | \`\`\`...\`\`\`                    | ❌        |
| Tables               | GFM table syntax                   | ❌        |
| Task Lists           | `- [x] done` / `- [ ] todo`        | ❌        |
| Inline HTML          | <..>                               | ❌        |

✅ = Fully supported | 🚧 = Partial support | ❌ Not supported

---

## Example: Full Customization

Here's an example combining multiple customization options:

```swift
import SwiftUI
import SwiftUIMarkdown

struct StyledMarkdownView: View {
    let markdown = """
    # Welcome to SwiftUIMarkdown
    
    This library renders **Markdown** _natively_ in SwiftUI.
    
    ## Features
    
    - No WebViews required
    - Full accessibility support
    - Customizable fonts and colors
    
    ### Links
    
    Check out [Apple Developer](https://developer.apple.com) for more SwiftUI resources.
    
    ---
    
    > Built with ❤️ using Swift
    """
    
    var body: some View {
        ScrollView {
            MarkdownView(markdown)
                .padding()
        }
        .markdownFonts(
            body: .system(.body, design: .serif),
            heading1: .system(size: 32, weight: .bold, design: .serif),
            heading2: .system(size: 24, weight: .semibold, design: .serif),
            heading3: .system(size: 20, weight: .medium, design: .serif)
        )
        .markdownStyle(
            linkColor: .orange,
            bullets: "◆◇•"
        )
        .environment(\.markdownAccessibility, MarkdownAccessibility(
            listBegin: { "List:" },
            listCounter: { idx, total in "\(idx) of \(total)" },
            listEnd: { "List complete" }
        ))
    }
}
```

---

## Architecture

SwiftUIMarkdown is built around a simple architecture:

1. **Parsing**: Markdown text is parsed using Apple's [`swift-markdown](https://github.com/swiftlang/swift-markdown) library into an AST (Abstract Syntax Tree)
2. **Rendering**: The `BlockView` recursively walks the AST and renders each node as a SwiftUI view
3. **Styling**: Environment values (`MarkdownFonts`, `MarkdownStyle`, `MarkdownAccessibility`) flow down the view hierarchy to customize rendering

This design means:
- No WebView overhead or security concerns
- Native text rendering with full font and color support
- Seamless integration with SwiftUI's layout system
- Built-in accessibility without extra work

---

## Contributing

Contributions are welcome! If you'd like to add support for additional Markdown elements or improve existing functionality, please open an issue or submit a pull request.

---

## License

SwiftUIMarkdown is available under the MIT License. See the LICENSE file for more information.

