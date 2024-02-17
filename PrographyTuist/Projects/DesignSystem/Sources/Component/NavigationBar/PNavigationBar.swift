//
//  PNavigationBar.swift
//  DesignSystem
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI

public struct PNavigationBar: View {
    let isLogo: Bool
    let title: String?
    let isBookmarked: Bool
    let leadingButtonAction: (() -> Void)?
    let bookmarkButtonAction: (() -> Void)?
    
    public init(
        isLogo: Bool,
        title: String? = nil,
        isBookmarked: Bool = false,
        buttonAction: (() -> Void)? = nil,
        bookmarkButtonAction: (() -> Void)? = nil
    ) {
        self.isLogo = isLogo
        self.title = title
        self.isBookmarked = isBookmarked
        self.leadingButtonAction = buttonAction
        self.bookmarkButtonAction = bookmarkButtonAction
    }
    
    public var body: some View {
        ZStack {
            if (isLogo) {
                DesignSystemAsset.logo.swiftUIImage
                    .frame(maxWidth: .infinity)
            } else {
                HStack(spacing: 0) {
                    Button {
                        if let buttonAction = leadingButtonAction {
                            buttonAction()
                        }
                    } label : {
                        DesignSystemAsset.x.swiftUIImage
                            .padding(8)
                            .background(Circle().foregroundColor(DesignSystemAsset.white.swiftUIColor))
                    }
                    Spacer()
                        .frame(width: 16)
                    HStack {
                        Text(title ?? "-")
                            .font(.system(size: 20, weight: .bold))
                            .lineLimit(1)
                            .foregroundStyle(DesignSystemAsset.white.swiftUIColor)
                        Spacer()
                    }
                    .padding(.trailing,8)
                    DesignSystemAsset.download.swiftUIImage
                        .padding(10)
                        .padding(.trailing,4)
                    Button {
                        if let bookmarkButtonAction = bookmarkButtonAction {
                            bookmarkButtonAction()
                        }
                    } label: {
                        DesignSystemAsset.bookmark.swiftUIImage
                            .opacity(isBookmarked ? 0.3 : 1.0)
                            .padding(10)
                    }
                    
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(height: 56)
    }
}
