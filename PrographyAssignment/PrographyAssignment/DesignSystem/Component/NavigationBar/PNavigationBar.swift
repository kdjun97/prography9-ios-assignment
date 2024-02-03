//
//  PNavigationBar.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import SwiftUI

struct PNavigationBar: View {
    let isLogo: Bool
    let title: String?
    let isBookmarked: Bool
    let leadingButtonAction: (() -> Void)?
    let bookmarkButtonAction: (() -> Void)?
    
    init(
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
    
    var body: some View {
        ZStack {
            if (isLogo) {
                Image("logo")
                    .frame(maxWidth: .infinity)
            } else {
                HStack(spacing: 0) {
                    Button {
                        if let buttonAction = leadingButtonAction {
                            buttonAction()
                        }
                    } label : {
                        Image("x")
                            .padding(8)
                            .background(Circle().foregroundColor(.white))
                    }
                    Spacer()
                        .frame(width: 16)
                    HStack {
                        Text(title ?? "-")
                            .font(.system(size: 20, weight: .bold))
                            .lineLimit(1)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.trailing,8)
                    Image("download")
                        .padding(10)
                        .padding(.trailing,4)
                    Button {
                        if let bookmarkButtonAction = bookmarkButtonAction {
                            bookmarkButtonAction()
                        }
                    } label: {
                        Image("bookmark")
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

#Preview {
    PNavigationBar(isLogo: true)
}
