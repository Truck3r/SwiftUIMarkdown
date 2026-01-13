//
//  SwiftUIMarkdownDemoApp.swift
//  SwiftUIMarkdownDemo
//
//  Created by Sune Riedel on 31/12/2025.
//

import SwiftUI

import SwiftUIMarkdown

@main
struct SwiftUIMarkdownDemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
            .environment(\.markdownAccessibility, MarkdownAccessibility(listBegin: { "list start" }, listCounter: { "\($0) of \($1)" }, listEnd: { "list end" }))
            .environment(\.markdownDebug, true)

        }
    }
}
