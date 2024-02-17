//
//  OpaqueBackgroundModifier.swift
//  DesignSystem
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI

struct OpaqueBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.4, *) {
            content.presentationBackground(DesignSystemAsset.detailBackground.swiftUIColor.opacity(0.9))
        } else {
            content.background(OpaqueView())
        }
    }
}

private struct OpaqueView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = UIColor(DesignSystemAsset.detailBackground.swiftUIColor).withAlphaComponent(0.9)
        }
    }
}

extension View {
    public func opaqueBackground() -> some View {
        self.modifier(OpaqueBackgroundModifier())
    }
}
