//
//  PhotoGridItemView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/1/24
//

import Foundation
import SwiftUI

struct PhotoGridItemView: View {
    let width: Int
    let height: Int
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                Color.gray20
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
