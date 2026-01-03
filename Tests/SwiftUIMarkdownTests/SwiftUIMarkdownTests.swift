//
//  SwiftUIMarkdownTests.swift
//  SwiftUIMarkdownTests
//
//  Created by Sune Riedel on 31/12/2025.
//

import XCTest
@testable import SwiftUIMarkdown

final class SwiftUIMarkdownTests: XCTestCase {
    func testParsingHeaders() {
        let parser = MarkdownParser()
        let result = parser.parse("# Title")
        XCTAssertEqual(result.first?.content, "# Title")
    }

    func testRenderingMarkdownView() {
        let view = MarkdownView(text: "Hello *world*")
        XCTAssertNotNil(view.body)
    }
}
