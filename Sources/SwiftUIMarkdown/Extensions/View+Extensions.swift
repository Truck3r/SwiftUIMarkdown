//
//  View+Extensions.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 04/01/2026.
//
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
