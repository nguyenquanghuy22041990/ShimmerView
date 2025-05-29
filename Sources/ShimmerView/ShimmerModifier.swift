//
//  ShimmerModifier.swift
//  ShimmerView
//
//  Created by Huy Quang Nguyen on 5/29/25.
//

import SwiftUI

public struct ShimmerModifier: ViewModifier {
    public init() {}
    
    @available(iOS 13.0.0, *)
    public func body(content: Content) -> some View {
        content.overlay(ShimmerView().mask(content))
    }
}

@available(iOS 13.0, *)
public extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
