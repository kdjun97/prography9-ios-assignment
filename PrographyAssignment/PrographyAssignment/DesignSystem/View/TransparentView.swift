//
//  TransparentView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/30/24
//

import Foundation
import SwiftUI

struct TransparentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = .black90.withAlphaComponent(0.5)
        }
    }
}
