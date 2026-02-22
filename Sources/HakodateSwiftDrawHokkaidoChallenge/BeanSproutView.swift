//
//  BeanSproutView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

// もやし：白くて細長い形
struct BeanSproutView: View {
    var body: some View {
        Capsule()
            .fill(Color(white: 0.96)) // ほぼ白
            .frame(width: 4, height: 40)
            // 根っこの部分を少し色付け
            .overlay(
                Circle()
                    .fill(Color(white: 0.9))
                    .frame(width: 4, height: 4)
                    .offset(y: 18)
            )
            .shadow(radius: 0.5)
    }
}

#Preview {
    BeanSproutView()
        .preferredColorScheme(.dark)
}
