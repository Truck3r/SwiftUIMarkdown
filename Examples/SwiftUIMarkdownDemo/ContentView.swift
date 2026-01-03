//
//  ContentView.swift
//  SwiftUIMarkdownDemo
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import SwiftUIMarkdown

struct ContentView: View {
    var body: some View {
        MarkdownView("""
        # SwiftUIMarkdown
        **Hello, world!**
        `code here`
        - _Works_ **_natively_ in** ~Objective-C~ SwiftUI
        [hest](https://google.com "Description")
        > 3. noget
        """)
        .padding()
    }
}

#Preview {
    VStack {
        ContentView()
    }
}
