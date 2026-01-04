//
//  Text+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//
import SwiftUI

extension Text {
    static func += (lhs: inout SwiftUI.Text, rhs: SwiftUI.Text) {
        lhs = lhs + rhs
    }
}
