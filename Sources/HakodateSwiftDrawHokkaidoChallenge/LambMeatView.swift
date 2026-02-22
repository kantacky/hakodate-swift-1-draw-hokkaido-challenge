//
//  LambMeatView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

// ラム肉：少し赤みのある楕円形
struct LambMeatView: View {
    // 肉の色（赤身と少しの脂）
    let meatGradient = LinearGradient(
        colors: [Color(red: 0.8, green: 0.3, blue: 0.3), Color(red: 0.9, green: 0.5, blue: 0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        Ellipse()
            .fill(meatGradient)
            .overlay(
                // 少し脂身（白い部分）をアクセントに追加
                Ellipse()
                    .fill(Color.white.opacity(0.4))
                    .frame(width: 15, height: 8)
                    .offset(x: 5, y: -4)
            )
            .frame(width: 45, height: 28)
            .shadow(radius: 1) // 少し浮かせて立体感を出す
    }
}

#Preview {
    LambMeatView()
}
