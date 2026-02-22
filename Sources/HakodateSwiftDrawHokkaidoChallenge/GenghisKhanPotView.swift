//
//  GenghisKhanPotView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

struct GenghisKhanPotView: View {
    var body: some View {
        ZStack {
            // 1. 鍋の外枠と縁（ベース）
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.black, .gray],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: 10)

            // 2. 中央のドーム部分（グラデーションで立体感を出す）
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [Color(white: 0.3), .black]),
                        center: .center,
                        startRadius: 5,
                        endRadius: 120
                    )
                )
                .scaleEffect(0.8)

            // 3. 放射状のスリット（溝）
            SlitShape(count: 12)
                .stroke(Color.black.opacity(0.6), lineWidth: 3)
                .scaleEffect(0.75)

            // 4. 取っ手（左右のハンドル）
            HStack {
                HandleShape()
                    .rotation(Angle(degrees: 180))
                Spacer().frame(width: 280)
                HandleShape()
            }
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    GenghisKhanPotView()
}
