//
//  CellTitleView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/1/24
//

import Foundation
import SwiftUI

struct CellTitleView: View {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .padding(.leading, 20)
            Spacer()
        }
        .frame(height: 43)
    }
}
