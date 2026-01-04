//
//  SwiftUIMarkdownTests.swift
//  SwiftUIMarkdownTests
//
//  Created by Sune Riedel on 31/12/2025.
//

import XCTest
@testable import SwiftUIMarkdown

final class SwiftUIMarkdownTests: XCTestCase {
    @MainActor
    func testRenderingMarkdownView() {
        let view = MarkdownView("Hello *world*")
        XCTAssertNotNil(view.body)
    }
}
