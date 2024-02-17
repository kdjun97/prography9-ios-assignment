//
//  PhotoGridItemView.swift
//  DesignSystem
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI

public struct PhotoGridItemView: View {
    let width: Int
    let height: Int
    let url: String
    
    public init(width: Int, height: Int, url: String) {
        self.width = width
        self.height = height
        self.url = url
    }
    
    public var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                DesignSystemAsset.gray20.swiftUIColor
                ProgressView()
            }
        }
        .aspectRatio(
            CGSize(
                width: width,
                height: height
            ),
            contentMode: .fill
        )
    }
}
