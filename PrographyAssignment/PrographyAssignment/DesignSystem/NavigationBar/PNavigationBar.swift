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
    
    init(
        isLogo: Bool,
        title: String? = nil,
        isBookmarked: Bool = false
    ) {
        self.isLogo = isLogo
        self.title = title
        self.isBookmarked = isBookmarked
    }
    
    var body: some View {
        ZStack {
            if (isLogo) {
                Image("logo")
                    .frame(maxWidth: .infinity)
            } else {
                HStack(spacing: 0) {
                    Button {
                        // TODO: Navigate To Back
                    } label : {
                        Image("x")
                            .padding(8)
                            .background(Circle().foregroundColor(.white))
                            .padding(.trailing, 16)
                    }
                    HStack {
                        Text(title ?? "-")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.trailing,8)
                    Image("download")
                        .padding(10)
                        .padding(.trailing,4)
                    Image("bookmark")
                        .opacity(isBookmarked ? 0.3 : 1.0)
                        .padding(10)
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
