//
//  MarkdownTestView.swift
//  SwiftUIMarkdownDemo
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import SwiftUIMarkdown

struct MarkdownTestView: View {
    var body: some View {
        List {
            ForEach(testData, id: \.0) { test in
                NavigationLink(destination: InternalTextView(markdown: test.1).navigationTitle(test.0)) {
                    Text(test.0)
                }
            }
        }.navigationTitle("Markdown tests")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct InternalTextView: View {
    @State var markdown: String

    @State var edit: Bool = false

    @FocusState private var isEditorFocused: Bool

    var body: some View {
        VStack {
            Toggle(isOn: $edit) {
                Text("Edit")
            }.toggleStyle(.switch)
            ZStack {
                if edit {
                    TextEditor(text: $markdown)
                        .frame(minHeight: 150)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1)
                        )
                        .focused($isEditorFocused)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isEditorFocused = true
                            }
                        }
                } else {
                    ScrollView {
                        VStack(spacing: 4.0) {
                            MarkdownView(markdown)
                                .markdownStyle(linkColor: .black)
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}

// swiftlint:disable line_length
let testData: [(String, String)] = [
    ("Headings", "# Heading 1\n## Heading 2\n### Heading 3\n#### Heading 4\n##### Heading 5\n###### Heading 6\n---\n# Level 1 *Heading* with **bold**\n## Level 2 *Heading* med *italic*\n### Level 3 *Heading* with `inline code`\n\n#### Level 4 *Heading* with ~~strikethrough~~\n##### Level 5 *Heading* **with** a [link](https://example.com)\n###### Level 6 *Heading* with inline image ![ikon](https://icons.iconarchive.com/icons/icojam/matreshka/48/red-matreshka-inside-icon-icon.png)"),
    ("Paragraphs and breaks", "This is a\nparagraph with  \na line break (two spaces at the end of the line).\n\nThis is a ~~another~~ paragraph.\n\nHere is yet another paragraph, which has a *bit* **more _text_ than** the other one."),
    ("Styling", "- *Italic by asterisk*\n- _Italic by underscore_\n- **Bold by double asterisk**\n- __Bold by double underscore__\n- ***Bold italic by triple asterisk***\n- ~~Strikethrough~~\n\nNormal text with **bold _inline italic_ inside**.  \nMix of ~~strikethrough and *italic*~~.  \nEscaped asterisk: \\*\\*not bold\\*\\*"),
    ("Links", "## 1. Inline Links\n\nInline links are the simplest type of Markdown link — you define both the text and URL together.\n\nThis is an [inline link](https://www.example.com).\n\nVisit [OpenAI](https://www.openai.com \"Go to OpenAI's website\") for more info.\n\nThis is a [shortcut reference].\n\n[shortcut reference]: https://www.markdownguide.org\n\nAutomatic Links\n\n<https://www.github.com>\n\n<email@example.com>\n\nImages as Links\n\n[![OpenAI Logo](https://upload.wikimedia.org/wikipedia/commons/4/4a/OpenAI_Logo.svg)](https://www.openai.com)"),
    ("VoiceOver test", "### Unnumbered\n\n- Bullet 1\n- Bullet 1.5 with a very long text, making it span several lines\n- Bullet 2\nMore text"),
    ("Unnumbered lists", "### Unnumbered\n\n- Bullet 1\n- Bullet 1.5 with a very long text, making it span several lines\n- Bullet 2\n  - Subbullet 2a  \n    more lines\n  - Subbullet 2b\n    - Sub-subbullet\n      - Sub-sub-subbullet\n        - Sub-sub-sub-subbullet\n        - Sub-sub-sub-subbullet\n\n---\n\n- Bullet 1\n\n- Bullet 1.5 with a very long text, making it span several lines\n- Bullet 2\n  - Subbullet 2a    \nmore lines\n  - Subbullet 2b\n    - Sub-subbullet\n      - Sub-sub-subbullet\n        - Sub-sub-sub-subbullet"),
    ("Numbered lists", "### Numbered\n99999. First\n100000. Second\n   1. Sub-second\n   2. Sub-second\n      1. Sub-Sub-99\n      2. Sub-Sub-100\n3. Third\n\n### Mixed\n- Bullet\n  1. Numbered inside bullet\n  2. Another one"),
    ("Images", "### Images\n\n- Inlined:\n\n![Alt tekst](https://upload.wikimedia.org/wikipedia/commons/b/bf/Test_card.png)\n\n- Inline:\n\nHere is a text  ![smiley](data:image/png;base64,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) with a base64 inlined images. That was simple.")
]
// swiftlint:enable line_length

#Preview {
    NavigationView {
        MarkdownTestView()
    }
}
