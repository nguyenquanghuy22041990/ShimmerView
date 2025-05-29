//
//  ShimmerView.swift
//  ShimmerView
//
//  Created by Huy Quang Nguyen on 5/29/25.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ShimmerView: View {
    @State private var isAnimating = false
    
    public init() {}
    
    
    public var body: some View {
        GeometryReader { geometry in
                    Color.gray
                        .opacity(0.3)
                        .overlay(
                            GradientMask()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.clear, .white.opacity(0.6), .clear]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .rotationEffect(.degrees(30))
                                .offset(x: isAnimating ? geometry.size.width : -geometry.size.width)
                                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: isAnimating)
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
                .clipped()
    }
}

private struct GradientMask: Shape {
    @available(iOS 13.0, *)
    func path(in rect: CGRect) -> Path {
        Path(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
    }
}
